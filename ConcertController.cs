using System.Diagnostics;
using System.IdentityModel.Tokens.Jwt;
using Entities.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using BLL.Interfaces;
using Microsoft.Extensions.Logging;

namespace ExamProject.Controllers;

public class ConcertController : Controller
{
    private readonly IConcertService _concertService;
    private readonly ILogger<ConcertController> _logger;

    public ConcertController(IConcertService concertService, ILogger<ConcertController> logger)
    {
        _concertService = concertService;
        _logger = logger;
    }

    public IActionResult Concert(UserFilterOptions filterOptions, string filterdate)
    {
        ViewBag.Role = GetRole();
        filterOptions.Page ??= 1;
        filterOptions.PageSize = filterOptions.PageSize != 0 ? filterOptions.PageSize : 10;

        ViewBag.PageSize = filterOptions.PageSize;
        ViewBag.SortBy = filterOptions.SortBy;
        ViewBag.IsAsc = filterOptions.IsAsc;

        try
        {
            var concertvm = _concertService.GetFilteredConcerts(filterOptions, filterdate);

            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
                return PartialView("_ConcertPV", concertvm);

            return View(concertvm);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error loading concert list.");
            return StatusCode(500, "An error occurred while loading concerts.");
        }
    }

    [HttpPost]
    public IActionResult AddConcert(ConcertVM concertData)
    {
        if (concertData == null)
            return BadRequest(new { success = false, message = "Invalid. Could not get data." });

        try
        {
            _concertService.AddConcert(concertData);
            return Ok(new { success = true, message = "Concert added successfully!" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error adding concert.");
            return StatusCode(500, new { success = false, message = "Failed to add concert." });
        }
    }

    [HttpPost]
    public IActionResult UpdateConcert(ConcertVM concertData)
    {
        if (concertData == null)
            return BadRequest(new { success = false, message = "Invalid. Could not get data." });

        try
        {
            _concertService.UpdateConcert(concertData);
            return Ok(new { success = true, message = "Concert updated successfully!" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error updating concert.");
            return StatusCode(500, new { success = false, message = "Failed to update concert." });
        }
    }

    [HttpPost]
    public IActionResult DeleteConcert(int concertId)
    {
        if (concertId <= 0)
            return BadRequest(new { success = false, message = "Invalid concert ID." });

        try
        {
            _concertService.DeleteConcert(concertId);
            return Ok(new { success = true, message = "Concert deleted successfully!" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error deleting concert with ID: {ConcertId}", concertId);
            return StatusCode(500, new { success = false, message = "Failed to delete concert." });
        }
    }

    public IActionResult GetConcertByIdPartial(int concertId)
    {
        try
        {
            var concertData = _concertService.GetConcertById(concertId);
            if (concertData == null)
                return NotFound("Concert not found.");

            return PartialView("_EditConcertPV", concertData);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving concert data for ID: {ConcertId}", concertId);
            return StatusCode(500, "An error occurred while fetching concert data.");
        }
    }

    [Authorize]
    public IActionResult BookTicket()
    {
        try
        {
            var concerts = _concertService.GetAllConcerts();
            ViewBag.Concerts = concerts.Select(r => new SelectListItem
            {
                Value = r.ConcertId.ToString(),
                Text = r.Title
            }).ToList();

            return View();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error loading concerts for ticket booking.");
            return StatusCode(500, "An error occurred while loading concerts.");
        }
    }

    public string GetRole()
    {
        var handler = new JwtSecurityTokenHandler();
        var authToken = Request.Cookies["AuthToken"];
        if (string.IsNullOrEmpty(authToken))
            return string.Empty;

        try
        {
            var token = handler.ReadToken(authToken.Replace("Bearer ", "")) as JwtSecurityToken;
            return token?.Claims.FirstOrDefault(claim => claim.Type == "role")?.Value ?? string.Empty;
        }
        catch
        {
            return string.Empty;
        }
    }

    private int TryParseInt(object value)
    {
        return int.TryParse(value?.ToString(), out int result) ? result : 0;
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

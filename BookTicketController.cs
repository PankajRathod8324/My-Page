using System.Diagnostics;
using Entities.ViewModel;
using Microsoft.AspNetCore.Mvc;
using BLL.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text.Json.Nodes;
using Microsoft.Extensions.Logging;

namespace ExamProject.Controllers;

public class BookTicketController : Controller
{
    private readonly IBookTicketService _bookticketService;
    private readonly IConcertService _concertService;
    private readonly ILogger<BookTicketController> _logger;

    public BookTicketController(IBookTicketService bookticketService, IConcertService concertService, ILogger<BookTicketController> logger)
    {
        _bookticketService = bookticketService;
        _concertService = concertService;
        _logger = logger;
    }

    [HttpPost]
    public IActionResult CheckAvailability(BookTicketVM bookTicketdata)
    {
        if (bookTicketdata == null)
        {
            return BadRequest(new { success = false, message = "Invalid request data." });
        }

        try
        {
            if (_bookticketService.CheckAvailability(bookTicketdata))
            {
                var concert = _concertService.GetConcertById(bookTicketdata.ConcertId);
                if (concert == null)
                {
                    return NotFound(new { success = false, message = "Concert not found." });
                }

                return Ok(new
                {
                    success = true,
                    message = "Seats Are Available!",
                    perticket = concert.PerTicket,
                    discount = concert.Discount,
                    ticketprice = concert.TicketPrice,
                    maxcapacity = concert.TotalSeats,
                    concertId = concert.ConcertId
                });
            }
            else
            {
                return Ok(new { success = false, message = "Seats Are Not Available!" });
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error checking seat availability for ConcertId: {ConcertId}", bookTicketdata.ConcertId);
            return StatusCode(500, new { success = false, message = "Internal server error occurred." });
        }
    }

    [HttpPost]
    public IActionResult BookTicket([FromBody] JsonObject bookTicketdata)
    {
        if (bookTicketdata == null)
        {
            return BadRequest(new { success = false, message = "Invalid. Could not get data." });
        }

        try
        {
            _bookticketService.BookTicket(bookTicketdata);
            return Ok(new { success = true, message = "Booking Added Successfully!" });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred during ticket booking.");
            return StatusCode(500, new { success = false, message = "Failed to book the ticket. Please try again." });
        }
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

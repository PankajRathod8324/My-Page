using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Entities.ViewModel;
using System.IdentityModel.Tokens.Jwt;

namespace ExamProject.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return RedirectToAction("LoginPage", "Authentication");
    }

    [Authorize(Roles = "Admin")]
    public IActionResult AdminView()
    {
        return View();
    }
    [Authorize]
    public IActionResult Concert()
    {
        ViewBag.Role = GetRole(); 
        return View();
    }

    [Authorize(Roles = "Users")]
    public IActionResult UsersView()
    {
        return View();
    }

    public string GetRole()
    {
        var handler = new JwtSecurityTokenHandler();
        string authHeader = Request.Cookies["AuthToken"]!;
        string id = string.Empty;
        if (authHeader != null)
        {
            authHeader = authHeader.Replace("Bearer ", "");
            var jsonToken = handler.ReadToken(authHeader);
            var tokenS = handler.ReadToken(authHeader) as JwtSecurityToken;
            id = tokenS!.Claims.First(claim => claim.Type == "role").Value;
        }
        return id;
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

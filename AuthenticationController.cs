using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Entities.ViewModel;
using BLL.Interfaces;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ExamProject.Controllers;

public class AuthenticationController : Controller
{
    private readonly ILogger<AuthenticationController> _logger;
    private readonly IUserService _userService;

    public AuthenticationController(ILogger<AuthenticationController> logger, IUserService userService)
    {
        _logger = logger;
        _userService = userService;
    }

    [HttpGet("Loginpage")]
    public IActionResult LoginPage()
    {
        try
        {
            string? authHeader = Request.Cookies["AuthToken"];
            if (!string.IsNullOrEmpty(authHeader))
            {
                var handler = new JwtSecurityTokenHandler();
                var token = authHeader.Replace("Bearer ", "");
                var jwtToken = handler.ReadToken(token) as JwtSecurityToken;

                var roleClaim = jwtToken?.Claims.FirstOrDefault(c => c.Type == "role")?.Value;

                return roleClaim switch
                {
                    "Users" => RedirectToAction(nameof(HomeController.UsersView), "Home"),
                    "Admin" => RedirectToAction(nameof(HomeController.AdminView), "Home"),
                    _ => RedirectToAction(nameof(LoginPage))
                };
            }

            return View();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred while checking login token.");
            return RedirectToAction(nameof(LoginPage));
        }
    }

    [HttpPost("Loginpage")]
    public async Task<IActionResult> LoginPage(LoginVM model)
    {
        if (!ModelState.IsValid)
        {
            return View(model);
        }

        try
        {
            string token = _userService.AuthenticateUser(model.Email!, model.Password!);
            if (string.IsNullOrEmpty(token) || token == "null")
            {
                _logger.LogWarning("Login failed for email: {Email}", model.Email);
                ModelState.AddModelError(string.Empty, "Invalid email or password.");
                TempData["Message"] = "Password or Email is incorrect.";
                TempData["MessageType"] = "error";
                return View(model);
            }

            var user = _userService.GetUserByEmail(model.Email!);
            if (user == null)
            {
                _logger.LogWarning("User not found for email: {Email}", model.Email);
                ModelState.AddModelError(string.Empty, "User not found.");
                return View(model);
            }

            var cookieOptions = new CookieOptions
            {
                Expires = DateTime.UtcNow.AddMinutes(30),
                HttpOnly = true,
                Secure = true,
                SameSite = SameSiteMode.Strict
            };
            Response.Cookies.Append("AuthToken", token, cookieOptions);

            var handler = new JwtSecurityTokenHandler();
            var jwtToken = handler.ReadToken(token) as JwtSecurityToken;
            var claims = jwtToken?.Claims.ToList() ?? new List<Claim>();

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimsPrincipal);

            return user.RoleId switch
            {
                3 => RedirectToAction(nameof(HomeController.UsersView), "Home"),
                _ => RedirectToAction(nameof(HomeController.AdminView), "Home")
            };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Exception occurred while logging in user: {Email}", model.Email);
            TempData["Message"] = "An unexpected error occurred. Please try again.";
            TempData["MessageType"] = "error";
            return View(model);
        }
    }

    public async Task<IActionResult> Logout()
    {
        try
        {
            if (Request.Cookies["AuthToken"] != null)
            {
                Response.Cookies.Delete("AuthToken");
            }

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred during logout.");
        }

        return RedirectToAction(nameof(LoginPage));
    }

    [HttpGet("Register")]
    public IActionResult RegisterPage()
    {
        try
        {
            var roles = _userService.GetAllRoles();
            ViewBag.Roles = roles.Select(r => new SelectListItem
            {
                Value = r.RoleId.ToString(),
                Text = r.RoleName
            }).ToList();

            return View();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error fetching roles for registration.");
            TempData["Message"] = "Failed to load registration form.";
            return RedirectToAction(nameof(LoginPage));
        }
    }

    [HttpPost("Register")]
    public IActionResult Register(RegisterVM model)
    {
        if (model == null || !ModelState.IsValid)
        {
            TempData["Message"] = "Invalid registration data.";
            return RedirectToAction(nameof(RegisterPage));
        }

        try
        {
            _userService.Register(model);
            TempData["Message"] = "Registration successful!";
            TempData["MessageType"] = "success";
            return RedirectToAction(nameof(LoginPage));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error occurred during registration.");
            TempData["Message"] = "Registration failed. Please try again.";
            TempData["MessageType"] = "error";
            return RedirectToAction(nameof(RegisterPage));
        }
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

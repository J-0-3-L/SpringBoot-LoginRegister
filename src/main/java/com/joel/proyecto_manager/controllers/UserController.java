package com.joel.proyecto_manager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joel.proyecto_manager.models.User;
import com.joel.proyecto_manager.servicies.UserServicio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UserController {

  @Autowired
  private UserServicio userService;

  public UserController(UserServicio userService) {
    this.userService = userService;
  }

  @GetMapping("/")
    public String index(){
        return "home";
  }

  @GetMapping("/home")
  public String home(Model model, HttpSession session) {
    User current = userService.findUserById(
        (Long) session.getAttribute("user_id"));
    model.addAttribute("user", current);
    return "index";
  }

  // para ingresar usuario
  @GetMapping("/login")
  public String login() {
    return "login";
  }

  @PostMapping("/login")
  public String loginUser(
      @RequestParam("email") String email,
      @RequestParam("password") String password,
      Model model,
      HttpSession session) {
    if (!userService.authenticateUser(email, password)) {
      model.addAttribute("error", "Credenciales inválidas");
      return "login";
    }

    User authUser = userService.findByEmail(email);

    session.setAttribute("user_id", authUser.getId());
    return "redirect:/home";
  }

  // registro de usuario
  @GetMapping("/register")
  public String Register(@ModelAttribute("user") User user) {
    return "register";
  }

  @PostMapping("/register")
  public String createUser(
      @Valid @ModelAttribute("user") User user,
      BindingResult result,
      HttpSession session, Model model) {
    if (result.hasErrors()) {
      return "register";
    }
    User newUser = userService.registerUser(user);

    session.setAttribute("user_id", newUser.getId());
    model.addAttribute("user", newUser);
    return "redirect:/home";
  }

  // para cerrar usuario
  @GetMapping("/logout")
  public String logout(HttpSession session) {
    session.removeAttribute("user_id");
    return "redirect:/";
  }
}
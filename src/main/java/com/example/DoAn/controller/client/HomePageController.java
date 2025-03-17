package com.example.DoAn.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.DoAn.controller.admin.DashBoardController;
import com.example.DoAn.domain.User;
import com.example.DoAn.domain.dto.RegisterDTO;
import com.example.DoAn.service.UserService;

import jakarta.validation.Valid;

@Controller
public class HomePageController {

    private final UserService userService;

    public HomePageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    // @PostMapping("/register")
    // public String handleRegister(
    // @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
    // BindingResult bindingResult) {

    // // validate
    // if (bindingResult.hasErrors()) {
    // return "client/auth/register";
    // }

    // User user = this.userService.registerDTOtoUser(registerDTO);

    // String hashPassword = this.passwordEncoder.encode(user.getPassword());

    // user.setPassword(hashPassword);
    // user.setRole(this.userService.getRoleByName("USER"));
    // // save
    // this.userService.handleSaveUser(user);
    // return "redirect:/login";

    // }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

}

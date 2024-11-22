package vn.hoidanit.laptopshop.controller.auth;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.domain.dto.RegisterDTO;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class AuthController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public AuthController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("title_page", "Đăng nhập");
        return "auth/login";
    }

    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        model.addAttribute("title_page", "Đăng ký");
        return "auth/register";
    }

    @PostMapping("/register")
    public String registerPost(Model model, @ModelAttribute("registerDTO") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        User user = this.userService.registerDTOtoUser(registerDTO);

        if (bindingResult.hasErrors()) {
            model.addAttribute("title_page", "Đăng ký");
            return "auth/register";// Return to the form view if there are validation
        }
        user.setPassword(this.passwordEncoder.encode(user.getPassword()));
        this.userService.createUser(user);
        model.addAttribute("title_page", "Đăng nhập");
        return "redirect:/login";
    }

}

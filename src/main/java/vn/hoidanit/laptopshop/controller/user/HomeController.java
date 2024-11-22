package vn.hoidanit.laptopshop.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class HomeController {

    private final UserService userService;

    public HomeController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<User> users = this.userService.findAll();
        model.addAttribute("usersi", users);
        System.out.println("Users: " + users);
        return "client/home";
    }

    @GetMapping("/product-details")
    public String getProductDetails() {
        return "client/product/product-details";
    }

}

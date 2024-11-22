package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user")
    public String getHomePageUser(Model model) {
        List<User> users = this.userService.findAll();
        model.addAttribute("usersi", users);
        return "admin/user/index";
    }

    @GetMapping("/admin/user/create")
    public String createUser(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/store")
    public String storeUser(Model model, @ModelAttribute("newUser") @Valid User newUser, BindingResult bindingResult,
            @RequestParam("image") MultipartFile image) {

        if (bindingResult.hasErrors()) {
            return "admin/user/create";// Return to the form view if there are validation errors
        }

        String avatar = this.uploadService.handleUploadFile(image, "avatar");
        String hashPassword = this.passwordEncoder.encode(newUser.getPassword());
        newUser.setAvatar(avatar);
        newUser.setPassword(hashPassword);
        newUser.setRole(this.userService.getRoleByName(newUser.getRole().getName()));
        System.out.println("New user: " + newUser);
        this.userService.createUser(newUser);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/{id}")
    public String showUser(Model model, @PathVariable long id) {
        User users = this.userService.findById(id);
        model.addAttribute("id", id);
        model.addAttribute("user", users);
        return "admin/user/show";
    }

    @RequestMapping(value = "/admin/user/{id}/edit")
    public String editUser(Model model, @PathVariable long id) {
        User currenUser = this.userService.findById(id);
        model.addAttribute("id", id);
        model.addAttribute("user", currenUser);
        return "admin/user/edit";
    }

    @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
    public String updateUser(Model model, @ModelAttribute("user") User user) {
        User crUser = this.userService.findById(user.getId());
        if (crUser != null) {
            crUser.setEmail(user.getEmail());
            crUser.setFullName(user.getFullName());
            crUser.setAddress(user.getAddress());
            crUser.setPhone(user.getPhone());
            crUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            this.userService.updateUser(crUser);
        }
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/{id}/delete")
    public String deleteUser(Model model, @PathVariable long id) {
        this.userService.deleteUser(id);
        return "redirect:/admin/user";
    }
}

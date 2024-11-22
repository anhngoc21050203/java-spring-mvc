package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getHomePageProduct(Model model) {
        List<Product> products = this.productService.findAll();
        model.addAttribute("products", products);
        model.addAttribute("title_page", "Product Management");
        return "admin/product/index";
    }

    @GetMapping("/admin/product/create")
    public String createProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        model.addAttribute("title_page", "Create Product");
        return "admin/product/create";
    }

    @PostMapping("/admin/product/store")
    public String storeProduct(Model model, @ModelAttribute("newProduct") @Valid Product newProduct,
            BindingResult newProductBindingResult, @RequestParam("image_pr") MultipartFile image) {

        if (newProductBindingResult.hasErrors()) {
            model.addAttribute("title_page", "Create Product");
            return "admin/product/create";
        }
        String imageLink = this.uploadService.handleUploadFile(image, "products");
        newProduct.setImage(imageLink);
        model.addAttribute("title_page", "Create Product");
        this.productService.createProduct(newProduct);

        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}/edit")
    public String editProduct(Model model, @PathVariable long id) {
        Product product = this.productService.findById(id);
        model.addAttribute("product", product);
        model.addAttribute("title_page", "Edit Product");
        return "admin/product/edit";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("product") @Valid Product product,
            BindingResult productBindingResult, @RequestParam("image_pr") MultipartFile image) {
        if (productBindingResult.hasErrors()) {
            model.addAttribute("title_page", "Edit Product");
            return "admin/product/edit";
        }

        Product oldProduct = this.productService.findById(product.getId());

        if (!image.isEmpty()) {
            String imageLink = this.uploadService.handleUploadFile(image, "products");
            oldProduct.setImage(imageLink);
        }

        oldProduct.setName(product.getName());
        oldProduct.setPrice(product.getPrice());
        oldProduct.setQuantity(product.getQuantity());
        oldProduct.setDescription(product.getDescription());
        oldProduct.setShortDescription(product.getShortDescription());
        oldProduct.setFactory(product.getFactory());
        oldProduct.setTarget(product.getTarget());

        model.addAttribute("title_page", "Product Management");
        this.productService.createProduct(oldProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}/delete")
    public String deleteProduct(Model model, @PathVariable long id) {
        Product product = this.productService.findById(id);
        if (product.getImage() != null) {
            this.uploadService.deleteFile(product.getImage());
        }
        this.productService.deleteProduct(id);
        return "redirect:/admin/product";
    }
}

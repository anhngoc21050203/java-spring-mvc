package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> findAll() {
        return this.productRepository.findAll();
    }

    public Product findById(long id) {
        return this.productRepository.findById(id);
    }

    public Product createProduct(Product product) {
        product = this.productRepository.save(product);
        return product;
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

}

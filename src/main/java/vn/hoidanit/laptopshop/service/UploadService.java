package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {

    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleUploadFile(MultipartFile file, String path) {

        String fileName = "";
        String rootPath = this.servletContext.getRealPath("/resources/assets/images");
        try {
            byte[] imageBytes = file.getBytes();
            File dir = new File(rootPath + File.separator + path);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            String relativePath = path + File.separator + System.currentTimeMillis() + "-" + file.getOriginalFilename();
            fileName = rootPath + File.separator + relativePath;
            File serverFile = new File(fileName);

            BufferedOutputStream stream = new BufferedOutputStream(new java.io.FileOutputStream(serverFile));
            stream.write(imageBytes);
            stream.close();

            fileName = "/images/" + relativePath.replace("\\", "/");

        } catch (IOException e) {
            e.printStackTrace();
        }

        return fileName;
    }

}

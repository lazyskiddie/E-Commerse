package com.example.E_commerce;

import com.example.E_commerce.Admin.Repo.UserRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootApplication
public class ECommerceApplication {

	public static void main(String[] args) {

        // hardcoded values it is because it has only one role which is admin.
		ConfigurableApplicationContext ctx = SpringApplication.run(ECommerceApplication.class, args);
        UserRepository userRepo = ctx.getBean(UserRepository.class);
        PasswordEncoder Encoder = ctx.getBean(PasswordEncoder.class);

        if (userRepo.findByUsername("admin").isEmpty()) {
            AdminEntity admin = new AdminEntity();;
            admin.setUsername("UserName");
            admin.setPassword(Encoder.encode("Password"));
            userRepo.save(admin);
            System.out.println("Admin has been saved successfully");
        }else  {
            System.out.println("Admin already exists");
        }
	}

}

package com.rabbitmq.demo;

import com.rabbitmq.demo.vault.VaultConfigration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class AppApplication {

	public static void main(String[] args) {
		SpringApplication application = new SpringApplication(AppApplication.class);
		application.run(args);
	}
}

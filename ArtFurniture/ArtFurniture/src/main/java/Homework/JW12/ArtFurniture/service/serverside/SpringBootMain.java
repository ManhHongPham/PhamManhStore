package Homework.JW12.ArtFurniture.service.serverside;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Entrypoint cho Spring-Boot(Là class phải chứa @SpringBootApplication)
 * Spring-boot sẽ sử dụng class này để chạy.
 */
@SpringBootApplication
public class SpringBootMain {
	public static void main(String[] args) {
		SpringApplication.run(SpringBootMain.class, args);
	}
}

package Homework.JW12.ArtFurniture.service.serverside;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.github.slugify.Slugify;

public class Utilities {
	
	public static String seo(String text) {
		return new Slugify().slugify(text);
	}
	
	public static void main(String[] args) {
		System.out.println(new BCryptPasswordEncoder(4).encode("manh123"));;
	}
}

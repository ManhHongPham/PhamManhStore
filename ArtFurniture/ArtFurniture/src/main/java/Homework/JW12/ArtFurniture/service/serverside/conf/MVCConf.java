package Homework.JW12.ArtFurniture.service.serverside.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//-> là 1 bean mà spring hiểu được
//bean này dùng để cấu hình.
@Configuration
public class MVCConf implements WebMvcConfigurer {

//	public static String ROOT_UPLOAD_PATH = "D:/Java Web-Devpro/back end/ArtFurniture/ArtFurniture/upload/";
	public static String ROOT_UPLOAD_PATH = "D:/School/Java_Web Devpro/back end/ArtFurniture/ArtFurniture/upload/";
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {

		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/admin-resource/**").addResourceLocations("classpath:/admin-resource/");

		// cau hinh folder tren server chua cac file nguoi dung upload.
		//tim kiem anh tu database
		
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + ROOT_UPLOAD_PATH);
	}

	/**
	 * cấu hình cho MVC biết chỗ folder để lấy view trả về cho Browser
	 * 
	 * @return
	 */
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/"); // thư mục gốc chứa các file jsp.
		bean.setSuffix(".jsp"); // đuôi
		return bean;
	}
}

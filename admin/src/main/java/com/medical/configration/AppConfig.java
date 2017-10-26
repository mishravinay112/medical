package com.medical.configration;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages = "com.medical.*")
@PropertySource(value={"classpath:message.properties"})
public class AppConfig extends WebMvcConfigurerAdapter
{

@Override
public void addResourceHandlers(ResourceHandlerRegistry registry)
{
	registry.addResourceHandler("/WEB-INF/**").addResourceLocations("/WEB-INF/");
}

 @Override
 public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
  configurer.enable();
 }

 @Bean
 public MessageSource messageSource()
 {
	 ResourceBundleMessageSource messageSource=new ResourceBundleMessageSource();
	 messageSource.setBasename("message");
	 return messageSource;
 }
 
 @Bean
	public TilesViewResolver getTilesViewResolver() {
		TilesViewResolver tilesViewResolver = new TilesViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}

	@Bean
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		tilesConfigurer.setCheckRefresh(true);
		tilesConfigurer.setDefinitionsFactoryClass(TilesDefinitionsConfig.class);
		TilesDefinitionsConfig.addDefinitions();
		return tilesConfigurer;
	}
	
	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getCommonsMultipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(20971520); // 20MB
		multipartResolver.setMaxInMemorySize(1048576); // 1MB
		return multipartResolver;
	}
	
	@Override
		public void addViewControllers(ViewControllerRegistry registry)
		{
			registry.addViewController("/").setViewName("login");
		}
	}
package com.gottaboy.girl;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.filter.CharacterEncodingFilter;

import java.util.ArrayList;
import java.util.List;

//@Configuration
//@EnableAutoConfiguration
@ComponentScan
@SpringBootApplication
@MapperScan("com.gottaboy.girl.dao")
public class GirlApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(GirlApplication.class);
	}

	@Bean
	public FilterRegistrationBean encodingFilter() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter("UTF-8", true);
		FilterRegistrationBean filterRegBean = new FilterRegistrationBean();
		filterRegBean.setUrlPatterns(getRootPathUrls());
		filterRegBean.setFilter(encodingFilter);
		filterRegBean.setOrder(1);
		return filterRegBean;
	}

	private List<String> getRootPathUrls() {
		List<String> urlPatterns = new ArrayList<String>();
		urlPatterns.add("/*");
		return urlPatterns;
	}

	public static void main(String[] args) {
		SpringApplication.run(GirlApplication.class, args);
	}

	@Bean
	public HttpMessageConverters fastJsonHttpMessageConverters(){
		//1.需要定义一个convert转换消息的对象;
		FastJsonHttpMessageConverter fastJsonHttpMessageConverter = new FastJsonHttpMessageConverter();
		//2:添加fastJson的配置信息;
		FastJsonConfig fastJsonConfig = new FastJsonConfig();
		fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
		//3处理中文乱码问题
		List<MediaType> fastMediaTypes = new ArrayList<>();
		fastMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
		//4.在convert中添加配置信息.
		fastJsonHttpMessageConverter.setSupportedMediaTypes(fastMediaTypes);
		fastJsonHttpMessageConverter.setFastJsonConfig(fastJsonConfig);
		HttpMessageConverter<?> converter = fastJsonHttpMessageConverter;
		return new HttpMessageConverters(converter);

	}
}

package com.shop.aqua.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.shop.aqua.service.MemberService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	MemberService memberService;	//유저 정보를 가져올 클래스
	
	@Override
	public void configure(WebSecurity web) throws Exception {		//인증을 무시할 경로를 설정
		web.ignoring().antMatchers("/css/**", "/js/**", "/img/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.formLogin()
			.loginPage("/user/login")	//로그인 페이지 url 설정
			.defaultSuccessUrl("/")		//로그인 성공 시 메인페이지 이동
			.usernameParameter("username")
			.failureUrl("/user/login/error")	//로그인 실패 시 이동할 url 설정
			.and()
			.logout()
			.logoutRequestMatcher(new AntPathRequestMatcher("/user/logout")) //로그아웃 url 설정
			.logoutSuccessUrl("/");		//로그아웃 성공 시 이동할 url 설정
	}
		
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberService)
			.passwordEncoder(passwordEncoder());
		
		// 관리자 계정 추가. admin/1111로 로그인
		String password = passwordEncoder().encode("1111");
		auth.inMemoryAuthentication().withUser("admin").password(password).roles("ADMIN");
	}
}

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
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.shop.aqua.service.MemberService;

@Configuration
@EnableWebSecurity // CSRF 보호 기능이 활성화, Spring Security 설정 활성화
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
//	@Bean
//	public WebSecurityCustomizer webSecurityCustomizer() {
//		return(web) -> web.ignoring().antMatchers("/h2-console/**", "favicon.ico");
//	}
//	@Bean
//	public SecurityFilterChain fillterChain(HttpSecurity http) throws Exception{
//		http
//		.authorizeRequests()
//		.antMatchers("/api/hello").permitAll()
//		.anyRequest().authenticated();
//		return http.build();
//		
//	}
	
//	@Autowired
//	public AuthenticationFailureHandler authenticationFailureHandler;
//	
	@Autowired
	MemberService memberService;
	
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{  //http 요청에 대한 보안을 설정.
		http.csrf().csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse());       //페이지 권한 설정, 로그인 페이지 설정, 로그아웃 메소드 등에 대한 설정을 작성.
		

		http.formLogin()
		.loginPage("/users/login") // 로그인 페이지 URL 생성
		.defaultSuccessUrl("/") // 로그인 시 이동할 URL 설정
		.usernameParameter("email") // 로그인 시 사용할 파라미터 이름으로 email 설정
		.failureUrl("/users/login/error") // 로그인 실패 시 이동할 URL 설정
		.and()
		.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/members/logout")) //로그아웃 URL 설정
		.logoutSuccessUrl("/")		// 로그아웃 성공시 이동할 URL 설정
	;
	
	
	http.authorizeHttpRequests()
	.mvcMatchers("/**", "members/**", "product/**", "/images/**", "users/**" ).permitAll() // 모든 사용자가 접근 가능
	.mvcMatchers("/admin/**").hasRole("ADMIN") //ADMIN 접근 기능   toString, .name도 가능
	.anyRequest().authenticated() //설정해준 경로 외 나머지 경로는 모두 인증을 요구.
;		
	
	http.exceptionHandling()
	  .authenticationEntryPoint(new CustomAuthenticationEntryPoint())
	;
	
	http.csrf().disable();
	}
	

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(memberService)
		.passwordEncoder(passwordEncoder());
	}
	
	@Override	//static 디렉터리의 하위 파일 목록은 인증 무시(= 항상 통과)
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers("/resources/css/**", "/resources/js/**", "/resources/img/**");
	}
	
}

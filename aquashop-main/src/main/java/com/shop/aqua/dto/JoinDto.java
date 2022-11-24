package com.shop.aqua.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class JoinDto {
	
	@NotBlank(message = "이름은 필수 입력 값입니다.")
	private String name;	  //회원 이름
	
	@NotEmpty(message = "아이디는 필수 입력 값입니다.")
	private String username;  //회원 아이디
	
	@NotEmpty(message = "비밀번호는 필수 입력 값입니다.")
	@Length(min=8, max=16, message = "비밀번호는 8자 이상, 16자 이하로 입력해주세요")
	private String password;  //비밀번호
	
	@NotEmpty(message = "비밀번호는 필수 입력 값입니다.")
	@Length(min=8, max=16, message = "비밀번호는 8자 이상, 16자 이하로 입력해주세요")
	private String password2; //비밀번호 확인
	
	@NotEmpty(message = "이메일은 필수 입력 값입니다.")
	@Email(message = "이메일 형식으로 입력해주세요.")
	private String email; 	  //이메일
	
	@NotEmpty(message = "주소는 필수 입력 값입니다.")
	private String address;	  //주소
	
	@NotEmpty(message = "전화번호는 필수 입력 값입니다.")
	private String phone;     //전화번호
}

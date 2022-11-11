package com.shop.aqua.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberFormDto {
	
	
	private Long id;
	

	@NotBlank(message = " 이름은 필수 입력 값입니다.")
	private String memberName;
	
	@NotBlank(message ="아이디는 필수입력값입니다.")
	private String userId;
  
    @NotBlank(message = "이메일은 필수 입력 값입니다.")
    @Pattern(regexp = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,6}$", message = "이메일 형식이 올바르지 않습니다.")
	private String email;

	
	@NotEmpty(message = " 비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
      message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String memberPw;

	
	@NotEmpty(message ="휴대전화 번호는 필수 입력 값입니다.")
	@Pattern(regexp = "^01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-]?(\\d{4})$", message="전화번호가 바르지 않습니다.")
	private String phone;

	@NotEmpty(message = "우편번호는 필수 입력 갑입니다.")
	private String zipcode;
	
	@NotEmpty(message = "주소는 필수 입력 갑입니다.")
	private String memberAddress;
	
	@NotEmpty(message = "상세주소를 입력해주세요.")
	private String address_detail;


}

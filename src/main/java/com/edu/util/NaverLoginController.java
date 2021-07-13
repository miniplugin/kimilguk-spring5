package com.edu.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;

//아래 sns.~만드는 목적: 로컬과 헤로쿠의 인증 ID와 Secret를 소스에서 변경하기보단, 전역변수로 만들면 편함.
@PropertySource("classpath:properties/sns.properties")
@Controller //스프링빈으로 등록되면, 인젝션으로 객체를 사용가능하게 됨.
public class NaverLoginController {
	@Value("${SnsClientID}")//스프링빈의 전역변수를 가져올때 @Resource와 비교하면 도움.
	private String CLIENT_ID;//properties에 전역변수값을 클래스변수값으로 사용
	@Value("${SnsClientSecret}")
	
}

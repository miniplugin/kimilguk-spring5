package com.edu.util;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginApi extends DefaultApi20 {

	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return null;
	}

	//싱클톤 인스트턴스 객체를 생성하기 위해서 인스턴스 홀더 클래스 상수(static,final)변수를 생성합니다.
	private static class InstanceHolder {
		private static final NaverLoginApi INSTANCE = new NaverLoginApi();
	}
	public static NaverLoginApi instance() {
		// 싱클톤으로 인스턴스 객체를 생성하는 방식:객체를 1회만 생성하기 위해서
		return InstanceHolder.INSTANCE;
	}

}

package kr.or.test;

import java.util.Arrays;

public class HelloWorld {

	public static void main(String[] args) {
		// classpath > exclude test code unchecked 해야지만, 오류안남.
		System.out.println("헬로 자바 !!!!");
		int[] questions = {1, 5, 4, 3, 2};
		Arrays.sort(questions);
		System.out.println(Arrays.toString(questions));		
	}

}

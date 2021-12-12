#### 작업한 순서.
- 정방향개발(앞으로): 매퍼쿼리>DAO>Service>[JUnit-IoC,DI기능구현]컨트롤러클래스>JSP
- 역방향개발(클래스간이동빨라서): 정방향으로 개발한 것 검증용만 사용.
- 관리자단 회원목록 처리 마무리(1.페이징및 검색기능구현)OK.
- model을 이용해서 결과를 JSP로 구현.(2.JSP화면은 표준언어인 JSTL로 구현)OK.
- 나머지 관리자 회원관리 CRUD 화면 JSP처리OK.
- 화면기획서XLS제작, 화면설계서PPT제출용 OK.
- 관리자단 게시판 생성관리 CRUD 처리.(3.AOP기능구현)OK.
- 관리자단 게시물관리 CRUD 처리(4.파일업로드구현,5.트랜잭션구현).
- 관리자단 댓글 CRUD 처리(6.RestAPI기능구현-개발트렌드).
- 관리자단 왼쪽메뉴 UI 메뉴 고정시키기(7.jQuery로 구현).-관리자단 마무리.
- 사용자단 로그인 화면 JSP로 만들기.
- 로그인처리 및 관리자 권한체크 기능 추가(8.스프링시큐리티구현).
- 사용자단 회원가입, 수정, 탈퇴 JSP기능 추가.
- 헤로쿠 클라우드 작업.
- 관리자단 대시보드작업.
- 사용자단 게시판 CRUD 처리.
- 헤로쿠 클라우드에 배포(9.클라우드 배포CI/CD구현-개발트렌드).깃(최신소스)-연동-헤로쿠(배포)
- 사용자단 댓글 CRUD 처리. 부메랑으로 RestAPI 테스트를 진행(Junit대신)
- 관리자대시보드에서 회원ID 이미지업로드 및 보이기 처리OK.
- 사용자단 네이버아이디로그인 처리(10.외부RestAPI구현 외부로그인-스프링시큐리티와연동)OK.
- 헤로쿠 클라우드에 배포할때, 매퍼폴더의 mysql폴더내의 쿼리에 now()를 date_add(now(3), interval 9 HOUR) 변경예정.(이유는 DB서버 타임존 미국이기 때문에)
- 알고리즘 다이어그램기반으로 자바 코딩테스트 작업 10개 문제.

#### *데이터의 이동
- VO클래스의 이동: 매퍼쿼리<->DAO(M)<->Service<->Controller(C)<->jsp(V)

#### *변수값(데이터) ReplyVO데이터클래스를 기준으로
- JSON데이터: 크롬에서 부메랑으로 List<ReaplyVO>형태의 데이터확인
- JSON데이터구조: ArrayList(표) + HashMap(Key:Value)

```
{
    "rno": 4,
    "reply_text": "부메랑댓글 입력테스트",
    "replyer": "admin",
    "reg_date": 1626310996371,
    "update_date": 1626310996371,
    "bno": 2
},
{
    "rno": 3,
    "reply_text": "부메랑댓글 입력테스트",
    "replyer": "admin",
    "reg_date": 1626310964420,
    "update_date": 1626310964420,
    "bno": 2
}
```
- ArrayList데이터형:List<ReplyVO> replyList = new ArrayList<ReplyVO>();//DB쿼리결과
- 위 ArrayList구조: List(인터페이스) > ArrayList(임플리먼트클래스-데이터클래스)
- HashMap데이터형:Map<String,Object> mapData = new HashMap<String,Object>();
- 위 HashMap구조: Map(인터페이스-메서드명) > HashMap(구현클래스)
- Hash해시태그: 그물망(해시)=#=좌표(x,y)=(Key:Value)

#### 20211212(일): CVE-2021-44228 취약점 보안패치ㅣlog4j-1.2.15에서 log4j2로
- pom.xml 변경: org.apache.logging.log4j 2.15.0 버전으로 마이그레이션
- log4j2.xml 생성

#### 20210720(화) 작업.
- UI구현 과제물 점검시간.
- 코딩테스트 10번 마무리OK.
- 코딩테스트 9번 부터 시작, 재귀함수(recursive)
- 코딩실습09. 소스(아래)

```
import java.util.Scanner;
import java.util.Arrays;
class Main {
	static String endString = "";
	static String w,r;
	
	public static int getBalancedIndex(String w) {
		int index = 0;
		int balanceCount = 0;
		for(int i=0;i<w.length();i++) {
			String tmpChar = w.substring(i,i+1);//입력한 문자열에서 1개의 문자를 뽑아내는 명령
			if("(".equals(tmpChar)) {
				balanceCount++;
			}else if(")".equals(tmpChar)){
				balanceCount--;
			}
			if(balanceCount==0) {
				index = i;//반복한 횟수
				break;//for문을 중지하고 index가지고, 다음으로 진행
			}
		}
		return index;
	}
	
	public static boolean isValidString(String u) {
		int balanceCount = 0;
		for(int i=0;i<u.length();i++) {
			String tmpChar = u.substring(i, i+1);
			if("(".equals(tmpChar)) {
				balanceCount++;
			}else if(")".equals(tmpChar)) {
				balanceCount--;
			}
			if(balanceCount < 0) {
				return false;
			}
		}
		return true;
	}
	
	public static String reArrange(String u) {
		String arrangeString = "";
		for(int i=1;i<u.length()-1;i++) {
			String tmpChar = u.substring(i,i+1);//1글자만 뽑는 명령
			if("(".equals(tmpChar)) {
				arrangeString += ")";
			}else if(")".equals(tmpChar)){
				arrangeString += "(";
			}
		}
		return arrangeString;
	}
	
	public static String recursive(String w) {
		if(w.isEmpty()) {
			return w + endString;
		}
		int balancedIndex = getBalancedIndex(w);
		String u = w.substring(0, balancedIndex+1);//짝이 맞춰진 문자열.
		String v = w.substring(balancedIndex+1);//짝이 맞지 않는 나머지 문자열.
		boolean isValidCheck = isValidString(u);
		System.out.println(isValidCheck);
		if(isValidCheck==true) {
			if("(".equals(u)) {
				endString += ")";//endString = endString + ")"
			}
			u += recursive(v);//u = u+recursive(v); 1회전 u , 2회전 u=v
			return u;			
		}else{
			String createString = "(";
			createString += recursive(v);
			createString += ")";
			createString += reArrange(u);
			return createString;
		}
	}
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		w = sc.nextLine();
		r = recursive(w);
		if(w.equals(r)) {
			System.out.println("올바른 괄호 문자열 입니다." + r);
		}else{
			System.out.println("잘못된 괄호 문자열 입니다. 입력값은 "+w+"수정값은 "+r);
		}
	}
}
```
- 작업하는 소스코드 예를 드면, $(document).ready(function(){}));
- 위 경우처럼 소스에서 짝이 맞지 않는 ()기호 있으면 찾아서 짝이 맞게 고치는 
- 솔루션만들어라.

- 재귀함수란? 메서드 안에서 자기자신을 호출하는 함수.(6번코딩테스트로 실습확인)
- 코딩실습06. 6번코딩테스트소스(아래)

```

import java.util.Scanner;
import java.util.Arrays;
class Main {
	static long Factorial = 1;//멤버변수(클래스영역의변수)
	public static long fact(int n) {
		//예, 5! = 5x4x3x2
		if(n==1) {
			return Factorial;
		}
		Factorial = Factorial * n;
		System.out.println(n + "재귀함수가 반복하는 부분 값 " + Factorial);
		n = n - 1;     //fact(n) : 5 -> 4 -> 3 -> 2 -> 1
		return fact(n);//재귀함수 만드는 방식 -> 중복 for반복문을 대체하게 됨.
	}
	public static void main(String[] args) {
		int n;//N팩토리얼 에서 n을 구하는 변수
		long Result;
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();//sc객체를 이용해서 n값을 입력 받습니다.
		Result = fact(n);//fact 매개변수로 n을 받아서 결과를 리턴 받습니다.
		System.out.println(n + "팩토리얼의 값은 " + Result);
	}
}
```
- 코딩테스트 8,7까지 마무리.
- 코딩실습 07번 소스(아래)

```
import java.util.Scanner;
import java.util.Arrays;
class Main {
	public static void main(String[] args) {
		int n;
		int[] Score;
		int[] Rank;
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		Score = new int[n];
		Rank = new int[n];
		for(int i=0;i<n;i++) {
			Score[i] = sc.nextInt();
		}
		System.out.println("입력한 점수배열은 " + Arrays.toString(Score));
		for(int i=0;i<n;i++) {
			for(int comp=0;comp<n;comp++) {
				if(Score[i] < Score[comp]) {//내부 for문에서 Score[i]기준값 , Score[comp]비교값 반복시 변화됨.
					Rank[i] = Rank[i] + 1;//기준값과 비교해서 본인값이 낮으면 랭크를 올립니다. 기준값의 등수가 낮아짐.
				}
			}
			//Rank[i] = Rank[i] + 1;//인덱스가 0부터 시작해서 이코드를 추가하면, 1등부터 시작합니다.
		}
		for(int i=0;i<n;i++) {
			System.out.println(i+" 번째 학생의 점수는 "+Score[i]+" 등수는 "+(Rank[i]+1));
		}
	}
}
```
- 코딩실습 08번 소스(아래)
- 위 입력예) 좋아하는 색상을 선택하세요, 1:빨강, 2:노랑, 3:녹색
- { 1, 1, 2, 3, 4, 1, 2, 3, 4, ...} 최다선택한 색상을 구하는 로직입니다.

```
import java.util.Scanner;
import java.util.Arrays;
class Main {
	//스태틱 클래스,메서드,변수 : 객체로 생성을 하지 않아도 실행이 되는 메모리영역에 있다.
	public static void main(String[] args) {
		int n, Top=0, Max=0, MaxCnt=0;
		int[] VoteIndex, VoteCnt;
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		VoteIndex = new int[n];
		for(int i=0;i<n;i++) {
			VoteIndex[i] = sc.nextInt();
			if(VoteIndex[i] > Max) { //최고값을 구하는 간단한 로직
				Max = VoteIndex[i];
			}
		}//키보드로 입력한 값중 제일 큰 값이 Max변수 남게됩니다.
		VoteCnt = new int[Max+1];//투표한 값을 인덱스로 사용한 변수 생성(Max+1는 Out Of Bound 에러를 방지하기 위해서)
		for(int i=0;i<n;i++) {
			VoteCnt[VoteIndex[i]] = VoteCnt[VoteIndex[i]] + 1;//여기서 투표한 횟수가 누적이 됩니다.
			System.out.println("VoteIndex[" + VoteIndex[i] + "]일때 해당 VoteCnt["+VoteIndex[i]+"]누적 값은 " + VoteCnt[VoteIndex[i]]);
		}
		for(int i=0; i<Max+1; i++) { //MaxCnt, Top 구하는 for문 로직
			if(VoteCnt[i] > MaxCnt) {
				MaxCnt = VoteCnt[i]; //최다 선택한 값의 개수
				Top = i; //최다 선택한 값
			}
		}
		System.out.println("최다 선택값 : " + Top + " 선택한 횟수는 " + MaxCnt);
	}
}
```
- 8교시에 UI구현 워드문서 과제물 제출전, 7교시에 확인예정.

#### 20210719(월) 작업.
- 코딩실습10. 로또번호가 올바른 번호인지 확인하는 코드작성 코딩테스트 10번소스(아래) 작업중...

```

import java.util.Scanner;
import java.util.Arrays;
class Main {
    public static boolean isValid(int[] Lotto, int n) {
        //조건 1, 2, 3 구현하는 코딩이 입력(아래)
        if(n != 6) {//조건1중 일부
            return false;//현재 isValid메서드가 종료되면서, false를 반환 합니다.
        }
        //조건1, 연속된 숫자가 중복되는지 검사로직
        for(int i=0;i<(n-1);i++) {
            if(Lotto[i] == Lotto[i+1]) {
                return false;//중복숫자기 있으면, 현재 isValid메서드를 종료 하고, false를 반환합니다. 
            }
        }
        //조건2, 숫자범위는 1부터 45까지의 숫자만 인정이 됨
        for(int i=0;i<n;i++) {
					if(Lotto[i] < 1 || Lotto[i] > 45) {
						return false;
					}
				}
        //조건3, 현재 로또번호가 오름차순 정렬로 되었는지 확인하는 로직
        //앞수 뒤수 비교해서 앞수가 크면, 오름차순에 위배되기 때문에 false
				for(int i=0;i<n-1;i++) {
					if(Lotto[i] > Lotto[i+1]) {
						return false;//현재 메서드를 종료하면서 return으로 false를 반환함.
					}
				}
        return true;
    }
    public static void main(String[] args) {
        int n;//6개의 로또번호 입력받을 크기
        int[] Lotto;//배열의 크기가 필요
        boolean Real;//진짜 로또번호인지 확인결과 참/거짓
        Scanner sc = new Scanner(System.in);
        n = sc.nextInt();
        Lotto = new int[n];
        for(int i=0;i<n;i++) {
            Lotto[i] = sc.nextInt();
        }
        System.out.println("주운 로또 번호는 "+Arrays.toString(Lotto));
        Real = isValid(Lotto, n);
        if(Real == true) {
            System.out.println("주운 로또번호는 진짜 입니다.");
        }else{
            System.out.println("주운 로또번호는 가짜 입니다.");
        }
    }	
}
```

- 10진수를 2진수로 변환 코딩테스트05소스(아래)
- 13 = 1101(2)
- 13 = 10의 자리 1, 1의 자리 3
- 1101 = 8421(자리수)코드 = 2(3)자리수 1, 2(2)자리는 1, 2(1)자리는 0, 2(0)자리는 1
- 모든수의 0승(제곱) = 1

-코딩실습05. 소스(아래)

```
import java.util.Scanner;
import java.util.Arrays;
class Main {
	public static void main(String[] args) {
		int[] Bin = new int[10];//배열 크기가 10인 정수형 배열변수 생성.
		int Dec;//키보드로 입력받을 십진수 저장공간
		int idx = 0;//반복문에 사용할 변수선언
		int Mok, Nmg;//몫과 나머지로 변수로 사용.
		Scanner sc = new Scanner(System.in);
		Dec = sc.nextInt();
		while(true) {
			Mok = (int) Dec/2;
			Nmg = Dec - (Mok*2);//나머지를 구하는 공식
			Bin[idx] = Nmg;
			idx = idx + 1;//idx++
			if(Mok==0) {
				break;
			}else{
				Dec = Mok;
			}
		}//반복문 끝
		//역순 출력에 대한 로직 1101 -> 1011역순으로 출력
		for(int i=idx-1;i>=0;i--) {
			System.out.print(Bin[i] + " ");
		}
	}
}

```
- -----------------------------------------------
- 코딩실습04 삽입정렬 코딩테스트04소스(아래).오름차순에서 10번 반복 결과가 나옴.
- -----------------------------------------------

```
import java.util.Scanner;
import java.util.Arrays;
class Main {
	public static void main(String[] args) {
		int n;
		int[] Numbers;
		int insert, comp, Key;
		Scanner sc = new Scanner(System.in);
		n = sc.nextInt();
		Numbers = new int[n];
		for(int i=0;i<n;i++) {
			Numbers[i] = sc.nextInt();
		}
		//System.out.println("키보드로 입력받은 배열의 값은 " + Arrays.toString(Numbers));
		for(insert=1;insert<n;insert++) {
			Key = Numbers[insert];//인덱스1의 값 4를 삽입
			for(comp=insert-1;comp>=0;comp--) {
				if(Numbers[comp] > Key) {//5와 4를 비교
					Numbers[comp+1] = Numbers[comp];//인덱스1의 자리에 5를 삽입
				}else{
					break;//내부for 빠져나감
				}
				//if(insert < 3) {
					System.out.println("내부 for문 "+comp+" 회전일때 Numbers값은 "+ Arrays.toString(Numbers));
				//}
			}
			//System.out.println("comp 값은 " + comp);
			Numbers[comp+1] = Key;//인덱스0의 자리에 4를 입력
			//if(insert < 3) {
			//	System.out.println("외부 for문 키값은 "+Key+" Numbers값은 "+ Arrays.toString(Numbers));
			//}
		}
		for(int i=0;i<n;i++) {
			System.out.print(Numbers[i] + " ");
		}
	}	
}
```
- ----------------------------------------------
- 버블정렬 코딩테스트03소스(아래).오름차순에서 20번 만에 결과가 나옴.
- ----------------------------------------------
- 특징1: 선택정렬과는 반대로 제일 큰 값이 오른쪽에 배치되면서 1회전이 종료
- 참고) 선택정렬은 제일 작은 값이 왼쪽에 배치되면서 1회전이 종료
- 특징2: 비교할때 선택정렬은 비교할 기준자리가 있으나, 버블정렬은 바로 옆의 값을 비교하는 방식(거품방식)

코딩실습03. 소스(아래)

```
import java.util.Scanner;
import java.util.Arrays;
class Main {
	public static void main(String[] args) {
		int n;
		int[] Numbers;
		int bubble, idx, Temp;
		Scanner sc = new Scanner(System.in);//키보드로 입력 스캐너객체 생성
		n = sc.nextInt();
		Numbers = new int[n];//배열의 크기 지정
		for(int i=0;i<n;i++) {
			Numbers[i] = sc.nextInt();
		}
		System.out.println("입력된 배열값 확인 " + Arrays.toString(Numbers));
		for(bubble=0;bubble<n;bubble++) {
			for(idx=0;idx<n-1;idx++) {
				if(Numbers[idx] > Numbers[idx+1]) {
					Temp = Numbers[idx];
					Numbers[idx] = Numbers[idx+1];
					Numbers[idx+1] = Temp;
				}
				if(bubble == 0) {
					System.out.println(Arrays.toString(Numbers) + "(내부 for"+(idx+1)+"회전)");
				}				
			}
		}
		//졍렬 결과값 출력(아래)
		for(int i=0;i<5;i++) {
			System.out.print(Numbers[i] + " ");
		}
	}	
}
```
- -----------------------------
- 선택정렬 : 10번 반복으로 졍렬결과 나옴.
- -----------------------------
- *Temp변수사용 정렬 코딩 테스트02소스(아래).지난주에 사용한 Arrays클래스 sort메서드구성연습
- 예, 중복  for문에서 외부1회전(내부 for문 1회전-4회전)
- 5, 4, 3, 2, 1(원시데이터)
- 4, 5, 3, 2, 1(내부for1회전-1번째)
- 3, 5, 4, 2, 1(내부for2회전-2번째)
- 2, 5, 4, 3, 1(내부for3회전-3번째)
- 1, 5, 4, 3, 2(내부for4회전-4번째)
- 외부2회전 (내부 for문 2부터-4회전)
- 1, 5, 4, 3, 2(원시데이터)
- 1, 4, 5, 3, 2(내부for1회전-2번째)
- 1, 3, 5, 4, 2(내부for2회전-3번째)
- 1, 2, 5, 4, 3(내부for3회전-4번째)

- 코딩실습02. 소스(아래)

```
import java.util.Scanner;
import java.util.Arrays;//로직에서 필요 없으나, 디버그용으로 사용
class Main {
	public static void main(String[] args) {
		int n;//정렬할 숫자의 개수 변수생성
		int[] Numbers;//배열변수 생성
		int prev, next, Temp;//이전,다음,임시저장변수 생성
		Scanner sc = new Scanner(System.in);//스캐너클래스를 이용해서 바이트단위(문자)로 키보드로 입력받음 커서발생
		n = sc.nextInt();//키보드로 입력받는 내용을 n에 입력합니다.
		//System.out.println("키보드로 입력받은 변수값은 : " + n);
		Numbers = new int[n];//배열변수의 크기 초기화.
		for(int i=0;i<n;i++) {//키보드 정렬할 변수값을 입력 받습니다.Numbers[]배열변수에...
			Numbers[i] = sc.nextInt();
		}
		//Arrays.sort(Numbers);
		System.out.println("입력한 배열값은 " + Arrays.toString(Numbers));
		//여기서부터 소팅로직 시작
		for(prev=0;prev<(n-1);prev++) { //예, 5개 숫자를 입력하면, 4번 반복합니다. 
			//n-1번만 이유는 4번째 이후 비교할 다음변수가 있기 때문에
			for(next=(prev+1);next<n;next++) {
				if(Numbers[prev] > Numbers[next]) {//이전변수값이 더 크다면, 앞 뒤 변수값을 자리 바꿈합니다.
					//위 부등호만 바꾸면, > 오름차순, < 내림차순
					Temp = Numbers[prev];//이전변수값이 저장
					Numbers[prev] = Numbers[next];
					Numbers[next] = Temp;
				}
			}
		}
		//자리바꿈결과를 출력하는 구문, Arrays유틸클래스 사용하지 않고, for문사용
		//인덱스 개수 5개 , 0부터시작하기 때문에 4까지가 인덱스 번호의 끝
		for(int i=0;i<n;i++) {
			System.out.print(Numbers[i]+ " ");
		}
	}
}
```


- 코딩실습01. *스위치변수 사용 코딩 테스트01소스(아래).

```
import java.io.BufferedReader;
import java.io.InputStreamReader;
class Main {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));//문자열을 입력하는 커서가 발생
		int UNIT = 50000;//화폐의 최고단위 금액, 초기화폐단위 초기화
		int NUM = 0;//(입력금액/단위금액) = 단위금액의 화폐매수 변수 초기화
		int SW = 0;//스위치(On/Off)변수=플래그(깃발)변수 초기화
		int MONEY = Integer.parseInt(br.readLine());
		while(true) { //IoT쪽에서는 while(true)문으로 외부데이터를 읽어 들입니다.
			if(UNIT>=1) {
				NUM = (int) MONEY/UNIT;//화폐매수는 0.5매수는 없기때문에 정수로 형변환합니다.
				System.out.println(UNIT+" 원의 화폐매수는 "+NUM);
				//다음반복을 위해서 MONEY변수 값 조정, UNIT변수값 조정
				MONEY = MONEY-(UNIT*NUM);//277777-250000 = 25000 (1회전결과)
				if(SW==0) {
					UNIT = UNIT/5;//5만원->1만원으로 단위변경(1회전결과,3회전,5회전...)
					SW = 1;//1회전 후 SW스위치변수값을 1로 변경
				}else{
					UNIT = UNIT/2;//1만원->5천원으로 단위변경(2회전결과,4회전,6회전...)
					SW = 0;//2회전 후 SW스위치변수값을 0으로 변경
				}
			}else{
				break;//while반복문을 STOP합니다.무한반복을 벗어나는 코드
			}
			
		}
		
	}
}
```
- *빅O 시간복잡도 구하기: for문을 1개면, Big O(N)번 횟수, 
- 중복for문이면, Big O = N^2
- for(i=1, i=3, i++) { for(ii=1,ii=3,ii++) { 구현로직 } }
- 위 중복for문은 시간복잡도가 O(N^2)번 횟수
- 프로그램의 성능을 측정하는 단위 빅O 표기사용합니다.
- 화폐매수구하기: 277,777원 입금금액 있다면,
- 5만원짜리 지폐는 몇장인지, = 5장
- 1만원짜리 지폐는 몇장인지, = 2장
- 5천춴짜리 지폐는 몇장인지, = 1장 
- 1천원짜리 지폐는 몇장인지, = 2장
- 500원 동전은 몇개인지,   = 1개
- 100원 동전은 몇개인지,   = 2개
- 50원 동전은 몇개인지,    = 1개
- 10원, 5원, 1원              = 2개, 1개, 2개
- 화폐단위가 5만원 부터 시작해서 입력금액/UNIT 1회 반복할때마다 UNIT변경
- 화폐단위(UNIT)변수가 바뀌는 순서 로직(아래)
- SW=0 : 5만, 5천원, 500원, 50원, 5원 = UNIT/5
- SW=1 : 1만, 1천원, 100원, 10원, 1원 = UNIT/2 끝(0.5원화폐단위X)

- 알고리즘 다이어그램기반으로 자바코딩테스트예정(깃 it강의저장소자료이용).

#### 20210716(금) 작업.
- 수업전 헤로쿠에 배포 후 어제 작업한 결과 확인해 보겠습니다.-오후수업전 다시확인
- jsp템플릿인 tiles(타일즈) 사용.
- jsp템플릿인 tiles(타일즈), siteMesh(사이트메쉬), velocity(벨로시티) 등이 있습니다.
- 현업에서는 위 3가지 템플릿중 1가지는 항상 사용하기 때문에 대표적으로 타일즈를 실습할 예정입니다.
- 위 3가지 구조는 비슷하기 때문에 1가지만 아셔도 다른 jsp템플릿 적용시 응용가능합니다.
- 타일즈역할: jsp템플릿이리고 하고, jsp구조(레이아웃)를 쳬계적으로 관리하는 모듈
- include(header.jsp,footer.jsp) 를 대체 합니다.
작업순서:
- 1. pom.xml 타일즈 모듈 라이브러리 추가OK.
- 2. tiles-context.xml 타일즈설정파일 추가OK.
- 3. servlet-context.xml 에서 타일즈용 뷰리졸버 빈 추가OK.
- 4. 위 설정파일을 기준으로 tiles폴더 및 layouts폴더 생성 후 layout.jsp생성OK.
- 5. 기존 home/include 폴더의 header.jsp 와 footer.jsp 파일 복사해서 그대로 사용OK.
- 6. 기존 home/index.jsp 파일 그대로 복사해서 tiles/index.jsp로 복사해서 @include 삭제만 처리OK.
- 7. HomeController 에서 기존 @RequestMapping 복사해서 타일즈용으로 추가OK.
- -------------------------------------------------------
- 알고리즘 다이어그램기반으로 자바코딩테스트(깃 it강의저장소자료이용)OK.

```
import java.io.BufferedReader; //키보드 입력 때문에 필요
import java.io.InputStreamReader; //기보드 입력 때문에 필요
import java.util.Arrays; //오름차순 정렬때문에 필요
class Main {
	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int N;
		int[] questions;
		N = Integer.parseInt(br.readLine());//키보드로 입력받는 커서가 나옴
		//System.out.println("키보드로 입력한 값은 " + N);
		questions = new int[N];//키보드로 입력한 값N으로 난이도배열의 크기를 지정합니다.
		String str = br.readLine();//키보드 입력받는 커서가 나옴. 단, 숫자사이에 공백을 집어넣습니다.
		//문자열로 입력 받은 문자를 questions 정수형배열변수에 하나씩 입력합니다.
		String[] strArray = str.split(" ");
		for(int i=0;i<N;i++) {
			questions[i] = Integer.parseInt(strArray[i]);
		}
		//System.out.println("난이도 입력값 " + Arrays.toString(questions));
		Arrays.sort(questions);//입력받은 questions배열을 오름차순 정렬
		int count = 0;
		int before = questions[0];
		//int current = 0;
		for(int current:questions) {
			if(before != current) {
				count = count + 1;
			}
			if(count == 2) { break; }
			before = current;
		}
		if(count >= 2) {
			System.out.println("YES");
		} else {
			System.out.println("NO");
		}
	}
}
```

#### 20210715(목) 작업.
- 데이터의 이동과 변수값처리 2가지만 아시면, 개발자로 일할 수 있음.
- 문서작업(제출용)확인OK.(설명 후 작업시간 드릴 예정, 작업시간중 네아로 않되는 분 확인)
- 관리자대시보드에서 회원ID 이미지업로드 및 보이기 처리예정.
- C:\egov\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\kimilguk-spring5\resources\profile
- URL로 접근할때는 http://localhost:8080/resources/profile/admin22

#### 20210714(수) 작업.
- 네아로 로그인 부분 마무리.: 외부API이고, 네이버 개발자들이 만든내용.
- 요청 URL생성 -> 인증체크(네이버로그인컨트롤러 메서드추가) -> 성공/실패/취소시 callback URL로 이동해서 처리하는 메서드 생성
- 문서작업(제출용)예정.
- 관리자대시보드에서 회원ID 이미지업로드 및 보이기 처리예정.
- jsp템플릿인 tiles(타일즈) 사용.

#### 20210713(화) 작업.
- 사용자단 메인페이지(대시보드) 작업OK.
- 사용자단 네이버아이디로그인 처리(10.외부RestAPI구현).
- 네이버 개발자 센터에 가입이 되어 있어야 합니다.
- 서비스URL(사이트의 로그인URL) -> 네이버로그인폼으로진행(스프링시큐리티로그인무시)
- 네이버로그인폼에서 인증을 받으면(RestAPI에서 OAuth2.0인증) -> 서비스되는 사이트로 돌아오기(사이트URL필요=@RequestMapping필요=콜백URL필요):시프링시큐리티 로직을 타야 합니다.
- 콜백메서드에서 하는 작업: enabled, ROLE_USER권하부여 , session_값 지정을 할 수 있습니다.
- login_success는 스프링시큐리티의 인증성공 후 이동할 URL위치를 구현한 메서드
- naver_callback은 네이버OAuth2.0 인증성공 후 이동할 URL위치를 구현한 메서드

#### 20210709(금) 작업.
- 게시물 CRUD시 본인글 인지 확인 하는 메서드를 공통으로 구현하기(많이사용하는 방향으로)OK.

```
@Around("execution(* com.edu.controller.HomeController.board_delete(..)) || execution(* com.edu.controller.HomeController.board_update*(..))")
    public Object board_deleteMethod(ProceedingJoinPoint pjp) throws Throwable {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		if(request != null) {//jsp에서 Get,Post 있을때,
			BoardVO boardVO = null;
			String user_id = null;
			Integer bno = null;
			logger.info("디버그 메서드네임 가져오기 : " + pjp.getSignature().getName());//기술참조 https://alwayspr.tistory.com/34
			for(Object object:pjp.getArgs()) {
				if(object instanceof Integer) {//AOP실행메서드중 매개변수 판단
					//파마미터가 bno일때 게시판의 writer를 가져오기
					bno = (Integer) object;
					boardVO = boardService.readBoard(bno);//아래 조건때문에 추가
					user_id = boardVO.getWriter();
				}
				if(object instanceof BoardVO) {
					//파라미터가 BoardVO 클래스객체 일때 writer를 가져오기
					boardVO = (BoardVO) object;
					user_id = boardVO.getWriter();
				}
			}
			HttpSession session = request.getSession();//클라이언트PC에서 스프링프로젝트 접근시 세션객체
			if( !user_id.equals(session.getAttribute("session_userid")) && "ROLE_USER".equals(session.getAttribute("session_levels")) ) {
				FlashMap flashMap = new FlashMap();
				flashMap.put("msgError", "게시물은 본인글만 수정/삭제 가능합니다.");
				FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
				flashMapManager.saveOutputFlashMap(flashMap, request, null);
				String referer = request.getHeader("Referer");//크롬>네트워크>파일>Referer>이전페이지 URL이 존재
				return "redirect:"+referer;
			}
		}
		Object result = pjp.proceed();//여기서 조인포인트가 실행됩니다.
		return result;
	}
```
- 사용자단 댓글서비스 작업.(기술참조: http://www.ktword.co.kr/abbr_view.php?m_temp1=5782 )
- Ajax소스는 프로그램이기 때문에, 디자인과 크게관련없기때문에, admin단 board_view에 있는 
- ajax코드를 가져다가 사용하면서 커스터마이징.($.ajax에서 complete, beforeSend, async 속성들)
- ajax에서 디버그하는 방법.
- 헤로쿠 30분 지나서 휴면모드로 들어가기전, 잠깨우는 기능 추가예정.(스프링 스케줄링사용)
- 순서1: 외부 모듈 라이브러리 추가(pom.xml에서) -> 메이븐업데이트 -> 
- 순서2: 스케줄링할 메서드 생성(herokuJobMethod) -> root-context에서 스케줄링 스프링빈 생성
- 보통 스프링스케줄러를 이용해서 회원들에게 시간기준의 특별한 이벤트가 발생할때, 일괄적으로 메일보내기 기능에 사용.
- 이력서 작업한 URL을 포트폴리오로 적어 놓으실때, 면접관이 1분정도 대기시간이 필요.
- 헤로쿠클라우드는 처음접속시 1분정도 대기시간이 필요함(이력서에 명시)

#### 20210708(목) 작업.
- 사용자단 게시물관리 CRUD중 Delete마무리 후, Update 실습
- 우리나라 스프링기반 솔루션을 만들던 시기(스프링버전2.5 - 2015년 전후) Rest-Api(jsonview방식), 현재(2021년 스프링버전 5.x사용) Rest-Api(@RestController방식-,@ResponseBody)
- properties파일을 hsql,cloude 를 1개 cloud통일
- JsonView방식(고전방식의 RestAPI처리) 실습.
- JsonView: 컨트롤러에서 뷰단을 반환할때 .jsp(생략)파일명으로 반환(View리졸버의 기본형식)
- servlet-context.xml에 위 View리졸버라는 스프링빈 설정이 있습니다.
- 리퀘스트매핑요청에대한 뷰단을 해석(바인딩해 줍니다.)
- 위 기능을 RestAPI로 대체해서 컨트롤러에서 뷰단을 반환할때 jsp로 반환하지 않고, Json으로 뷰를 반환하는 것을 JsonView 방식이라고 합니다.
- JsonView방식 사용방법: 1. servlet설정에 스프링빈을 등록합니다.(클래스는 스프링프레임워크에 내장, pom.xml외부 라이브러리모듈을 가져올 필요 없음.)
- 사용자단에서는 글수정을 글쓴 보인글만 삭제/수정 가능하게 기능추가.(단, 관리자단에서는 admin은 모두 수정/삭제가능)

#### 20210707(수) 작업.
- 헤로쿠는 30분간 아무작업이 없으면 휴면상태(컨테이너가 내려감) -> 활성상태(컨테이너가 올라감)
- 컨테이너가 올라가면, 클라우드 자원을 차지하기 때문, 휴면에서 활성화 될때 무료버전은 저장소가 신규생성됩니다.
- 사용자단 게시물관리 CRUD작업추가진행.

#### 20210706(화) 작업.
- Hsql데이터베이스는 특징? 메모리DB이기 때문에, 보통 서버를 리스타트하면 DB가 리셋됨(초기화)
- Hsql은 트랜잭션 기능이 않됨.
- 데모사이트나, 프로그램의 프로토타입(데모프로그램) 생성시 주로 사용.
- 메모리 DB를 우리프로젝트에서는 file로 변경해서 , 톰캣을 리스타트해도 없어지지 않게 처리했음.
- 스프링 1개프로젝트 : 3개월, 5~7명(개발인원), 1Man/1Month 금액을 산출.
- 280 ~ 650: 400만 = 2800만/1달 = 3달 = 8400만 + 1년유지보수 2000만 = 2억/2000만유지보수 보통 이상
- 7명: PM(프로젝트매니저)1명-코딩없이 클라이언트와 소통, PL(프로젝트리더)1명, 백엔드개발자(3명), 디자이너(프론트엔드개발1명)+문서작업(1명)
- 실습: CRUD기본, -> 웹프로그램을 제작(구체적인것은 나중에...)
- 수업전 mysql폴더의 replyMapper.xml 쿼리파일에서 아래 내용대로 변경합니다.
- [수정전] limit #{pageVO.queryStartNo}, #{pageVO.queryPerPageNum}
- [수정후] limit #{queryStartNo}, #{queryPerPageNum}
- JUnit(스프링테스트방법) - 부메랑(RestApi컨트롤러테스트방법)
- 스프링백엔드단(logger,이클립스콘솔에서디버그) 
- 스프링RestApi단=Ajax(로거디버거로하지않고, RestApi리턴값으로 디버그)
- 관리자단 대시보드 작업. 기반작업에 사용 - 사용자단 메인 최신겔러리, 최신 공지사항 출력에 사용
- 컴파일 된 jsp(import자바변수값이 들어감)와 컴파일 되기전 jsp(include자바변수값 않들어감)

#### 20210705(월) 작업.
- App name = Host name = 호스트네임.herokuapp.com(호스트네임<도메인네임)
- 클라우드 콘테이너 생성시 위 와같은 방식으로 호스트네임 도메인을 부여 합니다.
- 헤로쿠 클라우드에서 App 생성
- Deploy에서 에러: No web processes running
- 현재 프로젝트에 클라우드용 설정파일이 필요 = 헤로쿠에서 Procfile 확장자없는 설정파일이 필요
- 위 Procfile에서 web processes running 시키는 라인이 추가 되어야 함.
- 스프링에서 작업해서 배포한다는 의미: ALL or Not ALL
- PHP는 작업한 개별파일 1개씩 수정해서 올리는 방식(워드프레스, 그누보드 등등)
- 스프링은 작업한 파일이 1개라도 1개만 올리는 것이 아니고, 모든파일을 컴파일해서 패키징(war파일)한 후 업로드 합니다.
- hsqldb 외부모듈 pom.xml에 추가.(자바기반 DB사용가능)
- 우리프로젝트에 HsqlDB를 생성.(메이븐에서 Hsql모듈을 업데이트하면, 사용가능)
- 오라클은 로컬에서 개발, HsqlDB는 헤로쿠 클라우드용을 개발할 수 있도록 root-context.xml에서 설정예정.
- 아래 3가지가 root-context에 추가 됩니다.
- 1. hsql용 jdbc드라이버를 스프링빈으로 생성하기
- 2. DB생성 스크립트 실행
- 3. DB매니저실행하기
- 현재 까지 작업한 소스를 여러분 이름 도메인으로배포예정 kimilguk-spring5.herokuapp.com

#### 20210702(금) 작업.
- 수정/탈퇴(마이페이지) JSP기능 추가 마무리OK.
- 사용자단 회원가입 작업OK.
- form폼에서 name은 VO/매퍼쿼리 필드명동일, id는 선택해서 jsp(UI)단에서 제어(j쿼리)할때 사용.
- 사용자단 에러발생시 이쁘게 보이게 화면처리.
- error_spring.jsp 만듭니다.
- 위 jsp를 에러발생시(Exception) 무조건 나오게 처리: AOP중 @ControllerAdvice로 구현합니다.
- 위 어드바이스컨트롤러에서 에러메세지를 캐치해서 jsp에러페이지로 보내서, 에레메세지를 이쁘게 확인합니다.
- 404에러는 컨트롤러에서 발생되지 않습니다. 그래서, 별도파일을 만들어야 합니다.
- 톰캣서버에서 발생되는 에러코드404이기 때문에 web.xml에서 설정을 추가합니다.
- 404코드가 발생시 error_404.jsp와 바인딩되는 설정입니다.
- 홈컨트롤러에서 Get /home/error/error_404경로추가
- -----------------------------------------
- 헤로쿠 클라우드에 배포준비예정.
- 헤로쿠 클라우드는 미국의 회사로서 컨테이너를 제공하는 회사
- 컨테이너는 리눅스OS>톰캣WAS>자바JVM>스프링>컨테이너에 포함됨 기본.
- 외부 서버는(DB) Add on이라는 이름으로 사용가능
- 무료: PostgeresDB(조건없음), 마리아DB(신용카드등록필수)
- 유료: Mysql(유료)
- HsqlDB로 연동해서 헤로쿠에 배포예정. http://hsqldb.org/
- 100% Java Database: 임베디드DB, 메모리DB, 서버를 설치할 필요 Hsql이라는 Maven모듈만 있으면가능
- 프로토타입 작업시 주로 사용.(특징, 쿼리는 Mysql과 99% 동일)

#### 20210701(목) 작업.
- 어제 작업한 security-context를 데이터 변수값의 이동기준으로 다시 설명.
- 수업 시작전 깃허브 암호정책 변경으로 토큰사용하는 방법 공유, 8월부터 변경됨.
- 람다식사용예 : https://github.com/miniplugin/SQLite-kimilguk/blob/master/app/src/main/java/com/human/sqlite_kimilguk/MainActivity.java
- 어제 시큐리티적용 부분 확인(web.xml에서 누락된 부분 모두 추가)

```
<!-- 스프링 시큐리티때문에 필터(걸러주는)추가 -->
<filter>
	<filter-name>springSecurityFilterChain</filter-name>
	<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>
<filter-mapping>
	<filter-name>springSecurityFilterChain</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>
```
- 어제 시큐리티 context 누락된 부분 추가(security-context.xml)

```
<security:authentication-provider>
	<security:password-encoder ref="passwordEncoder" />
</security:authentication-provider>
<!-- 위 쿼리에서 사용할 패스워드 암호화 id passwordEncoder 빈 클래스를 생성(아래) -->
<bean id="passwordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" />
```
- 스프링시큐리티 로그인및 권한체크 설정 후 사용자단 로그인 구현 예정.(관리자단 끝 이면서, 사용자단 시작): 사용자단 로그인 / 로그아웃 기능 처리OK.

#### 20210630(수) 작업.
- 댓글 Delete 구현 후 마무리OK.

#### 20210629(화) 작업.
- json데이터(1개레코드=K:V무제한형태)가 자바의 List데이터(1개레코드=K:V제한형)와 대부분 같음. 틀린점은 K:V 형태는 같으나 V값이 무제한,제한
- 게시물 상세보기 페이지에는 
- 게시물관련내용: 컨트롤러에서 보낸 model객체에 담긴 변수값을 jps사용.
- 댓글 관련내용: Rest컨트롤러에서 보낸 ResponseEntity객체에 담긴 변수값을 jsp사용.
- RestAPI가 주로 사용되는 곳은: 1페이지로 서비스가 이루어지는 곳에서 주로 RestAPI를 사용
- 데이터를 시각화하는 페이지에 주로사용: 구글맵,네이버맵기반의 데이터를 시각화해서 수익창출 서비스.
- RestAPI가 스프링과 노드js 연동하면 + 구글맵, RestAPI실시간으로 결과공유할 수 있게 만든것.
- 수업전 아래 내용 확인 후 진도 나갈 예정 입니다.
- reply컨트롤러에서 requestMapping 밸류값 넣을때 절대경로인 /로 시작하시는 것이 맞습니다.
- Rest컨트롤러에서 CRUD중 Delete마무리OK.
- jsp에서 1페이지만 작업하면 끝 $.ajax를 이용해서 RestAPI서버 사용.
- $.ajax로 CRUD를 구현할때는 전송값은 json데이터(submit으로 않보냄)로 보내고(form태그가 필요없음),:submit은 폼태그가 있을때만 작동되는 브라우저 내장 명령입니다.
- , 받은때는 List(json),CUD(문자열)
- 댓글 RUD는 모달(팝업)창에서 작업시작.

#### 20210628(월) 작업.
- 댓글 VO제작->매퍼쿼리제작->DAO클래스제작->Service클래스제작/여기까지-
- ----------------------------------------------------
- >@RestController클래스제작: 일반 컨트롤러와 다르게 반환값이 body로 출력됨.
- >크롬부메랑테스트(JUnit테스트대신)->JSP제작(1페이지CRUD처리Ajax이용)
- 위 작업전, 크롬 확장프로그램중 부메랑을 한번 실습해 봅니다. id_check메서드로...
- 네트워크로 자료를 전송하는 방식: SOAP소프(구버전프로토콜), REST레스트(HTTP방식으로 헤더에 자료를 담아서 보내는 방식 - 신버전)
- Endpoint: 마이크로서비스는 RestAPI로 구현되고, 요청하는 URL을 엔드포인트라고 합니다.
- 엔드포인트(URL주소)에는 데이터를 전송할때, 쿼리스트링으로 보내지 않는방식 트렌드
- 예, 구방식 /reply/reply_list?bno=59&page=1 -> @RequestParam 애노테이션으로 받음
- 예, 신방식 /reply/reply_list/{게시물번호값}/{페이지번호값} -> @PathVariable 애노테이션으로 받음.
- 결과, /reply/reply_list/59/1 (목적은 구글검색에 쉽게 노출시키기 위해서)
- 트렌드:마이크로서비스, 기존 컨트롤러(게이트웨이)를 모두 RestController(Rest게이트웨이)로 변경이 필요.

#### 20210625(금) 작업.
- Pull이 않되는 원인: 로컬 이클립스에서 commit할 것이 남아있으면 PULL 않됨. 해결책은: 이클립스에서 커밋 후 다시 PULL로 해결.
- 게시물관리 Create 작업 마무리.
- 고전CRUD 와 RestFull(API)방식 차이점: 고전(화면이 이동하면서 CRUD처리), Rest방식-대세코딩(1개화면에서 CRUD처리)
- 관리자단 댓글관리 CRUD 처리(6.RestAPI서버구현,JUnit대신에 크롬부메랑으로 테스트)
- 댓글 VO제작->매퍼쿼리제작->DAO클래스제작->Service클래스제작/여기까지->@RestController클래스제작->크롬부메랑테스트(JUnit테스트대신)-

#### 20210624(목) 작업.
[복습]오늘 작업한 첨부파일 처리도 데이터 변수의 이동상태나 변수값이 제일 중요합니다.
핵심은 아래와 같습니다. Attach테이블에서 select쿼리 결과 테이터 구조는 아래와 같습니다.
List<AttachVO> delFiles = [
{"save_file_name":"abc1.jpg","real_file_name":"한글이미지1.jpg","bno":"bno10"},
{"save_file_name":"abc2.jpg","real_file_name":"한글이미지2.jpg","bno":"bno10"}
]
데이터베이스에서 가져올때, 위와 같이 구조가 발생됩니다. 구조를 정리하면 아래와 같습니다.
대괄호 List[VO배열] 안에 
중괄호 VO{1개레코드 } 안에
콜론으로 "키":"값" 구분 후 콥마, 로 멤버변수들을 구분합니다.

- file.getBytes() 설명 포함 board_update메서드 리뷰 후 수업진행.
- 작업순서: CRUD -> U 작업OK.
- Create작업: 
- update: updateBoard(서비스)참조 -> board_update(컨트롤러)작업+jsp작업
- 업데이트 이후엔 파일업로드 구현 후 /download 컨트롤러 실습OK.

#### 20210623(수) 작업.
- 시큐어코딩 방지메서드: <(O|o)bject... -> &lt;object (목적은 코딩태그를 특수문자로 변경 하는 메서드)
- 실행되지 않는 코드가 생성됨.
- 세션 사용법: 겟(Get),셋(Set),삭제(Remove)하는 방법
- 세션 생성법: session.setAttribute("세션변수명","값");//로그인시 세션변수 생성.
- 세션 값불러오기: session.getAttribute("세션변수명");
- 세션 삭제하기: session.removeAttribute("세션변수명");//변수삭제
- 전체세션삭제하기: session.invalidate();//전체 세션변수명을 삭제 = 세션초기화 = 로그아웃시 사용.
- 수업전 작업예정: ie11이하계열에서 한글 검색 후 페이지 선택시 400에러발생(크롬계열은 문제없음)-AOP로처리.

```
내일 수업전 실숩 순서는 아래와 같습니다.
아래 순서대로 하시고, 개선된 기능은 수업시 알려 드리겠습니다.^^
ie에서 한글검색과 페이징처리 함께사용시 에러상황 처리
AOP로 처리 되었습니다.
-#1 AOP에서 아래내용 추가
String search_keyword = null;
search_keyword = pageVO.getSearch_keyword();
if(search_keyword != null) {//최초로 세션변수가 발생
   session.setAttribute("session_search_keyword", search_keyword);
}
if(session.getAttribute("session_search_keyword") != null) {
   search_keyword = (String) session.getAttribute("session_search_keyword");
   if(pageVO != null) {//Set은 pageVO가 null아닐 경우만 실행되도록
      pageVO.setSearch_keyword(search_keyword);//검색목표달성:여기서 항상 값을 가져가도록 구현됩니다.
   }
}
-#2 member와 board 뷰jsp파일에서 아래 내용을 일괄 삭제
&search_keyword=${pageVO.search_keyword}
-#3 AdminController에서 아래 내용 일괄 삭제
+"&search_keyword="+pageVO.getSearch_keyword()
-#4. 기능개선 추가
AspectAdvice클래스 PageVO가 메서드매개변수 인스턴트인 조건시 추가
if(pageVO.getPage() == null) {
 session.removeAttribute(“session_search_keyworb”);
}
또는
검색창에 ${session_search_keyword}추가
그리고, include폴더 header.jsp 에 링크값에 ?search_type= 추가
```
#### 20210622(화) 작업.
- 수업시작전 아래 내용 확인

```
pageVO 객체가 발생하지 않는 곳에는 에러가 발생됩니다. 에러발생시 수정하실 부분은 아래와 같습니다.
[수정전-아래]
- pageVO.setBoard_type(board_type);//검색목표달성:...
[수정후-아래]
if(pageVO != null) {
   pageVO.setBoard_type(board_type);//검색목표달성:...
}
```
- 정방향으로 개발시작.VO제작.->매퍼쿼리제작.->DAO클래스제작->Service클래스제작.->Controller+jsp
- 위 내용중 게시물 관리에서 CRUD 컨트롤러 + jsp 처리(4.파일업로드구현)
- 작업순서: RUD -> RD 작업OK.
- Read: readBoard(서비스)참조 -> board_view(컨트롤러)작업+jsp작업
- 관리자단 댓글관리 CRUD 처리(6.RestAPI서버구현,JUnit대신에 크롬부메랑으로 테스트)
- 에러상황: ie11이하계열에서 한글 검색 후 페이지 선택시 400에러발생(크롬계열은 문제없음)-AOP로처리가능한지검토

#### 20210621(월) 작업.
- 다음주 스프링시큐리티: 로그인정보가 발생=세션 , 즉, 로그인정보(세션)이없으면, 홈페이지가도록 작업 예정.
- 핵심은 Session 클래스객체 사용한 내용.
- 관리자단 게시물관리 CRUD 처리(4.파일업로드구현,5.트랜잭션구현OK).
- @Service 클래스 마무리OK.
- 정방향으로 개발시작.VO제작.->매퍼쿼리제작.->DAO클래스제작->Service클래스제작.->Controller+jsp
- 게시물관리 리스트까지 작업OK.
- 트랜잭션? 여러개의 메서드를 1개 처럼 처리하게 구현하는 애노테이션을 사용.-목적:데이터무결성유지.
- 1단어로 표시: All or NotAll(모두실행되던지, 에러발생 모두 실행이 되지 않던지)
- root-context와 servlet-context설정파일에 트랙잭션과 파일업로드설정처리OK.
- @Controller 클래스 추가(파일업로드/다운로드구현) > jsp 화면처리
- @Service 트랜잭션 기능 추가.
- @Aspect 기능 마무리OK.
- AOP기능중 Aspect기능의 설정은 servlet-context.xml에 위치필수.

#### 20210618(금) 작업.
- 검색처리는 멤버쿼리에서 작성한 내용 붙여넣고, 다중게시판용 필드조회조건 board_type 추가.
- 관리자단 게시물관리 CRUD 처리(4.파일업로드구현,5.트랜잭션구현).
- 게시물관리 시작: 다중게시판? 1개 페이지로 board_type 변수를 이용해서 공지사항,겔러리,QnA... 구별해서 사용.(쿼리스트링이 길어져서 @Aspect로 사용)
- 정방향으로 개발시작.VO제작.->매퍼쿼리제작.->DAO클래스제작->Service클래스제작.
- 상황1: 2사람 이상이 동시에 글을 쓴다. 모두 첨부파일 추가하는 상황
- 실행순서: 사람1: insertBoard -> bno(101) -> 첨부파일 insertAttach -> bno필요
- 사람2: insertBoard -> bno(102) -> 위에 있는 사람1이 사람2 bno갖다가 사용하는 경우는?
- 해결책1: @Transantional 을 insertBoard메서드를 감싸 주면, 간단하게 해결.
- 해결책2: insertBoard 쿼리에 return 값을 bno 받아서 insertAttach를 실행하게 처리.
- @Service까지는 DB(테이블) CRUD합니다.
- 그러면, 첨부파일은 @Controller에서 업로드/다운로드 로직 여기처리 그래서, 여기서 코딩이 제일 지저분합니다.
- ================================================

- 어제 결석한 학생 수업 후 시험지 배포 및 과제물 제출 시간을 줌에서 갖도록 하겠습니다.

#### 20210617(목) 작업.
- [복습]:스프링의 기능 IoC(제어의 역전:객체의 메모리관리 개발자가 X, 스프링이 대신), DI(의존성 주입,@Inject)
- 수업시작전 UI디자인 과제물 확인 후 진도 나갑니다OK.
- 관리자단 게시판 생성관리 RU 페이지 마무리예정OK.
- 관리자단 외쪽메뉴에 게시판종류가 실시간으로 출력이 되야 하는데, 지금은 게시판 생성관리 목록 페이지에서만 보임.(문제점)
- 위 문제를 해결하는 방식으로 AOP기능을 사용합니다.
- 스프링 AspectOrientedProgram구현은 3가지방식: @Aspect, @ControllerAdvice, intercept(가로채기)태그사용를 사용해서 관점지향프로그래밍을 구현.
- AOP용어: 관점지향?-프로그램전체에 영향을 주는 공통의 기능 적용하는 패턴 기법.
- AOP용어: Advice(충고-간섭):프로세스작업 중간 필요한 기능을 끼워넣는 것을 어드바이스 라고 함.
- Advice : 포인트컷(충고-간섭,필요한 기능을 끼워넣는 시점, @Before, @After, @Around실습)
- 게시판종류 출력: @ControllerAdvice로 구현.(게시판생성관리CRUD작업시 실습)
- @ControllerAdvice 실행조건: 컨트롤러 클래스의 메서드에만 Advice(간섭) 가능.
- 검색시 pageVO처럼 board_type을 값을 계속 유지하는 기능: @Aspect로 구현.(게시물관리CRUD작업시 실습)
- @Aspect장점: 특정클래스의 특정메서드실행시(포인트컷) 자동실행되는 메서드를 지정이 가능.
- @Aspect 실행조건: 컨트롤러 에 더해서 서비스(실습),DAO클래스의 메서드에도 Advice 가능.
- 보안-로그인체크,권한체크시 : intercept(스프링시큐리티)태그를 사용해서 구현.(로그인기능,권한체크기능구현시 실습)
- intercept태그는 스프링시큐리티에서 관리.
- ----------------------------------
- 오후 수업전 component-scan태그 위치 확인: root-context, servlet-context
- 관리자단 게시판 생성관리 CD 처리OK.(3.스프링의 AOP기능구현OK).
- UI디자인 과제물제출 4교시 OK.

#### 20210616(수) 작업.
- [공지]06-17 목요일(4교시) UI 디자인 시험 있습니다.(화면기획서XLS제작, 화면설계서PPT제출용) 확인 후 수업진행.
- 10년,20년,지금 변하지 않는것은 변수값의 흐름은 변함이 없음. 정방향 개발시작
- --------------------------------------------
- 시작.VO->매퍼쿼리xml->DAO클래스생성->Service클래스생성->컨트롤러생성->jsp화면처리
- 관리자단 게시판 생성관리 리스트 페이지 OK.

#### 20210615(화) 작업.
- 관리자단 회원관리 수정 암호 수정 잘 되는지 확인OK.
- 회원관리 CRUD 화면 JSP구현 update(OK),delete(OK),insert(OK)
- [공지]06-17 목요일(4교시) UI 디자인 시험 있습니다.(화면기획서XLS제작, 화면설계서PPT제출용)

#### 20210614(월) 작업.
- 수업 전 관리자 회원관리 view화면구현 마무리OK.
- multipart(첨부파일기능) 라는 폼태그 전송방식을 추가 -> commons.fileupload 외부모듈필수(pom.xml에서 의존성을 추가합니다.)
- 위 외부모듈을 스프링 빈으로 등록합니다.(servlet-context.xml 하단에 추가)
- CRUD에서 multipart를 사용한다면, 리졸브(resolve-해석기) 스프링빈이 필요

```
<beans:bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
   </beans:bean>
```
- GET: Insert  (외부 사이트 입력폼에서도 입력가능) - 쿼리스트링으로 데이터전송 url?key=value&key2=value2
- POST: Insert (외부 사이트에서 입력불가능, 같은 사이트의 입력폼에서만 입력가능) form의 입력태그(히든스트링)로 데이터전송
- 나머지 관리자 회원관리 CRUD 화면 JSP구현 update(OK), delete(OK)

#### 20210611(금) 작업.
- 수업전 관리자단 회원관리 페이징처리에서 컨트롤러와 calcPage()메서드의 관계 간단하게 확인하겠습니다.
- JSTL: Java Standard Tag Library 자바표준태그모듈로서 JSP에서 자바를 사용하는 표준.
- taglib uri(유니폼 리소스 ID-의미가있는고유값=식별값) > url(링크경로)
- prefix(접두어), 태그 별칭 사용 예, <c 시작
- 관리자단 회원목록 처리 마무리(1.페이징및 검색기능구현)OK.
- model을 이용해서 결과를 JSP로 구현.(2.JSP화면은 표준언어인 JSTL로 구현)

#### 20210610(목) 작업.
- 컨트롤러를 이용해서 관리자단 회원관리화면 JSP 만들기 진행시작.
- JUnit 마치고, 관리자단 회원관리(CRUD) jsp까지는 작업합니다. 이후 앞에 내용참조해서 확장해 나가는 작업이 이어집니다.
- 수업전 내용 확인 합니다.(아래)
- 쿼리실습에서 .equals함수 사용에 대해서 설명할때,아래 isEmpty메서드와 착각해서 이야기 한 내용이 있어서 정정 합니다.
- 자바에서 객체가 공백 또는 비었는지 비교할때, 예를 들면, 우리프로젝트에서 첨부파일이 있는지 비교할때 아래 처럼 사용하지 않고
- if(save_file_name != null && "".equals(save_file_name))
- 다음처럼 짧게(널과공백체크를 한번에) 사용합니다.(아래)
- if(!save_file_name.isEmpty()) //게시판 첨부파일 체크시 사용예정
- =========================================
- GTM시간(그리니치천문대기준-표준시)-KST한국시간과는 9시간.
- DB서버에 타임존설정 Asia/Seoul되어 있으면, 그냥사용.
- 만약 위 GTM + 9시간해서 Insert, Update 한국시간으로 사용.
- JUnit에서 회원관리 나머지 Read 테스트 진행OK.
- 오라클일때 확인 : (어제 카톡 단톡방에 있음)
SELECT TO_CHAR(systimestamp + numtodsinterval( 9, 'HOUR' ), 'YYYY-MM-DD HH24:MI.SS.FF4')  from dual;
- Mysql(마리아dB)확인 :(어제 카톡 단톡방에 있음)
SELECT DATE_ADD(NOW(3), INTERVAL 9 HOUR);
- -------------------------------------------
- 업데이트 실습은 회원암호를 스프링시큐리티5 암호화(1234->해시데이터)로 일괄변경 실습예정.
- 정방향 암호화 가능, 역방향 복호화는 불가능(JAVA용 스프링시큐리티암호화,DB용 MD5등등)

```
BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
String userPwEncoder = passwordEncoder.encode(memberVO.getUser_pw());
memberVO.setUser_pw(userPwEncoder);
```

#### 20210609(수) 작업.
- 프로젝트를 진행: 보유기술 70%(솔루션있는업체) + 신기술 30%(개발사도 모릅니다) - 9할 성공
- PageVO.java 클래스 생성 마무리OK.
- JUnit에서 위 작업한 내용을 기준으로 selectMember() 테스트 진행OK.(검색,페이징)
- <![CDATA[ 쿼리 ]]> : 태그 안쪽에 부등호를 사용하기 위해서 문자열 변환 태그를 사용.
- 쿼리에서 변수와 문자열과의 연결할때는 +(자바)X, ,(X), ||(O)
- JUnit에서 회원관리 나머지 CRUD 테스트중 Create, Delete진행OK.

#### 20210608(화) 작업.
- 페이징에 사용되는 변수(쿼리변수+VO변수) 아래
- queryStartNo, queryPerPageNum, page, perPageNum, startPage, endPage
- 검색에 사용되는 변수(쿼리변수만): 검색어(search_keyword), 검색조건(search_type)

```
--SQL쿼리 페이징을 구현해서 변수로 삼을것을 정의
--PageVO의 멤버변수로 사용예정
SELECT TableB.* FROM
(
    SELECT ROWNUM AS RNUM, TableA.* FROM
    (
        SELECT * FROM tbl_member
        WHERE user_id LIKE '%admin%'
        OR user_name LIKE '%사용자8%'
        ORDER BY reg_date DESC
    ) TableA WHERE ROWNUM <= (1*5)+ 5 --  (page*b)+b
) TableB WHERE TableB.RNUM > 1*5      --  (page*b)
--페이징쿼리에서 필요한 변수는 2개
--현재페이지수의 변수 page*b == queryStartNo
--1페이당보여줄 개수의변수 b == queryPerPageNum
--PageVO에서 필요한 추가변수: page
--UI하단의 페이지 선택번호 출력할때 사용하는 변수(아래) 
-- perPageNum 변수받아서 startPage, endPage 를 구해서
-- 하단의 페이지 선택 번호를 출력
```
- 스프링코딩 작업순서 1부터6까지(아래)
- 1. ERD를 기준으로 VO클래스를 생성.
- M-V-C 사이에 데이터를 입출력하는 임시저장 공간(VO클래스-멤버변수+Get/Set메서드) 생성 
- 보통 ValueObject클래스는 DB테이블과 1:1로 매칭이 됩니다.
- 2. 매퍼쿼리(마이바티스사용)를 만듭니다.(VO사용해서쿼리생성).
- 3. DAO(데이터엑세스오브젝트,DTO)클래스를 생성(SqlSession사용쿼리실행).*Sql세션은 root-context에 빈으로 만들었습니다.(2개)
- IF인터페이스는 만드는 목적: 복잡한 구현클래스 간단하게 구조화 시켜서 개발자가 관리하기 편하기 정리하는 역할 -> 기사시험책 캡슐화 구현과 관련(알약 캡슐-안에 어떤약이 있는모르게 먹게하기) 프로그램에서도 캡슐화는 구현 내용을 몰라도, 이름만 보고 사용하게 만든것.
- 스프링 부트(간단한 프로젝트)에서는 4번 Service클래스가 없이 바로 컨트롤러로 이동합니다.
- 4. Service(서비스)클래스생성(서비스에 쿼리결과를 담아 놓습니다.)(1개)
- 게시물을 등록하는 서비스1개(tbl_board-DAO1+tbl_attach첨부-DAO2)
- JUnit에서 위 작업한 내용을 CRUD 테스트(선배작업) -> 대리,사원에게 아래 작업을 맡김.
- 5. Controller(컨트롤러)클래스생성(서비스결과를 JSP로 보냅니다.)
- 6. JSP(View파일) 생성(컨트롤러의Model객체를 JSTL을 이용해 화면에 뿌려 줍니다.)
	
#### 20210607(월) 작업.
- 마이바티스 추가 순서: 1번+2번 끝
- 1. pom.xml에 의존성 추가.
- 2. 마이바티스설정파일 추가(쿼리를 저장할 위치지정+파일명지정)OK.
- JUnit로 CRUD 실습(아래). - 코딩 시작.
- JUnit의 oldQueryTest메서드처럼 직접쿼리를 사용하지 않고, 쿼리를 관리하는 프로그램으로 제어를 합니다.
- 위 쿼리를 관리하는 프로그램이 마이바티스 입니다. 그래서, 마이바티스 모듈을 추가한 후 JUnit실습을 진행합니다.
- 스프링: 관리자단, 회원관리부터 스프링 작업예정.
- 책 스프링 웹프로젝트는 개발 STS(스프링툴슈트) 툴.=> 기반은 이클립스 기반을 확장.
- 우리가 하는 책 스프링 웹프로젝트는 개발 전자정부표준프레임워크 개발 툴. => 기반은 이클립스 기반을 확장. => 전자정부표준프레임워크 를 커스터마이징(제외)
- --------------------------------------
- 스프링에서는 마이바티스를 이용해서 쿼리를 관리하게 됩니다.
- 이전에는 자바코드(jsp코드)안에 쿼리를 만들어서 프로그램을 제작하였음. -> 문제점발견(스파게티 코딩)
- MVC로 분리: Model부분의 SQL쿼리를 분리하도록 기능을 추가한 것이 마이바티스 입니다.
- 마이바티스(mybatis): 형은 아이바티스(ibatis) 지금X -> 마이바티스(현재)
- 스프링이(마이바티스) 나오기 전에는 쿼리를 모아서 작업을 프로시저로 만들어서 작업을 했습니다.
- 지금은 스프링으로 옮기지 못한 프로그램만 제외하고는 대부분 마이바티스로 쿼리를 관리합니다.
- 그래서, 마이바티스 메이븐 셋팅을 합니다.
- 오라클의 DB관리 로그인정보(Application Express웹프로그램이름): admin/apmsetup -> 암호변경요청: Apmsetup1234%(대문자추가+특수문자추가+숫자)

```
-- SQL디벨러퍼 에서 system으로 로그인후 아래 쿼리로 XE2사용를 완벽하게 지우기(아래)
SELECT * FROM all_users;
-- all_users는 테이블X, 시노님(동의어)
--delete from all_users where username='XE2';
--시노님=테이블명이 사용하기 힘들정도로 길거나
--오라클은 스프링과 같은 방식 패키지명안에 함수,
--프로시저(오라클프로그램)를 만들수 있습니다.
--패키지명이 길어서 사용시 개발자에게 부담이 됨.
--위 상황을 해결하도록 만든것이 시노님(동의어)임.
DROP USER XE2 CASCADE;--XE2사용자를 지울때, 
--XE사용자가 생성한 테이블까지 모두 지우는 명령.
--CSS(Cascade계층형 Style Sheet)
```
- 현업에서는 오픈소스인 mysql(마리아DB)를 사용하실 기회가 더 많습니다.-개발자가 많은 편.
- 오라클은 납품시 SW비용이 산정이 되어서 사용하실 기회가 적지만, 개발자가 상대적 적은 편.
- 보통은 학교,시청,기업체 전산실 에 부탁을 해서 XE(기타)사용자를 추가해 달라고 요청해서, 발급받은 계정으로 개발을 시작
- 오라클 기초이론 마무리: 시퀸스(스프링에서 사용-AutoIncreament자동증가기능)
- 만약 시퀸스(AI)기능이 없다면, 게시물 작성시 첫번째, 두번째 게시물 등등을 구별하는
- 숫자를 계속 추가하려면, 현재까지 저장된 게시물의 최고번호값(Max)을 구해서 +1 해야 합니다.(개발자가 Insert시)
- DB에서 기본으로 위 Max값을 구해서 + 1하는 로직을 만들게 됩니다. 이 기능이 시퀸스(AI) 입니다.
- 우리 스프링 프로젝트에서는 2개 시퀸스를 만듭니다.(게시물 시퀸스SEQ_BNO, 댓글 시퀸스SEQ_RNO)
- 시노님(긴 객체를 개발자가 타이핑하기 어려워서 만든 단축 이름) 예, sys.dual -> dual 단축이름으로 사용가능
- 오라클: 더미데이터 일괄등록 예정. 회원관리(100명), 게시판관리(공지사항50개,겔러리50개) OK.
- 위 더미데이터는 프로시저(함수)라는 DB프로그램방식으로 추가합니다.
- 오라클: 댓글은 수동등록 후 마무리.(추후 코딩시 작업)

```
쿼리에서 초단위와 밀리초(천분의 1초) 단위 계산 비교
- 오라클:
초단위 계산: sysdate+(cnt*(1/24/60/60))
밀리초단위 계산: systimestamp + numtodsinterval( cnt / 1000, 'SECOND' )
- Mysql(마리아DB): 밀리세컨드는 MySQL 5.6.4 버전부터 지원가능합니다.
밀리세컨드는 천분의 1초 mysql에서 now(3),
마이크로세컨드가 백만분의 1초 입니다. mysql에서 now(6)으로 시간이 표현 됩니다.(아래)
초단위: ADDTIME(now(), cnt);
밀리초단위: ADDTIME(now(3), cnt*"0.000001")
마이크로초:  ADDTIME(now(6), cnt*"0.000001")
```
#### 20210604(금) 작업.
- 오라클일때: localhost:1521/xe 접속URL끝의 xe 서비스(서버)ID명  1개 > XE, XE2 스키마2개(DB2개) 존재합니다.
- 오라클은 사용자명(XE)이 스키마명(DB명)입니다. 사용자(XE2)워크스페이스를 추가하면 스키마(DB)가 새로 만들어 집니다.(구버전은 테스크답프로그램 -> 지금은 웹프로그램 사용자추가/DB(테이블스페이스)추가
- Mysql(마리아DB): localhost:3306/XE URL끝의 XE 스키마명(DB명)
- junit테스트시 SQL에러를 디버그하는 방법은 jdbc드라이버 -> log4jdbc드라이버 바꾸면, SQL에러가 나오게됩니다.
- junit에서는 SQL에러가 보입니다. 콘솔창에는 보이지 않습니다. 콘솔창에서 SQL로그상황이 나오게 하는 드라이버를 추가pom.xml에 추가합니다
- 오라클: 07장 마무리 후 13장으로 바로 실습OK.(나머지는 아래 실습 후)
- 스프링: JUnit테스트: oldQueryTest메서드 실습OK.
- 오라클: 08,09,10,11,12,14장 실습OK.

#### 20210603(목) 작업.
- 작업비중(시간)=관리단프로그램(70%)+사용자단(30%)
- 스프링에서 오라클연동 순서 2가지:
- 1. jdbc(Java DataBase Connection) 확장모듈 pom에 추가.
- 2. 오라클 접속 드라이버 확장 모듈을 pom에 추가X 직접 jar 파일을 추가.
- root-context.xml 파일에 오라클 커넥션 빈(스프링클래스)을 추가.
- 스프링이관리하는 클래스를 추가하는 방법2-1: @Controller,@Repository,@Service,@Component
- 스프링이관리하는 클래스를 추가하는 방법2-2: -context.xml에서 빈(bean태그)을 추가하면, 스프링 클래스 됨.
- 오라클 05장부터 CRUD 실습.
- admin 회원관리(jsp디자인) 부터 프로그램 작업 시작예정.

#### 20210602(수) 작업.
- 예외처리하는 목적: 에러상황에서도 프로그램이 중단되지 않도록 하는 것이 주목적(에러상황을 세련되게 넘기게 처리)
- 스프링에서는 개발자가 처리하는 100의코딩에서 2-3개정도(파일업로드,다운로드)이고, 대부분 throws Exception 스프링으로 넘김.(예외의 전파)
- 쓰레드:thread, 실행되는 프로그램을 말함, 1개 프로그램에는 보통 1개 쓰레드가 실행(웹프로그램은1:1쓰레드임), 특이한 경우(http웹네트워크 프로그램인경우-게시물 다운로드버튼 다운로드 100G 쓰레드가실행 되면서, 리스트버튼을 클릭했을때 목록보기 쓰레드가 동시에 실행-안드로이드앱에서필요) 여러개 쓰레드 실행이 필요한 있습니다.
- 예외처리: Throwable 오브젝트가 실행시 에러가 발생하면, 예외(내용)를 보낼때(던질때) 사용하는 클래스 Throwable클래스 입니다.
- 스프링앱에서는 예외(에러)정보를 스프링 처리합니다.
- 자바앱에서는 예외(에러)정보를 개발자가 처리합니다.(개발자가 손이 많이 갑니다.) 지금 실습합니다.
- 예외처리: 에러발생시 프로그램이 중지되는 것을 방지하고, 계속 프로그램을 사용할 수 있도록 처리하는 방법=Exception
- 패키지는 관련기능을 한곳에 모아서 개발자 관리하기 편하게 하기 위해서 구분한 이름(폴더명)
- Controller클래스 + home/index.jsp(화면) 한쌍 입니다. 그래서,컨트롤러클래스 만든 변수를 index.jsp에서 사용가능하게 됩니다.
- 안드로이드앱 = 액티비티(java) + 레이아웃.xml(화면) 한쌍
- C#닷넷 = test.aspx.cs(프로그램) + test.aspx(화면) 한쌍
- 일반홈페이지(cafe24)-URL직접접근이 가능(보안위험높음)
- MVC웹프로그램 차이점-URL직접접근이 가능X(보안위험낮음)-관공서,대학,은행 주사용
- MVC프로젝트에도 URL직접접근이 가능한 resources폴더 직접접근이 가능-static 콘텐츠(html,css,js)를 모아 놓은 폴더.views폴더 jsp는 직접접근이 불가능
- Views폴더처럼 직접접근이 불가능한 컨텐츠는 Controller(라우터)로 접근하게 됨
- views/home/index.jsp 엑박처리OK, 분해는 관리자단 실습 후 작업합니다.
- 개발순서: ERD제작 -> html제작 -> jsp제작(현재:관리자단10기능 작업 후 사용자단5기능)
- admin 폴더 만든이후 분해OK. Junit 실습 후 작업합니다.
- Junit(Java Unit Test): 자바 단위 테스트(서비스프로그램만들기전 프로토타입 시제품 제작)- Junit CRUD 작업 후 본격작업시작.
- 로거의 레벨: DEBUG > INFO > WARN > ERROR > FATAL
- 개발할때: DEBUG 로거레벨을 설정
- 납품할때: WARN 으로 로거레벨을 변경
- 4장 패키지와 예외처리 실습 후 오라클 CRUD 실습.

#### 20210601(화) 작업.
- 에러: 404(file not found 경로이상일때), 500(자바프로그램에러)
- 프로젝트의 버전을 올립니다. -> 외부라이브러리 부분의 버전을 올림 - 메이븐 컴파일러 -> pom.xml 버전을 관리 메이븐은 수정 및 추가 -> maven 메뉴에서 maven update 메뉴사용
- Controller클래스에서 생성한 변수 사용(자바)model객체전송(스프링)return home 
- ->(전송은스프링) home.jsp 출력
- 출력하는 방식1: 25년전부터 방식 EL(Express Language)방식출력-${변수} , <%=${변수} %>
- 많이사용하는 방식 JSTL방식(*표준) 사용. 출력,반복,조건 등등 다양한 방식
- 언어를 배우는 순서: 주석 > 디버그하는방법 > 변수 > 메서드(함수) > 클래스 > MVC모델
- 디버그하는 방법: 자바(System.out 이용해서 콘솔창에 출력)
- 스프링에서는 logger(로거) 를 사용해서 디버그 내용을 출력.
- 스프링이 관리하는 클래스(빈)의 종류 3가지.(사용법은 개발자가 만드는 클래스명 상단에 입력)
- 1.@Controller 클래스빈: 라우터역할 메서드를 만듭니다.(라우터역할의클래스기능)
- 2.@Service 클래스빈      : 비지니스로직 메서드를 만듭니다.(개발자위주의외부클래스기능)
- 3.@Repository 클래스빈: Model처리 메서드를 만듭니다.(DB핸들링외부클래스사용)
- 위 3가지의 @를 사용하는 클래스는 DI(객체생성-의존성주입), AOP, IoC(제어의 역전-자동메모리관리)
- 프런트 개발자가 작업한 결과 백엔드 개발자가 확인.
- 일괄바꾸기 1. "/home -> "/resources/home
- 일괄바꾸기 2. '/home -> '/resources/home

- VS code 작업한 html를 이클립스에 배치를 합니다.(프런트개발자가 작업결과 백엔드개발자가 받아서 배치합니다.)
- resources 폴더에 static콘텐츠(html,css,js,font) 배치합니다.
- ERD기준으로 게시판UI 마무리합니다.-board_write.html 부터 시작
- 오늘부터는 VS code -> 이클립스에서 작업합니다.
- 관리자단 AdminLTE적용-스프링시간 선택 후 아래 작업진행예정
- (회원관리CRUD-jsp, 게시판생성관리CRUD-jsp)
- html을 분해(1개의 페이지를 2개로 분해,1.header.jsp(메뉴를공통), 2.footer.jsp(공통))
- 이클립스로 작업한 html 내용을 -> resources 폴더(admin,home,root파일까지)로 배치
- 스프링 작업의 시작

#### 20210531(월) 작업.
- 토드(sql디벨러퍼와 비슷한 상용)에서는 버튼으로 포워드엔지니어링이 처리.
- 무료sql디벨러퍼에서는 버튼X. DDL문을 실행해서 포워드엔지니어링을 처리.
- 참고, mysql용 워크벤치는 무료이지만, 버튼으로 포워드엔지니어링이 가능.
- sql쿼리를 3가지로 분류:
- 초기DDL문: Data Definition Language. 데이터 정의언어 Create table문
- 유지DCL문: Data Control Language.    데이터 제어언어 Commit, rollback
- 개발DML문: Data Manufacture Language.데이터 조작언어 CRUD 쿼리.
- ERD 그림 만든것을 물리 테이블 만드는 것: forward 엔지니어링
- 데이터 딕셔너리를 모델과 동기화: 자료사전(데이터의 데이터)을 DB테이블과 동기화
- 데이터 딕셔너리는 메타 데이터와 동일합니다.:콘텐츠X, 구조, 구성 정보만 존재
- 물리테이블을 ERD 그림으로 만드는 것: reverse 엔지니어링(기존DB분석시 사용)
- 스프링시큐리티는 2단계: 구현예정. 
- 1단계. 로그인인증(ENABLED): AUTHENTICATION (로그인X, 글쓰기 기능X, 관리자X)
- 2단계. 권한체크(LEVELS): AUTHORITY (관리자-admin URL 접근가능, 일반회원은 사용자홈페이지에서 공지사항X, 겔러리만 사용가능합니다.)
- 1:N관계? 게시물1개에 댓글 n개 달릴 수 있음.
- E-R다이어그램은 그림일뿐, 물리DB(테이블)은 ERD기준으로 생성가능.
- PK를 AI(Auto Increment자동증가)로 만들기: 오라클(시퀸스객체로기능구현), Mysql(AI라는 필드속성으로 처리)
- ERD에서 Relation 생성: 게시판타입테이블(부)과 게시물관리테이블(자)의 관계를 생성
- 부자의 관계는 부모의 PK를 기준, 자식에게는 FK(Foreign Key)로 관계를 맺습니다.
- 게시판타입: notice, gallery 2가지가 존재한다면,
- Relation관계가 필요한 이유 : 공지사항이나 겔러리 게시판이 아니면, 개발자가 예외처를 하지 않아도 다른 게시판으로 등록하는 상황 발생이 되지 않게 됨.
- 데이터 무결성을 유지하는 역할.(외래키 관계)
- 필드 데이터형3: Timestamp(시간도장) 년월일시분초밀리초, Date(년월일까지)
- 필드 테이터형2: CLOB(CHAR LOGN BYTE) 글내용이 많을때 사용하는 데이터형태
- 필드 데이터형: VARCHAR2(2바이트를 1글자-한글), VARCHAR(1바이트 1글자-영문전용)
- 테이블구성: 필드(컬럼,열)=테이블의 멤버변수(자바VO클래스의 멤버변수)
- 필드구성: PrimayKey(주키,기본키,고유키)=테이블영역에서 고유한ID를 말함(중복되지 않는 값)
- PK예(개인을 식별할 수 있는값): 로그인id, 개인이메일주소, 주민번호등등, 게시판타입
- RDBMS : RelationDataBaseManagementSystem(관계형데이타베이스관리시스템)
- 오라클: 테이블스페이스(TableSpace) = 스키마(Scheme:Mysql) = 데이터베이스(DB-MS-SQL)
- 지난주 금요일날, 오라클 웹용 관리프로그램에서 XE라는 테이블스페이스를 XE사용자로 추가했음.
- EntityRelationDiagram(ERD-객체관계그림): Entity=테이블
- 데이터 모델: Model Object를 형상화 시킨것을 모델이라고함. 데이터베이스를 말함.
- MVC 스프링프로젝트에서 M이 Model 이고, 스프링프로젝트 구성중에 DB를 가리킴.
- 참고로, V는 View고 jsp를 말합니다.
- 참고로, C는 Controller고 클래스를 말합니다.
- 설치시 암호는 apmsetup 로 통일 합니다.

#### 20210528(금) 작업.
- 추상클래스 실습은 오늘, 인터페이스 실습은 스프링에 엄청하시게 됩니다.
- extends관계클래스에서 this.(현재클래스) , super.(부모클래스)
- 다형성? 메서드 @오버라이드(상속), 메서드 오버로드(동일함수명의 파라미터의 개수, 종류틀린메서드) 구현됩니다.
- 오버라이드: 상속받아서 재정의 메서드 @오버라이드 = 다형성구현했다.
- 오라클11g ExpressEditon 설치예정. OracleXE112_Win64.zip
- SQL디벨러퍼를 다운받아서 압축풉니다. - ERD제작할 예정.
- StructuredQueryLanguage: 구조화된 질의 언어(오라클서버) -> 답변
- QueryString: URL에서 전송하는 값(서버에 질의문)을 문장으로 저장한내용 ?로 시작.
- CommendLineInterface : SQL*Plus 터미널화면으로 SQL쿼리 실행 X
- GrapicUserInter: SQL디벨러퍼 윈도우화면 에디터에서 SQL쿼리 실행 O
- SQL Developer 프로그램으로 ERD 다이어그램그림으로 프로그젝트 구조제작예정.
- EntityRelationDiagram: 테이블관계도형(아래) 
- 프로젝트 진행: 발주(클라이언트) -> 수주(개발사) -> 디자인UI(Client-Dev) -> ERD(이사,팀장) -> 코딩시작(ERD보면서+UI소스에 프로그램입히기)
- ERD에서 SQL쿼리가 생성 -> 물리테이블을 생성.
- -------------------------------------------------
- 첨부파일(자식)->게시판테이블(부모)<-댓글테이블(자식)
- 자바앱에서는 객체를 생성후 사용이 끝나면, 메모리에서 삭제하는 명령이 필수.
- 객체를 메모리에서 삭제: Object = null; Object.close();
- 스프링에서는 내장된 가비지컬렉터(garbage쓰레기수집가)가 자동실행 사용하지 않는 객체를 자동으로 지워줌.
- 위와 같이 개발자가 하던 메모리관리를 스프링의 대신 = IoC(Inversion Of Control)제어의 역전. 스프링 특징3가지(IoC, AOP, DI)
- 수업시작전, static메서드와 객체의 멤버매서드 비교설명
- Step2클래스에서 MeberService 클래스에 직접접근해서 메서드를 실행하려면 static으로 변경(컴파일시 실행가능한 상태로됨=메모리에 로딩)해야 함. 
대신, memberServie객체을 이용해서 메서드에 접근할때는 (호출시=런타임시 실행이가능한 상태로됨=메모리에 로딩)
- 클래스와 상속에 대해서 이론 및 실습
- https://github.com/miniplugin/spring5-kimilguk/blob/master/src/test/java/kr/or/test/ClassApp.java

#### 20210527(목) 작업.
- 3장 객체와 클래스 부터 시작
- 스프링에서는 클래스 extends(상속)보다는 인터페이스(implements)를 더 많이 사용합니다.
- abstract클래스(추상클래스): 구현내용이없이, 메서드명만 있는 클래스,
- 추상클래스는 매서드명만 있기(구현내용이 없기) 때문에, *객체로 만들수 없는 클래스 입니다.
- 부모로서 자식에게 상속만(메서드이름만)해서 재사용만 가능하게 됩니다.
- *객체로 만들수 없다? 실행가능한 클래스로 사용못하지만, 프로그램을 구조화 시킬때 필요.
- Step1 aaa = new Step1();//이렇게 생성자로 객체를 만들지 못함.
- final클래스: 부모가 될 수 없는 클래스(상속해서 재사용이 불가능한 클래스임)
- 접근제어자: public(패키지위치에 상관없이 접근-제일많이 사용),
- public 클래스안에서 멤버변수는 private을 제일많이 사용.(private보안성갖춤)
- public 클래스안에서 멤버메서드는 public을 많이 사용.(외부 다른 클래스의 메서드를실행가능) 대신, 변수가 private이기 때문에, 직접 수정않됨, 실행만 됩니다.
- 인스턴스(클라우드주로사용)=오브젝트(자바)=객체=실행중인클래스
- 클래스 자료형(int, long, String처럼)는 멤버변수, 멤버메서드, 서브클래스 등등 포함할 수 있습니다.=C언어 구조체 자료형
- 이클립스 커밋, 푸시가 않된때 커밋 팝업창 하단에 Force 항목을 체크하시고, 진행하면 됨.

#### 202010526(수)
- 붕어빵: 붕어빵틀(클래스) -> 붕어빵이 구어져서 나오면 오브젝트(객체)
- OOP: 자바를 객체지향(클래스를 실행가능하게 하는) 프로그래밍
- 객체 = 오브젝트 = 인스턴스 = 실행가능한 클래스 
- 객체(Object) 와 클래스? 클래스형 자료를 실행 가능하게 만든 것을 오브젝트(객체)라고함.
- 추상화(Abstract): 오프라인 업무 -> 대표 업무만 뽑아낸 클래스 = 추상클래스
- 클래스는 멤버변수 + 멤버메서드(실행) + 서브클래스
- 변하지 않는 변수=상수=변수명을 대문자(원주율)PI=3.141569...
- 보통 상수변수는 클래스의 제일 상단 위치합니다.
- 기본형(정수자료형-소문자시작): byte<short<int<long, 10L(롱타입변수)
- 기본형(실수자료형-소수점,소문자시작): float<double , 12.34f(실수형숫자)
- 기본형(문자형-'a'단따옴표 값을 입력해야 에러가 나지 않음): char, 1개 문자만 입력.
- 문자형에서 유니코드 \u숫자 입니다.
- 기본형(불린형-참,거짓): boolean, (0|1)
- 참조형(대문자로 시작): 참조형 변수의 대표적인 변수 클래스 입니다.
- 클래스 변수(저장된상태) -> 실행가능하게 되었을때, 인스턴스 변수(메모리로드된상태)
- 인스턴스라는 말보다는 오브젝트라는 말을 더 많이 사용합니다.
- String(문자열 클래스변수): 대문자로 시작.
- 상수변수를 명시적 만들때: final int MAX = 100;
- for-each 반복문전까지 실습

#### 202010525(화)
- 스프링MVC프로젝트: ModelViewController? 약자 MVC구조(웹프로그램구조)
- src/test/java폴더 만들었습니다.: 테스트작업은 이 폴더에서 하라는 약속.
- src/main/java폴더가 진짜 프로그램작업을 하는 폴더.
- javac HelloWorld.java -encoding UTF-8 (한글 내용도 컴파일됨)
- 위 java컴파일러로 실행한 결과 -> HelloWorld.class 실행파일이 생성됨.
- 주), 클래스파일은 실행 패키지의 루트(최상위)에서 실행해야 함.
- kr.or.test패키지 root폴더 src/test/java폴더에 실행을 해야함.
- java kr.or.test.HelloWorld 클래스를 실행하게 됨
- 이클립스 나오기 전, 25년전 javac 컴파일에서 class프로그램을 만들었습니다.
- 지금은 터미널에서 javac 사용하지 않고, 이클립스에서 바로 실행합니다.
- javac? 자바앱 컴파일러 -> 클래스 실행파일을 만듬.class(바이트코드) (자바환경JVM실행)
- 메이븐?Maven : 웹프로그램 컴파일러 -> 웹프로그램(앱) 실행파일을 만듬.war(톰캣에서 실행)
- 메이븐이 컴파일할때, 자바소스만 컴파일하는 것이 아니고, 외부 라이브러리도 가져와서 바인딩(묶어줌)하게 됨 = 패키징 이라고 합니다. = .war(와르)파일로 패키징됨.
- 메이븐이 관리하는 외부 라이브러리파일(lib) 목록을 저장하는 파일 pom.xml 입니다.
- pom.xml에서 자바버전을 1.6 -> 1.8 변경 후 메이븐을 업데이트 합니다.
- 외부 라이브러리 파일을 참조하는 방식을 영어로 = dependency디펜던시
- jar파일? JavaARchive = jar 자바클래스를 패키징한 파일입니다.

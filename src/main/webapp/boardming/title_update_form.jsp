<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="image/favicon.ico" type="image/x-icon">
<title>우리들의 보드게임 세상 보드밍</title>
  <link rel="stylesheet" href="../css/title_update_form.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- slick  -->
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script type="text/javascript">  
$(document).ready(function() {
    // quickmenu의 이미지의 top 위치가 얼마인지 담기
    var top = parseInt($("#quickmenu img").css("top"));
    console.log(top);
    
    // 상단 메인 메뉴 관리
    $("li.mainmenu ul").hide(); // 하위메뉴 숨기기
    $("li.mainmenu").hover(function(){
        $("ul",this).slideDown(300);
    }, function(){
        $("ul",this).slideUp(300);
    });
    
	// 카테고리 박스 함수
    $("li#header-category ul").hide(); // 하위메뉴 숨기기
   
   $("li#header-category").hover(function(){
       $("ul",this).show(0);
   }, function(){
       $("ul",this).hide(0);
   }); 
});

</script>

<script type="text/javascript">
function imgChange(img) {
    document.getElementById('a1').src = img.src;
}

</script>

<script type="text/javascript">
//게시글 삭제
	function del(){
	
	if (confirm("삭제 하시겠습니까") == false) return;
				
		location.href = "delete.do?c_idx=${vo.c_idx}&c_no=${ vo.c_no }";
				
	}

</script>

<script type="text/javascript">
//게시글 수정
	function send(f){
	
	let c_title = f.c_title.value.trim();
	let c_content = f.c_content.value.trim();
	let c_category = f.c_category.value;
	
	if (c_title == "") {
		alert("제목을 입력하세요");
		f.c_title.value="";
		f.c_title.focus();
		return;
	}
	
	if (c_content == "") {
		alert("내용을 입력하세요");
		f.c_content.value="";
		f.c_content.focus();
		return;
	}
	
	if (c_category == "카테고리"){
		alert("카테고리를 선택해 주세요");
		return;
	}
	
	f.action = "update.do";
	f.method = "POST";
	f.submit();
	
	}

</script>

</head>
<body>
	
	<!-- Content 부분 (상세, 서브 페이지 내용 넣기) -->
	
	<div class="img-box">
		<img class="commu-img" src="../boardming/image/ming1.png">
	</div>
	
	<div class="c-btn">
		<input type="button" class="btn btn-del" value="삭제" onclick="del();">
		<input type="button" class="btn" value="목록으로 이동" onclick="location.href='sublist.do'">
	</div>
	

    <form class="article-form">
    <input type="hidden" name="c_no" value="${ vo.c_no }">
    <input type="hidden" name="c_idx" value="${ vo.c_idx }">
	<input type="hidden" name="mem_idx" value="${ user.mem_idx }">
	<input type="hidden" name="c_inCount" value="${ vo.c_inCount }">
	
	
        <div class="form-group">
        	<h5 class="c-name">작성자</h5>
            <input type="text" class="com-name" name="mem_nickname" 
             value="${ user.mem_nickname }" readonly="readonly">
            
        	<h5 class="c-regdate">작성날짜</h5>
            <input type="text" class="com-regdate" name="c_regdate" 
             value="${ vo.c_regdate }" readonly="readonly">
            
        	<h5 class="c-category">카테고리</h5>
      		<div class="select-category">
      		<select name="c_category">
      			<option value="${ vo.c_category }">카테고리</option>
      			<option value="가족게임">가족게임</option>
      			<option value="어린이게임">어린이게임</option>
      			<option value="워게임">워게임</option>
      			<option value="전략게임">전략게임</option>
      			<option value="추상게임">추상게임</option>
      			<option value="컬렉터블게임">컬렉터블게임</option>
      			<option value="테마게임">테마게임</option>
      			<option value="파티게임">파티게임</option>
      		</select>
      		</div>
      		
        	<h5 class="c-title">제목</h5>
            <input type="text" class="com-title" name="c_title" 
             placeholder="제목을 입력해 주세요" value="${ vo.c_title }">
        </div>
        
        <div class="form-group">
            <h6>내용</h6>
            <textarea class="content" name="c_content" placeholder="내용을 입력해 주세요">${ vo.c_content }</textarea>
        </div>
        <div class="send-btn">
        <input type="button" class="btn" value="게시글 저장" onclick="send(this.form)">
    	</div>
    </form>
	
	<!-- footer start -->
    <div id="footer">
    	<div class="footer1">
	        <span><br>&nbsp;&nbsp;&emsp;&emsp;<a href="header2.html">
	                <img id="footerlogo" src="image/logo.png">
	            </a><br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;<a href="#">커뮤니티 규칙</a>&emsp; | &emsp;
	        							  <a href="#">서비스 약관/정책</a>&emsp;  |&emsp;
	        							  <a href="#">개인정보취급방침</a>&emsp;  |&emsp; 
	        							  <a href="#">청소년보호정책</a>&emsp;  |&emsp;
	        							  <a href="#">공지사항</a>&emsp;  |  &emsp;
	        							  <a href="#">광고센터</a><br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;회사명 : 보드밍&ensp; |&ensp;
	         서울특별시 관악구 남부순환로 1820, 에그옐로우 7층&ensp; | &ensp;
	         등록번호 : 123-45-67890&ensp; | &ensp;
	         대표자명 : 박정환&ensp; |&ensp;
	         고개지원 : klkcpc@globalit.com<br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;위 내용에 대한 저작권 및 법적 책임은 자료제공사 또는 글쓴이에 있으며 보드밍의 입장과 다를 수 있습니다.<br></span>
	        <span>&emsp;&emsp;&emsp;&nbsp;ⓒ BOARDMING. ALL RIGHTS RESERVED.</span>
        </div>
        <div class="footer2">
        	<span><br><br><br>TEL : 02-123-4567<br></span>
        	<span>AM 09:30 ~ PM 06:20<br></span>
        	<span>주말, 공휴일 휴무<br></span>
        </div>
    </div>
    <!-- footer end -->
</body>
</html>
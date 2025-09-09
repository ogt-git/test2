function check_validation_add_movie(){
	if(check_validation_movie_id() && check_validation_movie_title() && check_validation_movie_story() && check_validation_movie_releaseyear()&& check_validation_movie_poster())
		return true;
	else
		return false;
	
}

function check_validation_movie_id() {
	var movie_id = document.getElementById("movie_id");
	var msg = document.getElementById("id_msg");
	
	
	if (movie_id.value == 0) {
		/*alert("영화 식별 번호는 필수 작성 사항입니다.");*/
		msg.textContent = "영화 식별 코드는 필수 작성 사항입니다.";
	
		return false;
	}
	else if (isNaN(movie_id.value) || movie_id.value < 100) {
		/*	alert("영화 식별 코드는 3자 이상의 숫자로 입력해주세요.");*/
		msg.textContent = "영화 식별 코드는 3자 이상의 숫자로 입력해주세요.";
		return false;
	}
	else{
		msg.textContent ="";
		return true;	
	}
		
}

function check_validation_movie_title() {
	var movie_title = document.getElementById("movie_title");
	var msg = document.getElementById("title_msg");
	if (movie_title.value =="") {
			/*alert("영화 제목을 입력해주세요.");*/
			msg.textContent = "영화 제목을 입력해주세요.";
			movie_title.focus();
			return false;
	}
	else{
		msg.textContent ="";
		return true;	
	}
}
	
function check_validation_movie_story() {
	var movie_story = document.getElementById("movie_story");
	var msg = document.getElementById("story_msg");
	
	if (movie_story.value.trim() == "" || movie_story.value.length < 10) {
		/*alert("영화 줄거리를 10자 이상 입력해주세요.");*/
		msg.textContent ="영화 줄거리를 10자 이상 입력해주세요.";
		movie_story.focus();
		return false;
	}
	else{
		msg.textContent ="";
		return true;	
	}
}

	
function check_validation_movie_releaseyear() {
	var movie_releaseyear = document.getElementById("movie_releaseyear");
	var msg = document.getElementById("releaseyear_msg");

	if (movie_releaseyear.value.trim() == "") {
		/*alert("개봉연도를 입력해주세요.");*/
		msg.textContent = "개봉연도를 입력해주세요.";
		movie_releaseyear.focus();
		return false;
	}

	if (isNaN(movie_releaseyear.value)) {
		/*alert("정확한 개봉연도를 입력해주세요. (범위:1880년 ~ 2100년)");*/
		msg.textContent = "연도만 입력해주세요.";
		movie_releaseyear.focus();
		return false;
	}
	else if (movie_releaseyear.value < 1880 || movie_releaseyear.value > 2100) {
				/*alert("정확한 개봉연도를 입력해주세요. (범위:1880년 ~ 2100년)");*/
				msg.textContent ="정확한 개봉연도를 입력해주세요.";
				movie_releaseyear.focus();
				return false;
	}
	else {
		msg.textContent = "";
		return true;
	}
}

function check_validation_movie_poster() {
	var movie_poster = document.getElementById("movie_poster");
	var msg = document.getElementById("poster_msg");
	
	if (movie_poster.files.length == 0) {
		/*alert("영화 포스터를 올려주세요.");*/
		msg.textContent = "영화 포스터를 올려주세요.";	
		return false;
	}
	else {
		msg.textContent = "";
		return true;	
	}
}

/*function check_duplicate() {
	const title = document.getElementById("movie_title").value;
	
	fetch("check_dup.jsp?title=" + encodeURIComponent(title))
		.then(response => response.text())
		.then(data => {
				
			if (data.trim() === "ok") {
				document.getElementById("title_msg").innerText = "중복되지 않는 영화 제목입니다.";
				document.getElementById("title_check").value = "true";
			} else {
				document.getElementById("title_msg").innerText = "영화 제목이 중복됩니다. 영화가 이미 존재하는지 확인해보세요!!";
				document.getElementById("title_check").value = "false";
			}
		});
}*/

function check_validation_rating_star() {
	var rating = document.getElementsByName("rating");
	var flag=false;
	
	for(let i =0;i<rating.length;i++){
		if(rating[i].checked)
			flag =true;
	}
	
	if(!flag){
		alert("영화 평점은 필수사항입니다. 평점을 매겨주세요!!");
		return false;
	}
	
	return check_validation_review();
	
}
	
function check_validation_review() {
	var rating_review = document.getElementById("rating_review");
	var msg = document.getElementById("review_msg");
		
	if (rating_review.value.trim() == "" || rating_review.value.length < 1) {
		msg.textContent = "리뷰를 제대로 남기지 않으셨군요! (한 글자 이상 작성 해주세요.)";
		rating_review.focus();
		return false;
	}
	else {
		msg.textContent = "";
		return true;
	}
}

 	
 
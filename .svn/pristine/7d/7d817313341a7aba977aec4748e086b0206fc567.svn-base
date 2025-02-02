<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    var username; // 전역 변수로 사용자 이름 설정

    // 서버로부터 사용자 정보를 가져오는 함수
    function getUserInfo() {
        $.ajax({
            url: '/cbs/cstbrkr/getUserInfo',  
            method: 'GET',
            dataType: 'json',  
            success: function(response) {
                username = response.username; // 사용자 이름 설정
                $('#userInfo').text('로그인된 사용자 아이디: ' + username);
                console.log("사용자 정보 가져옴: " + username);
            },
            error: function(xhr, status, error) {
                console.error('서버에서 사용자 정보를 가져오는 데 실패했습니다.');
            }
        });
    }

    // 페이지 로드 시 사용자 정보 가져오기
    $(document).ready(function() {
        getUserInfo();
    });
 
    $(document).on('click', '#check', function() {
        checkPassword();
    });

    // 비밀번호 확인 함수
    function checkPassword() {
        var checkPwd = $('#pwd').val();
        console.log("checkPwd:", checkPwd);

        if (!checkPwd || checkPwd.trim() === "") {
            swal("실패", "비밀번호가 입력되지 않았습니다.", "error");
        } else {
            $.ajax({
                type: 'POST', // POST 방식으로 변경
                url: '/cbs/cstbrkr/checkPwd',
                data: JSON.stringify({ checkPwd: checkPwd }), // 데이터를 JSON 형식으로 전송
                contentType: "application/json", // 컨텐츠 타입을 JSON으로 설정
                beforeSend: function(xhr) { // HTTPS 사용
                    xhr.setRequestHeader("X-Atmosphere-Transport", "long-polling");
                }
            }).done(function(result) {
                if (result) {
                    console.log("비밀번호 일치");
                    swal({
	                    title: "비밀번호가 일치합니다.",
	                    icon: "success"
	                }).then(function() {
	                	isPasswordChecked = true;
	                    location.href = "/cbs/cstbrkr/detailsForm";
	                });
                    
                } else {
                    console.log("비밀번호 불일치");
                    swal("실패", "비밀번호가 일치하지 않습니다.", "error");
                }
            }).fail(function(error) {
                alert("비밀번호 확인 중 오류가 발생했습니다.");
            });
        }
    }

    
    
    
    // 비밀번호 입력 필드에서 Enter 키 누를 때 확인 버튼 클릭
    $('#pwd').keypress(function(event) {
        if (event.which === 13) { // Enter 키
            event.preventDefault(); // 기본 동작 방지
            checkPassword(); // 비밀번호 확인 함수 호출
        }
    });
</script>

<div class="row flex-center min-vh-50 py-5">
    <div class="col-sm-10 col-md-8 col-lg-5 col-xl-5 col-xxl-3">
        <div class="text-center mb-5">
            <h2 class="text-body-highlight">
                <span class="fw-normal"></span>회원정보 확인
            </h2>
            <p class="text-body-tertiary">본인 확인을 위해 비밀번호를 입력해주세요.</p>
        </div>
        <form onsubmit="return false;">
            <input class="form-control mb-3" id="pwd" type="password" placeholder="비밀번호 입력"> 
            <input class="btn btn-primary w-100" type="submit" value="확인" id="check">
        </form>
    </div>
</div>
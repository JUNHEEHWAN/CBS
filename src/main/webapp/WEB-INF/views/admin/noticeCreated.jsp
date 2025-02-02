<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	
<head>	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/41.2.1/classic/ckeditor.js"></script>
</head>
<script type="text/javascript">
// 전역변수
let editor,shTxt,titl,rgsde;


$(function(){
	shTxt = document.querySelector("[name=shTxt]");
	titl =  document.querySelector("[name=titl]");
})

function fsohee(){
	event.preventDefault();
    if(!shTxt){
        alert("내용을 작성해주세요.");
        return false;  // 전송 안하깅
    }
    /* shTxt.value  = editor.getData();
    return true; */

    let inputImgs = $("#file");//파일객체
	//이미지 파일들을 꺼내오자
	let files = inputImgs[0].files;
    
    
	shTxt.value  = editor.getData();
	let noticeVO ={
		titl:titl.value,
		cn:shTxt.value
	}
	
	
	let formData = new FormData();
	formData.append("noticeVO", new Blob([JSON.stringify(noticeVO)], {type: "application/json"}));
	for(let i=0; i<files.length; i++){
			formData.append("uploadFile",files[i])
		}
	
	
	
	/* const shTxt = document.querySelector("#shTxt"); */
	console.log("값을 확인 먼저:",noticeVO);
	$.ajax({
		type : "post",
		url : "/cbs/admin/noticeCreated",
		processData:false,
    	contentType:false,
		data: formData,
		dataType : "text",             // json이라 쓰면 JSON.parse(결과)
		success : function(result) {
			console.log("결과",result);
			if(result == "OK"){
				swal({
				title: "등록이 완료되었습니다.",
				icon: "success"
				}).then(function() {
				location.href = "/cbs/admin/notice";
				});
				

			}
		},
		error: function (xhr, status, error) {
			console.log("code: " + xhr.status)
			console.log("message: " + xhr.responseText)
			console.log("error: " + error);
		}                
	});
}
/* const fget = function(){
    shTxt.value  = editor.getData();
}

const fput = function(){
    editor.setData(shTxt.value);
} */

</script>


<body>
<div class="card h-50" >
		<div class="card-body" style="padding: 70px;">
	<div class="row">
		<div class="col-xl-15">
			<form class="row g-3 mb-6" enctype="multipart/form-data" >
				<div class="col-sm-6 col-md-12">
					<div class="form-floating" style="width:800px;">
						<input class="form-control" id="titl" name="titl" type="text"
							placeholder="제목"><label for="titl"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">제목</font></font></label><br>
					</div>
						<textarea name="shTxt" style="display: none;" id="shTxt" cols="30" rows="10"></textarea>
						<div id="editor">
           					 </div><br>
           			<div style="width:300px;">
						<input class="form-control" id="file" name="file" type="file" 
							><br>
					</div>		 
					
				</div>
				
				<div class="col-12 gy-6">
					<div class="row g-3 justify-content-end" >
						<div class="col-auto">
							<a href="javascript:history.back()" class="btn btn-phoenix-primary px-5">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">취소</font></font>
							</a>
						</div>
						<div class="col-auto">
							<button onclick="fsohee()" class="btn btn-primary px-5 px-sm-10">
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">등록하기</font></font>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
		</div>
	</div>
<script type="text/javascript">


ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .then( function(nEditor){
        editor = nEditor;
    })
    .catch( error => {
        console.error( error );
    } );

</script>
</body>


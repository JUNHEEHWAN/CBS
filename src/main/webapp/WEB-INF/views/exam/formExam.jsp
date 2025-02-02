<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta charset="UTF-8">
<title>통관 신청</title>
</head>
<body>
	<div class="my-3"><h3>통관 신청</h3></div>
	
	<ul class="nav nav-underline fs-9" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a class="nav-link active" id="entry" data-bs-toggle="tab" href="#tab-entry" role="tab" aria-controls="tab-entry" aria-selected="true">통관</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link" id="entryThing" data-bs-toggle="tab" href="#tab-entryThing" role="tab" aria-controls="tab-entryThing" aria-selected="false" tabindex="-1">통관 물품</a></li>
	</ul>
	<div class="tab-content mt-3" id="myTabContent">
		<div class="tab-pane fade active show" id="tab-entry" role="tabpanel">
			<form class="row gy-2 gx-3 align-items-center">
			<label class="col-form-label">*의뢰인</label>
			<div class="col-auto">
				<div class="input-group">
					<div class="input-group-text">의뢰인 유형</div>
				</div>
			</div>
			<div class="col-auto">
				<input class="form-check-input" id="" type="radio">
				<label class="form-check-label" for="">개인</label>
			</div>
			<div class="col-auto">
				<input class="form-check-input" id="" type="radio">
				<label class="form-check-label" for="">법인</label>
			</div>
			<div class="col-auto">
				<div class="input-group">
					<div class="input-group-text">의뢰 유형</div>
				</div>
			</div>
			<div class="col-auto">
				<input class="form-check-input" id="" type="radio">
				<label class="form-check-label" for="">수출</label>
			</div>
			<div class="col-auto">
				<input class="form-check-input" id="" type="radio">
				<label class="form-check-label" for="">수입</label>
			</div>
			<div class="col-md-6"></div>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">상호(기업명)</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<label class="col-form-label">*수출입 대행자</label>
			<div>
				<div class="col-md-6">
					<div class="input-group">
						<div class="input-group-text">상호</div>
						<input class="form-control" id="" type="text">
					</div>
				</div>
			</div>
			<div>
				<div class="col-md-6">
					<div class="input-group">
						<div class="input-group-text">대행자 구분</div>
						<input class="form-control" id="" type="text">
					</div>
				</div>
			</div>
			<div>
				<div class="col-md-6">
					<div class="input-group">
						<div class="input-group-text">대행자 이름</div>
						<input class="form-control" id="" type="text">
					</div>
				</div>
			</div>
			<label class="col-form-label">*수출자</label>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">상호</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div></div>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">주소</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div></div>
			<div class="col-md-2">
				<div class="input-group">
					<div class="input-group-text">전화번호</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div class="col-md-2">
				<div class="input-group">
					<div class="input-group-text">담당자</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<label class="col-form-label">*수입자</label>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">상호</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div></div>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">주소</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div></div>
			<div class="col-md-2">
				<div class="input-group">
					<div class="input-group-text">전화번호</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div class="col-md-2">
				<div class="input-group">
					<div class="input-group-text">담당자</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<label class="col-form-label">*관할세관 정보</label>
			<div class="col-auto">
				<div class="input-group">
					<div class="input-group-text">관할세관</div>
				</div>
			</div>
			<div class="col-auto">
				<select class="form-select" id="inputState">
                	<option selected="selected">선택</option>
                    <option>부산</option>
                    <option>울산</option>
                    <option>인천</option>
                    <option>대전</option>
                </select>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-phoenix-primary px-5 me-2">자동완성</button>
				<button class="btn btn-primary px-5 me-2">임시저장</button>
			</div>
			<div class="my-3"></div>
		</form>
		</div>
		<div class="tab-pane fade" id="tab-entryThing" role="tabpanel">
			<form class="row gy-2 gx-3 align-items-center">
			<label class="col-form-label">*통관 정보</label>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">통관 관리 번호</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div class="col-md-4">
				<div class="input-group">
					<div class="input-group-text">고객 코드</div>
					<input class="form-control" id="" type="text">
				</div>
			</div>
			<div class="my-3"></div>
			<label class="col-form-label">*물품 등록</label>
			<div style="border: 1px solid #ccc; padding: 10px;" id="thingDiv">
				<div class="row">
					<div class="col-md-2">
						<button type="button" class="btn btn-phoenix-primary px-5 me-2" style="margin: auto 0;">물품 검색</button>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">물품번호</div>
							<input class="form-control" id="" type="text" readonly>
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">물품명</div>
							<input class="form-control" id="" type="text" readonly>
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">HS 코드</div>
							<input class="form-control" id="" type="text" readonly>
						</div>
					</div>
				</div>
				<div class="my-3"></div>
				<div class="row">
					<div class="col-auto">
						<div class="input-group">
							<div class="input-group-text">물품 유형</div>
						</div>
					</div>
					<div class="col-auto">
						<input class="form-check-input" id="" type="radio">
						<label class="form-check-label" for="">동/식물</label>
					</div>
					<div class="col-auto">
						<input class="form-check-input" id="" type="radio">
						<label class="form-check-label" for="">일반</label>
					</div>
				</div>
				<div class="my-3"></div>
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-text">물품명</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-text">거래품명</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
				</div>
				<div class="my-3"></div>
				<div class="row">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-text">수하물 총 포장개수</div>
							<input class="col-md-4 form-control" id="" type="text">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">수량</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
				</div>
				<div class="my-3"></div>
				<div class="row">
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">금액</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">총 금액</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
				</div>
				<div class="my-3"></div>
				<div class="row">
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">순중량</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">총 중량</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
					<div class="col-md-2">
						<div class="input-group">
							<div class="input-group-text">단가</div>
							<input class="form-control" id="" type="text">
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-end">
					<button class="btn btn-outline-danger me-1 mb-1" type="button">삭제</button>
					<button class="btn btn-outline-primary me-1 mb-1" type="button">추가</button>
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-primary px-5 me-2">통관 접수</button>
			</div>
		</form>
		</div>
	</div>

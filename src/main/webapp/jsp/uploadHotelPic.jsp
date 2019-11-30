<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Upload Picture</title>

</head>
<body>
<jsp:include page="header.jsp" />
	
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result).width(350)

				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		$('#inputGroupFile01').on('change', function() {

			var fileName = $(this).val();

			$(this).next('.custom-file-label').html(fileName);
		})
	</script>
	<div class="jumbotron">
		<div class="container text-center">
		<p>Please upload only .png file</p>
			<div style="overflow: auto">
				<div style="float: right; width: 40%">
					<div class="container text-center" >
						<form action="/hotel/uploads" method="post" enctype="multipart/form-data" id="form-id">
							<div class="container text-center">
								<input type="hidden" name="hotelName" value="${hotelName}">
								<input type="file" name="file" multiple>
								<input type="submit" value="Upload File"></input>
							</div>
						</form>
						<img class="mr-3 mb-3 rounded"
								src="/img/${id.hotelId}.png" id="blah"
								style="max-width: 350px; min-width: 350px"> <img id="blah"
								src="#" alt="">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlanitShare</title>
<tiles:insertAttribute name="asset"></tiles:insertAttribute>
<link rel="stylesheet" href="/planitshare/resources/css/main.css" />
</head>
<body>

	<tiles:insertAttribute name="mainheader"></tiles:insertAttribute>
	<main>
		<section>
			<div id="side">
				<div>
					plan it <br>share
				</div>
				<input type="button" class="searchbtn" value="SEARCH"data-item="#gosearch">
			</div>
			<div id="mainimg">
				<img src="/planitshare/resources/image/main.jpg">
			</div>

		</section>
	</main>



	<script>
	</script>

</body>
</html>
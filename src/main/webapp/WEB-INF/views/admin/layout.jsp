<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlanitShare</title>
<tiles:insertAttribute name="asset"></tiles:insertAttribute>
<link rel="stylesheet" href="/planitshare/resources/css/admin.css" />
</head>
<body>
	<main>
		<tiles:insertAttribute name="mainheader"></tiles:insertAttribute>
		<section>
		<tiles:insertAttribute name="submenu"></tiles:insertAttribute>
		<div>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</div>
		</section>
	</main>
	
	<script>

	</script>

</body>
</html>
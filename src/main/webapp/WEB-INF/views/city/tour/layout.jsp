<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlanitShare</title>
<link rel="stylesheet" href="/planitshare/resources/css/tour.css" />
<link rel="stylesheet" href="/planitshare/asset/css/rateit.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45bff8e1f05130c0cfcaa2b32275bf5e"></script>
<tiles:insertAttribute name="asset"></tiles:insertAttribute>
</head>
<body>
	<main>
		<tiles:insertAttribute name="mainheader"></tiles:insertAttribute>
		<section>
		<tiles:insertAttribute name="submenu"></tiles:insertAttribute>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
		</section>
	</main>
	
</body>
</html>
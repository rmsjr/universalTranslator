<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<jsp:text><![CDATA[<!--[if lte IE 7]>]]></jsp:text><html class="no-js lt-ie9 lt-ie8 lt-ie7"><jsp:text><![CDATA[<![endif]-->]]></jsp:text>
<jsp:text><![CDATA[<!--[if IE 7]>]]></jsp:text><html class="no-js lt-ie9 lt-ie8"><jsp:text><![CDATA[<![endif]-->]]></jsp:text>
<jsp:text><![CDATA[<!--[if IE 8]>]]></jsp:text><html class="no-js lt-ie9"><jsp:text><![CDATA[<![endif]-->]]></jsp:text>
<jsp:text><![CDATA[<!--[if gt IE 8]>]]></jsp:text><html class="no-js"><jsp:text><![CDATA[<![endif]-->]]></jsp:text>
<head>
<meta charset="utf-8">	
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><tiles:insertAttribute name="title" /></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- main css compiled from main.less -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dspResources/css/main.css?v=2">


<!-- Health-e-link theme -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/dspResources/css/themes/theme-health-e-link.css">


<jsp:text><![CDATA[<!--[if lte IE 9]>]]></jsp:text>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/dspResources/css/ie.css">
<jsp:text><![CDATA[<![endif]-->]]></jsp:text>

<script src="<%=request.getContextPath()%>/dspResources/js/vendor/jquery-1.10.1.min.js"></script>

<!-- moderizer: for ie8 compatibility -->
<script type="text/javascript" src="<%=request.getContextPath()%>/dspResources/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script data-main="<%=request.getContextPath()%>/dspResources/js/main" src="<%=request.getContextPath()%>/dspResources/js/vendor/require.js"></script>
</head>
<body>
<jsp:text><![CDATA[<!--[if lte IE 8]>]]></jsp:text>
 	<p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<jsp:text><![CDATA[<![endif]-->]]></jsp:text>
<div class="wrap">
	<tiles:insertAttribute name="header" />
	<div>
		<tiles:insertAttribute name="actions" />
		<div class="container-fluid">
			<div class="row-fluid contain">
				<tiles:insertAttribute name="menu" />
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
</div>

</body>
</html>
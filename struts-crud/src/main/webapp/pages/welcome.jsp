<%@page pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	function logon() {
		$("form").submit();
	}
</script>
</head>
<body>
	<html:errors />
	<!-- 标准样式	<form action="/struts-crud/logon.do"> -->
	<html:form action="logon">
		<p>
			username:<input type="text" name="username" />
		</p>
		<p>
			password:<input type="password" name="password" />
		</p>
		<input type="button" value='<bean:message key="button.logon"/>'
			onclick="logon()" />
	</html:form>
</body>
</html>

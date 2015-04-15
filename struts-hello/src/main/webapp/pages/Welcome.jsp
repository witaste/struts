<%@page pageEncoding="utf-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
<body bgcolor="white">
<!-- 判断name指定的默认key是否存在，范围application -->
<logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
  <font color="red">
    ERROR:  Application resources not loaded -- check servlet container
    logs for error messages.
  </font>
</logic:notPresent>
<!-- 不指定bundle时，使用默认key的资源文件 -->
<bean:message key="hello" arg0="李丽"/><br>
<bean:message bundle="en" key="hello" arg0="Lily"/>
</body>
</html>

结构

@src      @main @resources @MessageResources_en_US.properties
@src      @main @resources @MessageResources_zh_CN.properties
@src      @main @resources @struts-config.xml
@src      @main @resources @validation.xml
@src      @main @webapp    @pages			       @Welcome.jsp
@src      @main @webapp    @WEB-INFO                           @web.xml
@src      @main @webapp    @index.jsp
@pom.xml


入口 web.xml
配置 servlet
JSP页面中文显示？


Element : message-resources
The "message-resources" element describes a MessageResources object with message templates for this module. 

The following attributes are defined:

className 
----------
The configuration bean for this message resources object. 
If specified, the object must be a subclass of the default configuration bean. ["org.apache.struts.config.MessageResourcesConfig"] 


factory 
----------
Fully qualified Java class name of the MessageResourcesFactory subclass to use for this message resources object. 
["org.apache.struts.util.PropertyMessageResourcesFactory"] 


key 
----------
Servlet context attribute under which this message resources bundle will be stored. 
The default attribute is the value specified by the string constant at [Globals.MESSAGES_KEY].
The module prefix (if any) is appended to the key (${key}${prefix}). 

[org.apache.struts.Globals.MESSAGES_KEY] 
NOTE: The module prefix includes the leading slash, so the default message resource bundle for a module named "foo" is stored under "org.apache.struts.action.MESSAGE/foo". 


null 
----------
Set to "true" if you want our message resources to return a null string for unknown message keys, or "false" to return a message with the bad key value.


parameter 
----------
Configuration parameter to be passed to the createResources method of our factory object.

Content Model : (set-property*)
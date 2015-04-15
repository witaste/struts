package cn.zxg.crud.logon;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class UserForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8504191316341858145L;

	private String username;
	private String password;

	public void reset(ActionMapping mapping, ServletRequest request) {
		this.username = null;
		this.password = null;
	}

	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {

		ActionErrors errors = new ActionErrors();

		if ((username == null) || (username.length() < 1)) {
			errors.add("username", new ActionMessage("errors.required","username"));
		}

		if ((password == null) || (password.length() < 1)) {
			errors.add("password", new ActionMessage("errors.required","password"));
		}

		return (errors);

	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}

package cn.zxg.crud.user;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.http.entity.ContentType;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserRetriveAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType(ContentType.APPLICATION_JSON.toString());
		response.setCharacterEncoding("utf-8");
		try{
			Connection conn = DriverManager.getConnection("proxool.test-pool");
			Statement stateMent = conn.createStatement();
			ResultSet rs = stateMent.executeQuery("select * from zxg order by id");
			PrintWriter out = response.getWriter();
			List<Map<String,String>> list = new ArrayList<Map<String,String>>();
			while(rs.next()){
				Map<String,String> user = new HashMap<String,String>();
				user.put("id", rs.getString("id"));
				user.put("username", rs.getString("name"));
				user.put("password", rs.getString("password"));
				list.add(user);
			}
//			Map<String,Object> map = new HashMap<String,Object>();
//			map.put("total", list.size());
//			map.put("rows", JSONArray.fromObject(list));
//			out.print(JSONObject.fromObject(map));
			out.print(JSONArray.fromObject(list));
			
			
			out.flush();
			out.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}

}

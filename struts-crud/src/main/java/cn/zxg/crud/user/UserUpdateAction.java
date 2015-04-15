package cn.zxg.crud.user;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.entity.ContentType;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UserUpdateAction extends Action {
	
	@SuppressWarnings("unchecked")
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType(ContentType.APPLICATION_JSON.toString());
		response.setCharacterEncoding("utf-8");
		try{
			Connection conn = DriverManager.getConnection("proxool.test-pool");
			Statement stateMent = conn.createStatement();
			
//			接收页面数据 
			JSONArray data = JSONArray.fromObject(request.getParameter("data"));
			Iterator<JSONObject> it = data.iterator();
			while(it.hasNext()){
				JSONObject ob = it.next();
				String id = ob.getString("id");
				String username = ob.getString("username");
				String password = ob.getString("password");
				if(id.equals("INSERT")){
					String sqlInsert = "insert into zxg(id,name,password) values ((select max(id)+1 from zxg),'"+username+"','"+password+"')";
					stateMent.execute(sqlInsert);
				}else{
					String sqlUpdate = "update zxg set name='"+username+"',password='"+password+"' where id='"+id+"'";
					stateMent.executeUpdate(sqlUpdate);
				}
			}
			stateMent.close();
			conn.close();
			PrintWriter out = response.getWriter();
			Map<String,String> map = new HashMap<String,String>();
			map.put("result", "ok");
			out.print(JSONObject.fromObject(map));
			out.flush();
			out.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}

}

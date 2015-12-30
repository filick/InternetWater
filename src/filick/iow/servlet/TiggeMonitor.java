package filick.iow.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;

/**
 * Created by filick on 2015/12/30.
 */
@WebServlet(name = "TiggeMonitor")
public class TiggeMonitor extends HttpServlet {
    private String database = "jdbc:oracle:thin:@101.6.54.28:1521:orcl";
    private String table = "GLOBALTIGGERECORD";
    private String user = "download";
    private String password = "download";
    //private String[] header = new String[]{"任务标识", "下载完成时间", "数据发布时间", "发布机构", "数据解析状态", "原数据大小"};
    private String headerStr = "[\"任务标识\", \"下载完成时间\", \"数据发布时间\", \"发布机构\", \"数据解析状态\", \"原数据大小\"]";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("content-type", "text/plain;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        if (action.equals("info")) {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection(database, user, password);
                String sql = "select count(*) from " + table;
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                String size = count * 120 / 1024 + " Gb";
                response.setStatus(200);
                out.print("{count: " + count + ", totalsize: '" + size + "', header:" + headerStr + " }");
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(500);
            }
        } else if (action.equals("list")) {
            try {
                int begin = Integer.parseInt(request.getParameter("begin"));
                int num = Integer.parseInt(request.getParameter("num"));
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection(database, user, password);
                String sql = "(select * from " + table + " where rownum < " + (begin + num) + ") minus (select * from " + table + " where rownum < " + begin + ")";
                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();
                out.print("[");
                while(rs.next()){
                    out.print("[");
                    String id = rs.getString(1);
                    out.print("'" + id + "',");
                    Time dowloadtime = rs.getTime(2);
                    out.print("'" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(dowloadtime) + "',");
                    Time publishdate = rs.getTime(3);
                    out.print("'" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(publishdate) + "',");
                    String source = rs.getString(4).replace(" ", "");
                    out.print("'" + source + "',");
                    int state = Integer.parseInt(rs.getString(6));
                    out.print("'" + (state == 0 ? "未解析":"已解析") + "',");
                    String size = "120Mb";
                    out.print("'" + size + "'],");
                }
                out.print("]");
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(500);
            }
        } else {
            response.setStatus(500);
        }
    }
}

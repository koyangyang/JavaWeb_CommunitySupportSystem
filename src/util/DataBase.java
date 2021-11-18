package util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
//工具类
public class DataBase {
    Connection conn=null;
    Statement sm=null;
    ResultSet rs=null;
    PreparedStatement ps=null;
    public DataBase()
    {
        try {

            //2.建立连接
            conn=this.getConnection();
            //3.执行sql语句
            sm=conn.createStatement();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public Connection getConnection() {
        try {
            //初始化上下文
            Context cxt=new InitialContext();
            //获取与逻辑名相关联的数据源对象
            DataSource ds=(DataSource)cxt.lookup("java:comp/env/jdbc/bs");
            conn=ds.getConnection();
        } catch (NamingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }
    public Connection getConn() {
        return conn;
    }
    public void setConn(Connection conn) {
        this.conn = conn;
    }
    //查询数据库，获取结果集
    public ResultSet getResult(String sql)
    {
        try {
            rs=sm.executeQuery(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }
    //优化查询1--通用
    public ResultSet getResult(String sql,Object[] param)
    {
        try {
            ps=conn.prepareStatement(sql);//预加载方式
            if(param!=null)
            {
                for(int i=0;i<param.length;i++)
                {
                    ps.setObject(i+1, param[i]);
                }
            }
            rs=ps.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;
    }
    //优化查询2--通用
    public ResultSet getResult(String sql,ArrayList param)
    {
        try {
            ps=conn.prepareStatement(sql);//预加载方式
            if(param!=null)
            {
                for(int i=0;i<param.size();i++)
                {
                    ps.setObject(i+1, param.get(i));
                }
            }
            rs=ps.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return rs;

    }
    //增删改 DML
    public void executeDML(String sql) throws SQLException
    {
        sm.executeUpdate(sql);

    }
    //关闭资源
    public void close()
    {
        try {
            if (rs != null)
                rs.close();
            if (sm != null)
                sm.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}

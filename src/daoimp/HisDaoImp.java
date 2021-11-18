package daoimp;

import dao.HisDao;
import entity.his;
import util.DataBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class HisDaoImp extends DataBase implements HisDao {

    @Override
    public ArrayList<his> getAllhis() {
        ArrayList<his> hlist=new ArrayList<his>();
        String sql="select * from his";
        ResultSet rs=this.getResult(sql);
        try {
            while(rs.next())
            {
                his his=new his();
                his.setId(rs.getInt("id"));
                his.setContent(rs.getString("content"));
                his.setDate(rs.getString("date"));
                his.setUser(rs.getString("user"));
                hlist.add(his);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.close();
        return hlist;
    }

    @Override
    public void inserthis(String  user,String content) {
        String sql="insert his (content,date,user) values('"+content+"',now(),'"+user+"');";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    @Override
    public void delhis(int id) {
        String sql="delete from his where id="+id+";";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    @Override
    public ArrayList<his> gethisbyuser(String user) {
        ArrayList<his> hlist=new ArrayList<his>();
        String sql="select * from his where user='"+user+"'";
        ResultSet rs=this.getResult(sql);
        try {
            while(rs.next())
            {
                his his=new his();
                his.setId(rs.getInt("id"));
                his.setContent(rs.getString("content"));
                his.setDate(rs.getString("date"));
                his.setUser(rs.getString("user"));
                hlist.add(his);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.close();
        return hlist;
    }
}

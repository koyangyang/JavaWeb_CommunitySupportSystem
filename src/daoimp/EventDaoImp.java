package daoimp;

import dao.EventDao;
import entity.event;
import util.DataBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EventDaoImp extends DataBase implements EventDao {
    @Override
    public ArrayList<event> getAllGoods() {
        ArrayList<event> ulist=new ArrayList<event>();
        String sql="select * from events";
        ResultSet rs=this.getResult(sql);
        try {
            while(rs.next())
            {
                event event =new event();
                event.setName(rs.getString("name"));
                event.setId(rs.getInt("id"));
                event.setContent(rs.getString("content"));
                event.setPrice(rs.getDouble("price"));
                event.setDate(rs.getString("date"));
                event.setUser(rs.getString("user"));
                ulist.add(event);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.close();
        return ulist;
    }
    public void updategoods(int id,String name,double price,String content,String  user){
        String sql="update events set name='"+name+"',price="+price+",content='"+content+"',date=now(),user='"+user+"' where id="+id+";";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    public void insertgood(String name, double price, String content, String  user){
        String sql="insert events(name, price, content, date, user) values('"+name+"',"+price+",'"+content+"',now(),'"+user+"');";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    public void delgood(int id){
        String sql="delete from events where id="+id+";";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    @Override
    public event geteventbyid(int id) {
        event ev=new event();
        String sql="select * from events where id="+id+";";
        ResultSet rs=this.getResult(sql);
        try {
            while(rs.next())
            {
                ev.setName(rs.getString("name"));
                ev.setId(rs.getInt("id"));
                ev.setContent(rs.getString("content"));
                ev.setPrice(rs.getDouble("price"));
                ev.setDate(rs.getString("date"));
                ev.setUser(rs.getString("user"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.close();
        return ev;
    }
}

package daoimp;

/**
 * @Classname UserDaoImp
 * @Description TODO
 * @Date 2021/6/3 13:58
 * @Created by codeyang
 * @Describ:
 */
import dao.UserDao;
import entity.user;
import util.DataBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDaoImp extends DataBase implements UserDao {
    @Override
    public user getAllUser(String name,String pwd) {
        user user=new user();
        String sql="select * from user where name='"+name+"' and pwd=MD5('"+pwd+"');";
        ResultSet rs=this.getResult(sql);
        try {
            while(rs.next())
            {
                user.setName(rs.getString("name"));
                user.setPwd(rs.getString("pwd"));
                user.setStatus(rs.getInt("status"));
                user.setPhone(rs.getString("phone"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.close();
        return user;
    }

    public void insertuser(String name,String pwd,String phone){
        String sql="insert user values('"+name+"',MD5('"+pwd+"'),0,'"+phone+"');";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    public user getUserbyName(String name) {
        user user=new user();
        String sql="select * from user where name='"+name+"'";
        ResultSet rs=this.getResult(sql);
        try {
            while(rs.next())
            {
                user.setName(rs.getString("name"));
                user.setPwd(rs.getString("pwd"));
                user.setStatus(rs.getInt("status"));
                user.setPhone(rs.getString("phone"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        this.close();
        return user;
    }

    public void updateinfo(String name,String pwd,String phone){
        String sql="update user set phone='"+phone+"' where name='"+name+"' and pwd=MD5('"+pwd+"');";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }

    public void updatepwd(String name,String npwd){
        String sql="update user set pwd=MD5('"+npwd+"') where name='"+name+"';";
        try {
            this.executeDML(sql);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        this.close();
    }
}


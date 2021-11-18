package dao;


import entity.user;


public interface UserDao {
    public user getAllUser(String name,String pwd);
    public void insertuser(String name,String pwd,String phone);
    public void updatepwd(String name,String npwd);
}

package dao;

import entity.event;

import java.util.ArrayList;

public interface EventDao {
    public ArrayList<event> getAllGoods();
    public void delgood(int id);
    public void insertgood(String name,double price,String content,String  user);
    public void updategoods(int id,String name,double price,String content,String  user);
    public event geteventbyid(int id);
}

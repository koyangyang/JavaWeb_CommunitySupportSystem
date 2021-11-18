package dao;


import entity.his;

import java.util.ArrayList;

public interface HisDao {
    public ArrayList<his> getAllhis();
    public void inserthis(String  user,String content);
    public  void delhis(int id);
    public ArrayList<his> gethisbyuser(String user);
}

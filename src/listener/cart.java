package listener;


import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class cart implements HttpSessionAttributeListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent) {
        String name=httpSessionBindingEvent.getName();
        if(name.equals("name")){
            System.out.println("用户已经登录！");
        }else {
            if (name.equals("status")){
                System.out.println("管理员访问后台管理界面！");
            }else {
                if (name.equals("elist")){
                    System.out.println("用户添加委托任务进待办！");
                }
            }
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
        String name=httpSessionBindingEvent.getName();
        if (name.equals("status")){
            System.out.println("管理员登出！");
        }else {
            if(name.equals("elist")){
                System.out.println("用户提交所有的待办委托任务！");
            }
        }

    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {
        String name=httpSessionBindingEvent.getName();
        if (name.equals("elist")){
            System.out.println("用户添加委托任务进待办！");
        }
    }
}

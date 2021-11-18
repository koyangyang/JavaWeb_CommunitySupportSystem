package util;
import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;

public class MD5 {
    public  String getmd5(String passWord) {

        StringBuilder sb = new StringBuilder();

//获取数据摘要器

        try {
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");

//将一个byte数组进行加密操作，返回的是一个加密的byte数组，二进制的哈西计算，md5加密的第一步

            byte[] digest = messageDigest.digest(passWord.getBytes());

            for (int i = 0; i < digest.length; i++) {
                int result = digest[i] & 0xff;

//将得到的int类型的值转化为16进制的值

                String hexString = Integer.toHexString(result);

                if (hexString.length()<2){//系统会自动把0省略，所以添加0

                    sb.append("0");

                }

                sb.append(hexString);

            }

            System.out.println(sb.toString());

        } catch (NoSuchAlgorithmException e) {//找不到加密方式异常

            e.printStackTrace();

        }
    return sb.toString();
    }

}

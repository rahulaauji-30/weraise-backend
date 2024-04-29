package security;
import java.security.*;
public class MD {
    public String MD5(String password) throws NoSuchAlgorithmException{
        MessageDigest md = MessageDigest.getInstance("md5");
        byte[] passwordByte = password.getBytes();
        byte[] hasshedPassword = md.digest(passwordByte);
        StringBuilder hexString = new StringBuilder();
        for (byte p:hasshedPassword){
            hexString.append(String.format("%02x",p));
        }
        return hexString.toString();
    }
}
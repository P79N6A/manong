import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AESTest {

    public static void main(String args[]) throws Exception{
        String content = "123456";
        String key = "sh huishu Jiulc!";
        String iv = "A-16-Byte-String";
        //加密
        byte[] encrypted = AES_CBC_Encrypt(content.getBytes(), key.getBytes(), iv.getBytes());
        //解密
        byte[] decrypted = AES_CBC_Decrypt(decryptBASE64("TKUtuZS5Tg5pdIRJld4JgA=="), key.getBytes(), iv.getBytes());

        System.out.println("加密后："+encryptBASE64(encrypted));
        System.out.println("解密后："+byteToString(decrypted));
    }

    public static String byteToString(byte[] byte1){
        return new String(byte1);
    }

    public static byte[] AES_CBC_Encrypt(byte[] content, byte[] keyBytes, byte[] iv){
        try {
            SecretKeySpec key = new SecretKeySpec(keyBytes, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE,key, new IvParameterSpec(iv));
            byte[] result = cipher.doFinal(content);
            return result;
        } catch (Exception e) {
            System.out.println("exception:"+e.toString());
        }
        return null;
    }

    public static byte[] AES_CBC_Decrypt(byte[] content, byte[] keyBytes, byte[] iv){
        try {
            SecretKeySpec key = new SecretKeySpec(keyBytes, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.DECRYPT_MODE,key, new IvParameterSpec(iv));
            byte[] result = cipher.doFinal(content);
            return result;
        } catch (Exception e) {
            System.out.println("exception:"+e.toString());
        }
        return null;
    }

    //字符串装换成base64
    public static byte[] decryptBASE64(String key) throws Exception {
        return Base64.decodeBase64(key.getBytes());
    }
    //base64装换成字符串
    public static String encryptBASE64(byte[] key) throws Exception {
        return new String(Base64.encodeBase64(key));
    }
}
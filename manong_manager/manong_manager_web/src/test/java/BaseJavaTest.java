import com.manong.pojo.Product;

public class BaseJavaTest {
    public static void main(String[] args) {
//       System.out.print("Hello World！！");
        Product product = new Product();
        product.setName("hahahha");
        Product product1 = new Product();
        product1.setName("hahahha");
        System.out.print(product.toString()+'\n');
        System.out.print(product1.toString());

    }
}

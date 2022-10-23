package dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetailDTO {

    private int orderDetailId;
    private int productId;
    private int quantity;
    private String price;
    private ProductDTO product;

    public OrderDetailDTO(int orderDetailId, int productId, int quantity, ProductDTO product) {
        this.orderDetailId = orderDetailId;
        this.productId = productId;
        this.quantity = quantity;
        this.product = product;
    }

    public OrderDetailDTO(int productId, int quantity, ProductDTO product) {
        this.productId = productId;
        this.quantity = quantity;
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailId=" + orderDetailId + ", productId=" + productId + ", quantity=" + quantity + ", price=" + price + ", product=" + product + '}';
    }
}

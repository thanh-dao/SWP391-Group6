package dto;

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
    private String name;
    private int quantity;
    private String price;

    public OrderDetailDTO(int orderDetailId, int productId, String name, int quantity) {
        this.orderDetailId = orderDetailId;
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailId=" + orderDetailId + ", productId=" + productId + ", quantity=" + quantity + ", price=" + price + '}';
    }
}

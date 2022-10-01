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
    private int quantity;

    public OrderDetailDTO(int orderDetailId, int productId) {
        this.orderDetailId = orderDetailId;
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailId=" + orderDetailId + ", productId=" + productId + ", quantity=" + quantity + '}';
    }
}

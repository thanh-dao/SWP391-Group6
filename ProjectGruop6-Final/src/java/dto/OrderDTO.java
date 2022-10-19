package dto;

import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderDTO {

    private int orderId;
    private int deliveryId;
    private int paymentId;
    private String emailBuyer;
    private Date orderDate;
    private AddressDTO address;
    private List<OrderByShopDTO> OrderByShopList;
    private float total;

    public OrderDTO(int orderId, String emailBuyer) {
        this.orderId = orderId;
        this.emailBuyer = emailBuyer;
    }

    public OrderDTO(String emailBuyer, AddressDTO address, List<OrderByShopDTO> OrderByShopList) {
        this.emailBuyer = emailBuyer;
        this.address = address;
        this.OrderByShopList = OrderByShopList;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", deliveryId=" + deliveryId + ", paymentId=" + paymentId + ", emailBuyer=" + emailBuyer + ", orderDate=" + orderDate + ", address=" + address + ", OrderByShopList=" + OrderByShopList + ", total=" + total + '}';
    }

}

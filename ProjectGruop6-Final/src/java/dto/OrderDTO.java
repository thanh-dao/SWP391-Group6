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
    private List<OrderByShopDTO> orderByShopList;
    private String payId;
    private String userName;
    private String phone;
//    private int total;

    public OrderDTO(int orderId, int deliveryId, int paymentId, String emailBuyer, Date orderDate, AddressDTO address, List<OrderByShopDTO> orderByShopList) {
        this.orderId = orderId;
        this.deliveryId = deliveryId;
        this.paymentId = paymentId;
        this.emailBuyer = emailBuyer;
        this.orderDate = orderDate;
        this.address = address;
        this.orderByShopList = orderByShopList;
    }

    public OrderDTO(int deliveryId, int paymentId, String emailBuyer, Date orderDate, AddressDTO address, List<OrderByShopDTO> orderByShopList) {
        this.deliveryId = deliveryId;
        this.paymentId = paymentId;
        this.emailBuyer = emailBuyer;
        this.orderDate = orderDate;
        this.address = address;
        this.orderByShopList = orderByShopList;
    }

    public OrderDTO(int orderId, String emailBuyer) {
        this.orderId = orderId;
        this.emailBuyer = emailBuyer;
    }

    public OrderDTO(String emailBuyer, AddressDTO address, List<OrderByShopDTO> orderByShopList, String userName, String phone) {
        this.emailBuyer = emailBuyer;
        this.address = address;
        this.orderByShopList = orderByShopList;
        this.userName = userName;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", deliveryId=" + deliveryId + ", paymentId=" + paymentId + ", emailBuyer=" + emailBuyer + ", orderDate=" + orderDate + ", address=" + address + ", orderByShopList=" + orderByShopList + ", payId=" + payId + ", userName=" + userName + ", phone=" + phone + '}';
    }

}

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
public class OrderByShopDTO {

    private int orderByShopId;
    private int orderId;
    private String emailSeller;
    private String name;
    private String status;
    private double transactionFee;
    private double transportFee;
    private Date shippedDate;
    private AddressDTO Address;
    private List<OrderDetailDTO> orderDetailList;
    private String ship_id;
    private int total;

    public OrderByShopDTO(String emailSeller, String name, AddressDTO Address, List<OrderDetailDTO> OrderDetailList) {
        this.emailSeller = emailSeller;
        this.name = name;
        this.Address = Address;
        this.orderDetailList = OrderDetailList;
    }

    @Override
    public String toString() {
        return "OrderByShopDTO{" + "orderByShopId=" + orderByShopId + ", orderId=" + orderId + ", emailSeller=" + emailSeller + ", name=" + name + ", status=" + status + ", transactionFee=" + transactionFee + ", transportFee=" + transportFee + ", shippedDate=" + shippedDate + ", Address=" + Address + ", orderDetailList=" + orderDetailList + ", ship_id=" + ship_id + ", total=" + total + '}';
    }

}

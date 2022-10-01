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
    private double transactionFee;
    private double transportFee;
    private Date shippedDate;
    private List<OrderDetailDTO> OrderDetailList;

    @Override
    public String toString() {
        return "OrderByShopDTO{" + "orderByShopId=" + orderByShopId + ", orderId=" + orderId + ", emailSeller=" + emailSeller + ", transactionFee=" + transactionFee + ", transportFee=" + transportFee + ", shippedDate=" + shippedDate + ", OrderDetailList=" + OrderDetailList + '}';
    }
}

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
    private String emailSeller;
    private String name;
    private double transactionFee;
    private double transportFee;
    private Date shippedDate;
    private AddressDTO Address;
    private List<OrderDetailDTO> OrderDetailList;

    public OrderByShopDTO(String emailSeller, String name, AddressDTO Address, List<OrderDetailDTO> OrderDetailList) {
        this.emailSeller = emailSeller;
        this.name = name;
        this.Address = Address;
        this.OrderDetailList = OrderDetailList;
    }

    public OrderByShopDTO(int aInt, String string, String string0, double aDouble, double aDouble0, java.sql.Date date, List<OrderDetailDTO> orderDetail) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String toString() {
        return "OrderByShopDTO{" + "orderByShopId=" + orderByShopId + ", emailSeller=" + emailSeller + ", name=" + name + ", transactionFee=" + transactionFee + ", transportFee=" + transportFee + ", shippedDate=" + shippedDate + ", OrderDetailList=" + OrderDetailList + '}';
    }
}

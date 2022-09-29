/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author kanek
 */
public class OrderDTO {
    private String orderId;
    private int deliveryId;
    private int paymentId;
    private String emailBuyer;
    private Date orderDate;
    private boolean status;
    private AddressDTO address;

    @Override
    public String toString() {
        return "OrderDTO{" + "orderId=" + orderId + ", deliveryId=" + deliveryId + ", paymentId=" + paymentId + ", emailBuyer=" + emailBuyer + ", orderDate=" + orderDate + ", status=" + status + ", address=" + address + '}';
    }
    
    
}

package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PaymentMethodDTO {

    private int paymentId;
    private String name;

    @Override
    public String toString() {
        return "PaymentMethodDTO{" + "paymentId=" + paymentId + ", name=" + name + '}';
    }

}

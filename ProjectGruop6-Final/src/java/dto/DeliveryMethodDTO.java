package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeliveryMethodDTO {

    private int deliveryId;
    private String name;

    @Override
    public String toString() {
        return "DeliveryMethodDTO{" + "deliveryMethodId=" + deliveryId + ", name=" + name + '}';
    }

}

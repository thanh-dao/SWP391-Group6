package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddressDTO {

    private String houseNumber;
    private String wardName;
    private String districtName;
    private String cityName;

    @Override
    public String toString() {
        return "AddressDTO{" + "houseNumber=" + houseNumber + ", cityName=" + cityName + ", districtName=" + districtName + ", wardName=" + wardName + '}';
    }
}

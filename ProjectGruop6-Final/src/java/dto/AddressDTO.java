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
    private String wardId;
    private String wardName;
    private String districtId;
    private String districtName;
    private String cityId;
    private String cityName;

    public AddressDTO(String houseNumber, String wardName, String districtName, String cityName) {
        this.houseNumber = houseNumber;
        this.wardName = wardName;
        this.districtName = districtName;
        this.cityName = cityName;
    }

    public boolean isNull() {
        return hasNameNull() || hasIdNull();
    }

    public boolean hasNameNull() {
        return houseNumber == null || wardName == null || districtName == null || cityName == null;
    }

    public boolean hasIdNull() {
        return cityId == null || districtId == null || wardId == null;
    }

    @Override
    public String toString() {
        return "AddressDTO{" + "houseNumber=" + houseNumber + ", wardId=" + wardId + ", wardName=" + wardName + ", districtId=" + districtId + ", districtName=" + districtName + ", cityId=" + cityId + ", cityName=" + cityName + '}';
    }

}

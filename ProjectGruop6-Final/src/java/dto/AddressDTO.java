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

    
    public boolean isNull(){
        return houseNumber == null || wardName == null || districtName == null || cityName == null;
    }
    
    @Override
    public String toString() {
        return "AddressDTO{" + "houseNumber=" + houseNumber + ", cityName=" + cityName + ", districtName=" + districtName + ", wardName=" + wardName + '}';
    }
}
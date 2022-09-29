/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author kanek
 */
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class AddressDTO {
    private String houseNumber;
    private String city;
    private String district;
    private String ward;

    @Override
    public String toString() {
        return "AddressDTO{" + "houseNumber=" + houseNumber + ", city=" + city + ", district=" + district + ", ward=" + ward + '}';
    }
    
    
}

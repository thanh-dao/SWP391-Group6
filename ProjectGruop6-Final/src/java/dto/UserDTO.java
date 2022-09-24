/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author kanek
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDTO {

    private String email;
    private String avatarLink;
    private String fullName;
    private String phone;
    private Date yob;
    private String address;
    private int wardId;
    private int cityId;
    private int districtId;
    private int roleId;

    public UserDTO(String email, String avatarLink, String fullName) {
        this.email = email;
        this.avatarLink = avatarLink;
        this.fullName = fullName;
    }
    
    
    
    @Override
    public String toString() {
        return "UserDTO{" + "email=" + email + ", fullName=" + fullName + ", phone=" + phone + ", yob=" + yob + ", address=" + address + ", wardId=" + wardId + ", cityId=" + cityId + ", districtId=" + districtId + ", roleId=" + roleId + '}';
    }

    

}

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
    private String firstName;
    private String lastName;
    private String phone;
    private Date yob;
    private AddressDTO address;
    private int roleId;

    public UserDTO(String email, String avatarLink, String firstName, String lastName) {
        this.email = email;
        this.avatarLink = avatarLink;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public UserDTO(String email, String avatarLink, String firstName, String lastName, String phone, int roleId) {
        this.email = email;
        this.avatarLink = avatarLink;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.roleId = roleId;
    }

    public UserDTO(String email, String avatarLink, String firstName, String lastName, String phone, AddressDTO address) {
        this.email = email;
        this.avatarLink = avatarLink;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.address = address;
    }

    public UserDTO(String email, String avatarLink, String firstName, String lastName, String phone, Date yob, AddressDTO address) {
        this.email = email;
        this.avatarLink = avatarLink;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.yob = yob;
        this.address = address;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "email=" + email + ", avatarLink=" + avatarLink + ", firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone + ", yob=" + yob + ", address=" + address + ", roleId=" + roleId + '}';
    }

}

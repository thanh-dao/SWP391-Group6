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
import java.io.Serializable;

/**
 *
 * @author kanek
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    private int cateId;
    private String name;
    private String icon;

    @Override
    public String toString() {
        return "CategoryDTO{" + "cateId=" + cateId + ", name=" + name + ", icon=" + icon + '}';
    }
}

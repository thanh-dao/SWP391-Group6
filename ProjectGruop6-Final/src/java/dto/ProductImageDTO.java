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
@AllArgsConstructor
@NoArgsConstructor
public class ProductImageDTO {
    private int imageID;
    private String url;
    private boolean isMainImg;

    @Override
    public String toString() {
        return "ProductImageDTO{" + "imageID=" + imageID + ", url=" + url + ", isMainImg=" + isMainImg + '}';
    }
    
    
}

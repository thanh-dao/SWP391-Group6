/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private int productId;
    private String emailSeller;
    private String name;
    private long price;
    private String description;
    private int cateID;
    private int quantity;
    private String emailAdmin;
    private boolean isAvalable;
    private Date createAt;
    private Date approveAt;
    private int soldCount;
    private List<ProductImageDTO> imgList;
    
    public ProductImageDTO getMainImage() {
        for (ProductImageDTO img : imgList) {
            if(img.isMainImg()){
                return img;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productId=" + productId + ", emailSeller=" + emailSeller + ", name=" + name + ", price=" + price + ", description=" + description + ", cateID=" + cateID + ", quantity=" + quantity + ", emailAdmin=" + emailAdmin + ", isAvalable=" + isAvalable + ", createAt=" + createAt + ", approveAt=" + approveAt + ", soldCount=" + soldCount + ", imgList=" + imgList + '}';
    }

    
    
    
}

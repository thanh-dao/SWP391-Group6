package dto;

import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private int productId;
    private String emailSeller;
    private String name;
    private long price;
    private String description;
    private int cateId;
    private int quantity;
    private String emailAdmin;
    private boolean isAvalable;
    private Date createAt;
    private Date approveAt;
    private int soldCount;
    private List<ProductImageDTO> imgList;

    public ProductImageDTO getMainImage() {
        for (ProductImageDTO img : imgList) {
            if (img.isMainImg()) {
                return img;
            }
        }
        return null;
    }

    public ProductDTO(int productId, String emailAdmin, boolean isAvalable, Date approveAt) {
        this.productId = productId;
        this.emailAdmin = emailAdmin;
        this.isAvalable = isAvalable;
        this.approveAt = approveAt;
    }

    public ProductDTO(int productId, String emailSeller, String name, long price, String description, int cateId, int quantity, int soldCount, List<ProductImageDTO> imgList) {
        this.productId = productId;
        this.emailSeller = emailSeller;
        this.name = name;
        this.price = price;
        this.description = description;
        this.cateId = cateId;
        this.quantity = quantity;
        this.soldCount = soldCount;
        this.imgList = imgList;
    }

    public ProductDTO(int productId, String name, long price, int quantity, int soldCount, List<ProductImageDTO> imgList) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.soldCount = soldCount;
        this.imgList = imgList;
    }

    public ProductDTO(int productId, String emailSeller, String name, long price, String description, int cateId, int quantity, List<ProductImageDTO> imgList) {
        this.productId = productId;
        this.emailSeller = emailSeller;
        this.name = name;
        this.price = price;
        this.description = description;
        this.cateId = cateId;
        this.quantity = quantity;
        this.imgList = imgList;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productId=" + productId + ", emailSeller=" + emailSeller + ", name=" + name + ", price=" + price + ", description=" + description + ", cateId=" + cateId + ", quantity=" + quantity + ", emailAdmin=" + emailAdmin + ", isAvalable=" + isAvalable + ", createAt=" + createAt + ", approveAt=" + approveAt + ", soldCount=" + soldCount + ", imgList=" + imgList + '}';
    }
}

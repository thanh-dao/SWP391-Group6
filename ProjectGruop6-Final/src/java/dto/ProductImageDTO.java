package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
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

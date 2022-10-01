package dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BannerDTO {

    private int bannerId;
    private String url;
    private boolean type;

    @Override
    public String toString() {
        return "BannerDTO{" + "bannerId=" + bannerId + ", url=" + url + ", type=" + type + '}';
    }
}

package dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
    private String avatarLink;
    private String name;
    private double rating;
    private String comment;
    private List<ReviewImageDTO> image;

    @Override
    public String toString() {
        return "ReviewDTO{" + "avatarLink=" + avatarLink + ", name=" + name + ", rating=" + rating + ", comment=" + comment + ", image=" + image + '}';
    }
}

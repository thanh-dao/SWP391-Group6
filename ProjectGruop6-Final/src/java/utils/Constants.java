/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * this class is used for holds the constraint that may be changed in the future
 *
 */
public class Constants {

    public static final String GOOGLE_CLIENT_ID = "361981052480-8ke1bdjjdl3alh1o3f2mrm4osm4uo8bk.apps.googleusercontent.com";

    public static final String GOOGLE_CLIENT_SECRET = "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";

    public static final String GOOGLE_REDIRECT_URI = "http://localhost:8084/ProjectGroup6/user/googleLoginHandle.do";

    public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static final String GOOGLE_GRANT_TYPE = "authorization_code";

    public static final int ITEM_PER_PAGE = 16;

    public static final int ITEM_PER_PAGE_PRODUCT_DETAIL = 12;

    public static final int RESULT_PER_SEARCH = 5;
    
    public static final String IMAGE_RELATIVE_DIRECTORY = "/ProjectGroup6/img";
    
    public static final String IMAGE_ABSOLUTE_DIRECTORY = "C:/Users/ADmin/Desktop/swp-391-git/SWP391-Group6/ProjectGruop6-Final/web/img";
    
    public static void main(String[] args) {
        System.out.println(getImageDirectory());
    }
    public static String getImageDirectory () {
        return (new java.io.File("").getAbsolutePath() + "\\web\\img").replace("\\",  "/");
    }
    
}

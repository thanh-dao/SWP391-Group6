/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AddressDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import utils.DBUtil;

/**
 *
 * @author kanek
 */
public class AddressDAO {

    public final int CITY = 1;

    public final int DISTRICT = 2;

    public final int WARD = 3;

    public AddressDTO getFullAddress(String houseNumber, String cityId, String districtId, String wardId)
            throws ClassNotFoundException, SQLException {
        String cityName = get(cityId, CITY);
        String districtName = get(districtId, DISTRICT);
        String wardName = get(wardId, WARD);
        return new AddressDTO(houseNumber, wardId, wardName, districtId, districtName, cityId, cityName);
    }

    public String get(String id, int table) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        String tableName;
        String primaryKey = "";
        switch (table) {
            case CITY: {
                tableName = "city";
                break;
            }
            case DISTRICT: {
                tableName = "district";
                break;
            }
            case WARD: {
                tableName = "ward";
                break;
            }
            default: {
                throw new IllegalArgumentException("Invalid argument \"table\","
                        + "please use the constaints in AddressDAO class instead!!!");
            }
        }
        primaryKey = tableName + "_id";
        PreparedStatement stm = conn.prepareStatement("SELECT name FROM " + tableName
                + " WHERE " + primaryKey + " = ?");
        stm.setString(1, id);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return rs.getString(1);
        }
        return null;
    }

    public String getCity(String cityId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select name from city "
                + "where city_id = ?");
        stm.setString(1, cityId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return rs.getString(1);
        }
        return null;
    }

    public List<Map<String, String>> getCityIdAndName() throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getConnection();
        List<Map<String, String>> result = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("SELECT city_id, name FROM city");
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Map<String, String> data = new HashMap<>();
            data.put("id", rs.getString(1));
            data.put("name", rs.getString(2));
            result.add(data);
        }
        return result;
    }
    public List<Map<String, String>> getDistrictIdAndName(int cityId) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getConnection();
        List<Map<String, String>> result = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("SELECT district_id, name FROM district where city_id = ?");
        stm.setInt(1, cityId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Map<String, String> data = new HashMap<>();
            data.put("id", rs.getString(1));
            data.put("name", rs.getString(2));
            result.add(data);
        }
        return result;
    }
    
    public List<Map<String, String>> getWardIdAndName(int districtId) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getConnection();
        List<Map<String, String>> result = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("SELECT ward_id, name FROM ward where district_id = ?");
        stm.setInt(1, districtId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Map<String, String> data = new HashMap<>();
            data.put("id", rs.getString(1));
            data.put("name", rs.getString(2));
            result.add(data);
        }
        return result;
    }
    

    public static void main(String[] args) {
        AddressDAO a = new AddressDAO();
        try {
//            
            System.out.println(a.get(null, a.CITY));
            if (a.get(null, a.CITY) == null) {
                System.out.println("OK");
            }
//System.out.println(a.getCity("01"));
        } catch (Exception e) {
        }
    }
}

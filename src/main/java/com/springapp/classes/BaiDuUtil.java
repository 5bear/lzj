package com.springapp.classes;

        import net.sf.json.JSONObject;


/**
 * 百度工具类
 *
 * @author xuyw
 * @email xyw10000@163.com
 * @date 2014-06-22
 */
public class BaiDuUtil {
    //private static String key = "90GSMXDskQhD5s7K8hUEyQHsHVUPp16E";
    private static String key = "avs3S28Dq5BjX7fCWUYjP3HA";


    /**
     *
     * @param lat 纬度
     * @param lng 经度
     * @return
     */
    public static String getPosition(String lat, String lng) {
        JSONObject obj;
        String street = "";
        try{
            obj  = getLocationInfo(lat, lng).getJSONObject("result")
                    .getJSONObject("addressComponent");
            System.out.println("-----------obj----------"+obj);
            System.out.println("----------obj.toString()-----------"+obj.toString());
            street =  obj.getString("street");
        }catch (Exception e){
            e.printStackTrace();
            street =   "";
        }
        obj=null;
        return street;
    }
    public static String getPosition(Double lat, Double lng) {
        JSONObject obj;
        String street = "";
        try{
            obj  = getLocationInfo(lat, lng).getJSONObject("result")
                    .getJSONObject("addressComponent");
            street =  obj.getString("street");
        }catch (Exception e){
            e.printStackTrace();
            street =   "";
        }
        obj=null;
        return street;
    }

    public static JSONObject getLocationInfo(String lat, String lng) {
        String url = "http://api.map.baidu.com/geocoder/v2/?location=" + lat + ","
                + lng + "&output=json&ak=" + key +"&pois=0";
        return JSONObject.fromObject(HttpUtil.getRequest(url));
    }
    public static JSONObject getLocationInfo(Double lat, Double lng) {
        String url = "http://api.map.baidu.com/geocoder/v2/?location=" + lat + ","
                + lng + "&output=json&ak=" + key +"&pois=0";
        return  JSONObject.fromObject(HttpUtil.getRequest(url));
    }
    public static void main(String[] args) {
        System.out.println("----------------------"+BaiDuUtil.getPosition("31.1837","121.33848"));
    }


}
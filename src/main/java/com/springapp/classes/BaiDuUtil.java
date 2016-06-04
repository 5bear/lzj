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
    private static String key = "90GSMXDskQhD5s7K8hUEyQHsHVUPp16E";

    /**
     *
     * @param lat 纬度
     * @param lng 经度
     * @return
     */
    public static String getPosition(String lat, String lng) {
        JSONObject obj = getLocationInfo(lat, lng).getJSONObject("result")
                .getJSONObject("addressComponent");
        return obj.getString("street");
    }

    public static JSONObject getLocationInfo(String lat, String lng) {
        String url = "http://api.map.baidu.com/geocoder/v2/?location=" + lat + ","
                + lng + "&output=json&ak=" + key +"&pois=0";
        JSONObject obj = JSONObject.fromObject(HttpUtil.getRequest(url));
        return obj;
    }

    /*public static void main(String[] args) {
        System.out.println("----------------------"+BaiDuUtil.getPosition("31.234223","121.413218"));
    }*/


}
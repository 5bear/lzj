package com.springapp.classes;

import com.springapp.entity.Vehicle;

import java.io.*;
import java.util.List;

/**
 * Created by ZhanShaoxiong on 2016/5/11.
 */
public class FileUtil {
    private static String IP="180.168.194.3";
    private static String PORT="6605";
    public static String readTxtFile(String filePath){
        String result="";
        try {
            String encoding="GBK";
            File file=new File(filePath);
            if(file.isFile() && file.exists()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                        new FileInputStream(file),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while((lineTxt = bufferedReader.readLine()) != null){
                   result+=lineTxt;
                }
                read.close();
            }else{
                System.out.println("找不到指定的文件");
            }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }
        return result;
    }
    public static void OutToTxt(List<Vehicle> vehicleList){
        try{
            File file =new File("C://GpsData/GpsData/gps.conf");
            //if file doesnt exists, then create it
            if(file.exists()){
                file.deleteOnExit();
                file.createNewFile();
            }

            //true = append file
            String fileName=file.getName();
            FileWriter fileWritter = new FileWriter("C://GpsData/GpsData/gps.conf",false);
            BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
            bufferWritter.write("http://localhost:8080/lzj/task1");
            bufferWritter.newLine();
            bufferWritter.write("http://localhost:8080/lzj/task2");
            bufferWritter.newLine();
            bufferWritter.write("http://localhost:8080/lzj/task3");
            bufferWritter.newLine();
            bufferWritter.write("C:/GPSDATA/");
            bufferWritter.newLine();
            bufferWritter.write(IP);
            bufferWritter.newLine();
            bufferWritter.write(PORT);
            bufferWritter.newLine();
            for(Vehicle vehicle:vehicleList){
                if(vehicle.getOBUId()!=null&&!vehicle.getOBUId().equals("")) {
                    bufferWritter.write(vehicle.getOBUId());
                    bufferWritter.newLine();
                }
            }
            bufferWritter.close();

        }catch(IOException e){
            e.printStackTrace();
        }
    }
}

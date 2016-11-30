package com.springapp.classes;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by as on 2016/6/1.
 */
public class FTPClientExample {
    private FTPClient ftp;
    /**
     * @param path     上传到ftp服务器哪个路径下
     * @param addr     地址
     * @param port     端口号
     * @param username 用户名
     * @param password 密码
     * @return
     * @throws Exception
     */
    public boolean connect(String path, String addr, int port, String username, String password) throws Exception {
        boolean result = false;
        ftp = new org.apache.commons.net.ftp.FTPClient();
        int reply;
        ftp.connect(addr, port);
        ftp.login(username, password);
        ftp.setFileType(org.apache.commons.net.ftp.FTPClient.BINARY_FILE_TYPE);
        reply = ftp.getReplyCode();
        if (!FTPReply.isPositiveCompletion(reply)) {
            ftp.disconnect();
            return result;
        }
        ftp.changeWorkingDirectory(path);
        result = true;
        return result;
    }

    /**
     * @param file 上传的文件或文件夹
     * @throws Exception
     */
    public void upload(File file) throws Exception {
        if (file.isDirectory()) {
            ftp.makeDirectory(file.getName());
            ftp.changeWorkingDirectory(file.getName());
            String[] files = file.list();
            for (int i = 0; i < files.length; i++) {
                File file1 = new File(file.getPath() + "\\" + files[i]);
                if (file1.isDirectory()) {
                    upload(file1);
                    ftp.changeToParentDirectory();
                } else {
                    File file2 = new File(file.getPath() + "\\" + files[i]);
                    FileInputStream input = new FileInputStream(file2);
                    ftp.enterLocalPassiveMode();
                    ftp.storeFile(file2.getName(), input);
                    input.close();
                }
            }
        } else {
            File file2 = new File(file.getPath());
            FileInputStream input = new FileInputStream(file2);
            ftp.enterLocalPassiveMode();
            ftp.storeFile(file2.getName(), input);
            input.close();
        }
    }
    public List<String> getFileList(String path) throws IOException {
        // listFiles return contains directory and file, it's FTPFile instance
        // listNames() contains directory, so using following to filer directory.
        //String[] fileNameArr = ftpClient.listNames(path);
        ftp.enterRemotePassiveMode();
        ftp.enterLocalPassiveMode();
        ftp.setControlEncoding("utf-8");
        ftp.setFileType(org.apache.commons.net.ftp.FTPClient.BINARY_FILE_TYPE);
        ftp.changeWorkingDirectory(path);
        FTPFile[] ftpFiles= ftp.listFiles();
        List<String> retList = new ArrayList<String>();
        if (ftpFiles == null || ftpFiles.length == 0) {
            return retList;
        }
        for (FTPFile ftpFile : ftpFiles) {
            if (ftpFile.isFile()) {
                retList.add(ftpFile.getName());
            }
        }
        return retList;
    }
    //下载
    public void downLoad(String ftpFile, String dstFile) throws IOException {
        File file = new File(dstFile);
        FileOutputStream fos = new FileOutputStream(file);
        ftp.retrieveFile(ftpFile, fos);
        fos.close();
    }

    public List<String> CJbegin(String id,String time)  {
        List<String> List = new ArrayList<String>();
        FTPClientExample t = new FTPClientExample();
        try {
            t.connect("C:\\video", "180.169.114.154", 21, "lzj", "lzjlzj");
            List=t.getFileList("RECORD_FILE\\"+id+"("+id+")\\"+time);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //File file = new File("D:\\0200001.txt");
        //t.upload(file);
        //t.downLoad("D:\\H20160502-000000P1N2P0.avi","D:\\1");
        return List;
    }
    public List<String> GJbegin(String id,String time)  {
        List<String> List = new ArrayList<String>();
        FTPClientExample t = new FTPClientExample();
        try {
            t.connect("C:\\video", "180.169.114.154", 21, "lzj", "lzjlzj");
            List=t.getFileList("RECORD_FILE\\"+id+"("+id+")\\"+time);

        } catch (Exception e) {
            e.printStackTrace();
        }
        //File file = new File("D:\\0200001.txt");
        //t.upload(file);
        //t.downLoad("D:\\H20160502-000000P1N2P0.avi","D:\\1");
        return List;
    }

}

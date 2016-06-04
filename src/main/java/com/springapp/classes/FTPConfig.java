package com.springapp.classes;

/**
 * Created by as on 2016/5/31.
 */
public class FTPConfig {
    private String server;
    private int port;
    private String username;
    private String password;
    private String location;

    public String getServer() {
        return server;
    }

    public void setServer(String server) {
        this.server = server;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
    public FTPConfig(){

    }

    public FTPConfig(String server, int port, String username, String password, String location) {
        this.server = server;
        this.port = port;
        this.username = username;
        this.password = password;
        this.location = location;
    }
}

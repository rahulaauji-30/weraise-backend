package database;
public class User {
    private int id;
    private String username;
    private String name;
    private String imgurl;
    private String bio;
    private String location;

    public User(int id, String username,String name,String imgurl,String bio,String location) {
        this.id = id;
        this.username = username;
        this.name = name;
        this.imgurl = imgurl;
        this.bio = bio;
        this.location = location;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getImgurl() {
        return imgurl;
    }

    public String getBio() {
        return bio;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }
}

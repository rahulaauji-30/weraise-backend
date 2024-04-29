package database;
import java.util.Date;

public class Campaign {
    private int id;
    private int userId;
    private String category;
    private String title;
    private String yturl;
    private String imgurl;
    private String story;
    private String bio;
    private float amount;
    private float amountRaised;
    private Date startDate;
    private Date endDate;


    public void setId(int id) {
        this.id = id;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setYturl(String yturl) {
        this.yturl = yturl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public void setAmountRaised(float amountRaised) {
        this.amountRaised = amountRaised;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getCategory() {
        return category;
    }

    public String getTitle() {
        return title;
    }

    public String getYturl() {
        return yturl;
    }

    public String getImgurl() {
        return imgurl;
    }

    public String getStory() {
        return story;
    }

    public String getBio() {
        return bio;
    }

    public float getAmount() {
        return amount;
    }

    public Date getStartDate() {
        return startDate;
    }

    public float getAmountRaised() {
        return amountRaised;
    }

    public Date getEndDate() {
        return endDate;
    }
}

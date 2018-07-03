package bean;

public class CombineDataBean {
    private int ID;


    private String canID;

    private String data;

    private String timeStamp;


    public CombineDataBean()
    {

    }

    public CombineDataBean(String canID,String data,String timeStamp)
    {
        this.canID=canID;
        this.data=data;
        this.timeStamp=timeStamp;
    }

    public int getID() {
        return ID;
    }
    public void setID(int id) {
        this.ID = id;
    }

    public String getCanID() {
        return canID;
    }
    public void setCanID(String canID) {
        this.canID = canID;
    }
    public String getData() {
        return data;
    }
    public void setData(String data) {
        this.data=data;
    }
    public String getTimestamp() {
        return timeStamp;
    }
    public void setTimestamp(String timeStamp) {
        this.timeStamp=timeStamp;
    }

}

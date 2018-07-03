package bean;

public class ABlineBean {
    private int id;
    private String ABDate;
    private String a_Lat;
    private String a_Lng;
    private String b_Lat;
    private String b_Lng;
    private String fDate;

    public void setfDate(String fDate) {
        this.fDate = fDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setA_Lat(String a_Lat) {
        this.a_Lat = a_Lat;
    }

    public void setA_Lng(String a_Lng) {
        this.a_Lng = a_Lng;
    }

    public void setABDate(String ABDate) {
        this.ABDate = ABDate;
    }

    public void setB_Lat(String b_Lat) {
        this.b_Lat = b_Lat;
    }

    public void setB_Lng(String b_Lng) {
        this.b_Lng = b_Lng;
    }

    public int getId() {
        return id;
    }

    public String getfDate() {
        return fDate;
    }

    public String getA_Lat() {
        return a_Lat;
    }

    public String getA_Lng() {
        return a_Lng;
    }

    public String getABDate() {
        return ABDate;
    }

    public String getB_Lat() {
        return b_Lat;
    }

    public String getB_Lng() {
        return b_Lng;
    }
}

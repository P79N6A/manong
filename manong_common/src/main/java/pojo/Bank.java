package pojo;

public class Bank {

    private Integer id;
    private String name;
    private String ShortName;

    public Bank(){}

    public Bank(Integer id, String name, String shortName) {
        this.id = id;
        this.name = name;
        ShortName = shortName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortName() {
        return ShortName;
    }

    public void setShortName(String shortName) {
        ShortName = shortName;
    }


}

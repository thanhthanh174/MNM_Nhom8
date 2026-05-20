package T_Luxury_models;

public class Product {
    private String name;
    private int price;
    private String img;

    public Product(String name, int price, String img) {
        this.name = name;
        this.price = price;
        this.img = img;
    }

    public String getName() { return name; }
    public int getPrice() { return price; }
    public String getImg() { return img; }
}
package Task.Task_13_to_15.data;

import java.util.Date;

public abstract class HomeAnimals extends Animal {
    
    protected String name;
    protected String color;
    protected Date date_birth;
    protected String commands;

    public HomeAnimals(int id, String name, String color, Date date_birth, String commands) {
        super(id);
        this.name = name;
        this.color = color;
        this.date_birth = date_birth;
        this.commands = commands;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Date getDate_birth() {
        return date_birth;
    }

    public void setDate_birth(Date date_birth) {
        this.date_birth = date_birth;
    }

    public String getCommands() {
        return commands;
    }

    public void setCommands(String commands) {
        this.commands = commands;
    }
}
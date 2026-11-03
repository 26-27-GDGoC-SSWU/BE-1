package hello.hello_spring.controller;

public class MemberForm {

    private String name;

    public String getName() {
        return name; // html코드에서 name이랑 매칭이 되서 들어온다
    }

    public void setName(String name) {
        this.name = name;
    }


}

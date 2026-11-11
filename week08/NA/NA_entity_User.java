package com.example.accessing_data_mysql;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

// 테이블이 될 엔터티들
//@Entity 붙이면 jpa가 이걸 보고 user 테이블을 만들어줌
@Entity
public class User {
    @Id //기본키(pk)
    @GeneratedValue(strategy = GenerationType.IDENTITY) //번호는 db가 1,2,3 자동으로 매김
    private Integer id;
    private String name;
    private String email;

    //getter, setter -> 값 꺼내고 넣는
    public Integer getId(){return id;}
    public void setId(Integer id){this.id=id;}
    public String getName(){return name;}
    public void setName(String name){this.name=name;}
    public String getEmail(){return email;}
    public void setEmail(String email){this.email=email;}

}

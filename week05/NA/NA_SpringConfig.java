package hello.hello_spring;

import hello.hello_spring.repository.MemberRepository;
import hello.hello_spring.repository.MemoryMemberRepository;
import hello.hello_spring.service.Memberservice;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class SpringConfig {

    //스프링 리포지토리랑 서비스를 등록하는?
    @Bean
    public Memberservice memberservice(){
        return new Memberservice(memberrepository());
    }

    @Bean
    public MemberRepository memberrepository(){
        return new MemoryMemberRepository();
    }
}

package hello.hello_spring.repository;

import hello.hello_spring.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    Member save(Member member); //회원이 저장되는

    //저장하는
    Optional<Member> findById(Long id); //없으면 null로 반환하는데 뭐,,>?
    Optional<Member> findByName(String name);
    List<Member> findAll();
}

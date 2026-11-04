package hello.hello_spring.repository;

import hello.hello_spring.domain.Member;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class JpaMemberRepository implements MemberRepository {

    //jpa는 이걸로 진행을한다? 연결같은거 전부 다 해준다?
    //jpa를 쓸꺼면 em을 받아야한다
    private final EntityManager em;

    public JpaMemberRepository(EntityManager em) {
        this.em = em;
    }

    @Override
    public Member save(Member member) {
        em.persist(member); //멤버를 영구저장하다.
        return member;
        //jpa가 insert 쿼리까지 해준다
    }

    @Override
    public Optional<Member> findById(Long id) {
        Member member= em.find(Member.class, id); //조회하는거
        return Optional.ofNullable(member);
    }

    @Override
    public Optional<Member> findByName(String name) {
        List<Member> result= em.createQuery("select m from Member m where m.name=:name",Member.class)
                .setParameter("name",name)
                .getResultList();

        return result.stream().findAny();
    }

    @Override
    public List<Member> findAll() {
        //객체 자체를 조회함  = m
        return em.createQuery("select m from Member m",Member.class)
                .getResultList();
    }
}

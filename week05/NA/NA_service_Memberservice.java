package hello.hello_spring.service;

import hello.hello_spring.domain.Member;
import hello.hello_spring.repository.MemberRepository;
import hello.hello_spring.repository.MemoryMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

//컨트롤+shuft+t => 테스트 자동으로 만듦!!

public class Memberservice {

    private final MemberRepository memberRepository;


    public Memberservice(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    //회원 가입
    public Long join(Member member) {
        //중복회원 x -> 같은 이름이 있는
        validateDuplicateMember(member); // 중복회원 검증

        memberRepository.save(member);
        return member.getId();
    }

    private void validateDuplicateMember(Member member) {
        //옵셔널으로 감싸서 진행을한다? 컨트롤T? -> 매서드
        memberRepository.findByName(member.getName())
                .ifPresent(m -> {
                      throw new IllegalStateException("이미 존재하는 회원입니다.");
                });
    }

    //전체회원 조회
    public List<Member> findMembers() {
        return memberRepository.findAll(); // 리스트로 반환

    }
    public Optional<Member> findOne(Long memberid) {
        return memberRepository.findById(memberid);
    }

    //
}

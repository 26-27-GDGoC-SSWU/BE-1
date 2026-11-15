package com.example.accessing_data_mysql;


import org.springframework.web.bind.annotation.*;

//json으로 바로 응답해주는 컨트롤러 -> html 말고 데이터 자체를 돌려줌
@RestController
@RequestMapping("/demo") // 여기 주소들은 전부 /demo로 시작함
public class MainController {
    private final UserRepository userRepository;

    //생성자 주입 -> 스프링이 레포지토리를 알아서 넣어줌
    public MainController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    //유저 저장하는
    //주소 뒤에 ?name=..&email=.. 로 들어온 값을 하나씩 꺼내옴
    @PostMapping("/add")
    public String addNewUser(@RequestParam String name,
                             @RequestParam String email){
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        userRepository.save(user); //db에 insert까지 해줌
        return "Saved";
    }

    //전체 유저 조회 -> 목록을 json으로 반환
    @GetMapping("/all")
    public Iterable<User> getAllusers(){
        return userRepository.findAll(); //select * from user 랑 같은
    }
}

package com.example.accessing_data_mysql;

import org.springframework.data.repository.CrudRepository;

//db 담당
//CrudRepository 상속만 하면 save, findAll, findById 같은게 자동으로 생김 -> 구현 안해도 됨!!
//<User,Integer> = 어떤 엔터티인지, pk 타입이 뭔지
public interface UserRepository extends CrudRepository<User,Integer> {
}

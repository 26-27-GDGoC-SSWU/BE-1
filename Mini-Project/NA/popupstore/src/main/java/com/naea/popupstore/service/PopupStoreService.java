package com.naea.popupstore.service;

import com.naea.popupstore.domain.PopupStore;
import com.naea.popupstore.repository.PopupStoreRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//실제 로직 담당
//jpa로 데이터 바꿀때는 트랜잭션 안에서 해야함 -> @Transactional
@Service
@Transactional
public class PopupStoreService {

    private final PopupStoreRepository popupStoreRepository;

    //생성자 주입 -> 스프링이 레포지토리를 알아서 넣어줌
    public PopupStoreService(PopupStoreRepository popupStoreRepository) {
        this.popupStoreRepository = popupStoreRepository;
    }

    //팝업 등록
    public PopupStore register(PopupStore popupStore) {
        return popupStoreRepository.save(popupStore); //db에 insert
    }

    //팝업 전체 조회
    public List<PopupStore> findPopups() {
        return popupStoreRepository.findAll(); // 리스트로 반환
    }

    //팝업 하나 조회
    public PopupStore findOne(Long id) {
        return popupStoreRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("팝업을 찾을 수 없습니다.")); // 없으면 에러
    }

    //팝업 수정 -> 기존꺼 찾아서 값만 바꿔줌
    public PopupStore update(Long id, PopupStore updateParam) {
        PopupStore popupStore = findOne(id);
        popupStore.setName(updateParam.getName());
        popupStore.setBrand(updateParam.getBrand());
        popupStore.setCategory(updateParam.getCategory());
        popupStore.setRegion(updateParam.getRegion());
        popupStore.setStartDate(updateParam.getStartDate());
        popupStore.setEndDate(updateParam.getEndDate());
        popupStore.setDescription(updateParam.getDescription());
        popupStore.setOfficialUrl(updateParam.getOfficialUrl());
        return popupStoreRepository.save(popupStore); //db에 update
    }

    //팝업 삭제 -> 없는 번호면 에러
    public void delete(Long id) {
        PopupStore popupStore = findOne(id);
        popupStoreRepository.delete(popupStore);
    }
}

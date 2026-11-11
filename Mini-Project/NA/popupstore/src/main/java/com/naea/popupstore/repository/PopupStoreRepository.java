package com.naea.popupstore.repository;

import com.naea.popupstore.domain.PopupStore;
import org.springframework.data.jpa.repository.JpaRepository;

//db 담당
//JpaRepository 상속만 하면 save, findAll, findById, deleteById 자동으로 생김
//<PopupStore,Long> = 어떤 엔터티인지, pk 타입이 뭔지
public interface PopupStoreRepository extends JpaRepository<PopupStore, Long> {
}

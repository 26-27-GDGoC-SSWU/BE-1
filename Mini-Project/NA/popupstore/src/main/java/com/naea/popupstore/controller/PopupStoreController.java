package com.naea.popupstore.controller;

import com.naea.popupstore.domain.Category;
import com.naea.popupstore.domain.PopupStore;
import com.naea.popupstore.service.PopupStoreService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

//화면(html) 돌려주는 컨트롤러 -> return 하는 글자가 templates 안 html 파일 이름
@Controller
public class PopupStoreController {

    private final PopupStoreService popupStoreService;

    //생성자 주입
    public PopupStoreController(PopupStoreService popupStoreService) {
        this.popupStoreService = popupStoreService;
    }

    //메인 = 팝업 목록
    @GetMapping("/")
    public String list(Model model) {
        List<PopupStore> popups = popupStoreService.findPopups();
        model.addAttribute("popups", popups);
        return "popups/popupList";
    }

    //등록 화면 띄우기
    @GetMapping("/popups/new")
    public String createForm(Model model) {
        model.addAttribute("categories", Category.values());
        return "popups/createPopupForm";
    }

    //등록 처리 -> 저장하고 메인으로
    @PostMapping("/popups/new")
    public String create(PopupStoreForm form) {
        PopupStore popupStore = new PopupStore();
        copyForm(form, popupStore);
        popupStoreService.register(popupStore);
        return "redirect:/";
    }

    //상세 화면
    @GetMapping("/popups/{id}")
    public String detail(@PathVariable Long id, Model model) {
        model.addAttribute("popup", popupStoreService.findOne(id));
        return "popups/popupDetail";
    }

    //수정 화면 띄우기 -> 기존 값 채워서 보여줌
    @GetMapping("/popups/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("popup", popupStoreService.findOne(id));
        model.addAttribute("categories", Category.values());
        return "popups/editPopupForm";
    }

    //수정 처리 -> 수정하고 상세 화면으로
    @PostMapping("/popups/{id}/edit")
    public String edit(@PathVariable Long id, PopupStoreForm form) {
        PopupStore updateParam = new PopupStore();
        copyForm(form, updateParam);
        popupStoreService.update(id, updateParam);
        return "redirect:/popups/" + id;
    }

    //삭제 처리 -> 메인으로
    @PostMapping("/popups/{id}/delete")
    public String delete(@PathVariable Long id) {
        popupStoreService.delete(id);
        return "redirect:/";
    }

    //폼 값 -> 엔터티로 옮겨 담는 (등록, 수정 둘 다 써서 따로 뺌)
    private void copyForm(PopupStoreForm form, PopupStore popupStore) {
        popupStore.setName(form.getName());
        popupStore.setBrand(form.getBrand());
        popupStore.setCategory(form.getCategory());
        popupStore.setRegion(form.getRegion());
        popupStore.setStartDate(form.getStartDate());
        popupStore.setEndDate(form.getEndDate());
        popupStore.setDescription(form.getDescription());
        popupStore.setOfficialUrl(form.getOfficialUrl());
    }
}

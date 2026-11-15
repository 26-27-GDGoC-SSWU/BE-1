
package com.fitrecord.controller;

import com.fitrecord.entity.Workout;
import com.fitrecord.service.WorkoutService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class WorkoutController {

    private final WorkoutService workoutService;

    public WorkoutController(WorkoutService workoutService) {
        this.workoutService = workoutService;
    }

    // 메인 페이지: 운동 기록 전체 조회
    @GetMapping("/")
    public String list(Model model) {
        model.addAttribute("workouts", workoutService.getAllWorkouts());
        return "workout/list";
    }

    // 운동 기록 등록 페이지
    @GetMapping("/workouts/new")
    public String createForm(Model model) {
        model.addAttribute("workout", new Workout());
        return "workout/form";
    }

    // 운동 기록 저장
    @PostMapping("/workouts")
    public String create(@ModelAttribute Workout workout) {
        workoutService.saveWorkout(workout);
        return "redirect:/";
    }

    // 운동 기록 상세 페이지
    @GetMapping("/workouts/{id}")
    public String detail(@PathVariable Long id, Model model) {
        model.addAttribute("workout", workoutService.getWorkout(id));
        return "workout/detail";
    }

    // 운동 기록 수정 페이지
    @GetMapping("/workouts/{id}/edit")
    public String editForm(@PathVariable Long id, Model model) {
        model.addAttribute("workout", workoutService.getWorkout(id));
        return "workout/form";
    }

    // 운동 기록 수정
    @PostMapping("/workouts/{id}/edit")
    public String update(@PathVariable Long id, @ModelAttribute Workout workout) {
        Workout existingWorkout = workoutService.getWorkout(id);

        existingWorkout.setWorkoutDate(workout.getWorkoutDate());
        existingWorkout.setExerciseType(workout.getExerciseType());
        existingWorkout.setDuration(workout.getDuration());
        existingWorkout.setMemo(workout.getMemo());

        workoutService.saveWorkout(existingWorkout);
        return "redirect:/workouts/" + id;
    }

    // 운동 기록 삭제
    @PostMapping("/workouts/{id}/delete")
    public String delete(@PathVariable Long id) {
        workoutService.deleteWorkout(id);
        return "redirect:/";
    }
}

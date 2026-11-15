
package com.fitrecord.service;

import com.fitrecord.entity.Workout;
import com.fitrecord.repository.WorkoutRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkoutService {

    private final WorkoutRepository workoutRepository;

    // 생성자
    public WorkoutService(WorkoutRepository workoutRepository) {
        this.workoutRepository = workoutRepository;
    }

    // 운동 기록 전체 조회
    public List<Workout> getAllWorkouts() {
        return workoutRepository.findAll();
    }

    // 운동 기록 저장
    public Workout saveWorkout(Workout workout) {
        return workoutRepository.save(workout);
    }

    // 운동 기록 하나 조회
    public Workout getWorkout(Long id) {
        return workoutRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("운동 기록을 찾을 수 없습니다."));
    }

    // 운동 기록 삭제
    public void deleteWorkout(Long id) {
        workoutRepository.deleteById(id);
    }
}

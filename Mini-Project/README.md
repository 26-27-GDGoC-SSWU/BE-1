# 🌱 나만의 미니 웹 애플리케이션 프로젝트

> 매주 학습한 Spring 핵심 기술을 적용하여 각자 자신만의 웹 서비스를 완성해 나가는 점진적 미니 프로젝트 공간입니다.
> 충돌 방지와 원활한 협업을 위해 아래 규칙과 순서에 맞춰 과제를 올려주세요.

---

## 1. 폴더 구조 규칙

모든 프로젝트는 `Mini-Project` 폴더 하위에 **본인 영문 이니셜** 폴더를 생성하여 그 안에 프로젝트 전체를 넣어주세요.

```text
Mini-Project/
  └── {본인이니셜}/          (예: SB, JS, etc.)
        ├── src/
        ├── build.gradle
        └── ...
```

## 2. 제출 단계별 가이드 (Git 워크플로우)
### [1단계] 최신 코드 내려받기
작업 전 반드시 메인 저장소의 최신 변경 사항을 먼저 동기화합니다.

```bash
git checkout main
git pull origin main
```
### [2단계] 개인 작업 브랜치 생성 및 이동
`main` 브랜치에서 본인의 브랜치를 새로 생성합니다.

```bash
# 브랜치명 형식: feature/{본인이니셜}-{프로젝트명}-{etc}
git checkout -b feature/SB-restaurant-crud
```

### [3단계] 코드 추가 및 커밋
`Mini-Project/{본인이니셜}` 폴더 안에 작업한 프로젝트 코드를 위치시킨 후 커밋합니다.

```bash
git status # 변경 파일 확인
git add . # 파일 전체 스테이징
git commit -m "feat: {본인이니셜} 맛집 기록 프로젝트 구현" # 커밋 메시지 작성
```

### [4단계] GitHub로 브랜치 푸시
내 로컬 컴퓨터의 브랜치를 GitHub 원격 저장소로 업로드합니다.

```bash
git push -u origin feature/{본인이니셜}-{프로젝트명}-{etc}
```

### [5단계] Pull Request(PR) 생성 및 병합
1. GitHub 저장소 상단에 뜨는 `Compare & pull request` 버튼을 클릭합니다.
2. 타깃 브랜치(base: main <- compare: feature/...)를 확인합니다.
3. 작업 내용 요약을 작성한 뒤 **Create pull request**를 누릅니다.
4. 제출 후 검토가 완료되면 **Merge pull request**를 눌러 main에 최종 병합합니다.

## 필수 주의사항 (반드시 읽어주세요)
1. **`main` 브랜치에 직접 Push 금지**: 반드시 개인 브랜치를 생성한 뒤 PR을 통해서만 병합합니다.
2. **본인 폴더 외 수정 금지**
3. **불필요한 빌드 폴더 커밋 주의**: 루트에 `.gitignore`가 설정되어 있으므로, `build/`, `.gradle/` 등의 폴더가 강제로 커밋되지 않도록 확인해주세요.
4. **Merge 완료 후 내 컴퓨터(로컬) `main` 최신화 필수**:
```bash
git checkout main
git pull origin main
```

# Step0. git gui 툴 설치하기
- Xcode 내의 git 기능 사용(화면 상단의 Source Control참고), GitKraken, SourceTree, Github Desktop, Fork 등등 git Gui 툴 종류는 매우 다양합니다. 
- 검색을 통해 자신에게 맞는 gui툴을 설치해 사용해 보는 것을 추천드립니다.
- 이번 **MC2 challenge의 숨겨진 목표** 중 하나입니다!😆

<br/>

# Step1. 새로운 브랜치 생성
아래 예시는 PR 올려보는 것을 연습하는 것이기 때문에 PR_test 브랜치를 기준으로 작성되었습니다.
### 1. PR_test 브랜치에서 New branch 를 생성합니다.
<img src = "Step1_branch생성.png" width = "800" height = "500">

### 2. New branch 명 입력
작성하고자 하는 코드(기능)을 `feat-OO` 으로 지정하여 branch를 생성합니다.

<img src = "Step1_branch명설정.png" width = "800" height = "500">

예시에서는 **feat-joy의PR연습** 으로 브랜치를 생성했는데 각자 feat-OO의PR연습으로 브랜치 생성해서 PR 연습해 보는 것을 추천합니다.

# Step2. 작업하기
- md파일 하나 만들어 보는 것도 좋을 것 같아용.


# Step3. Commit, Push하기
commit, push가 뭔지 모르시는 분은 https://backlog.com/git-tutorial/kr/ 참조하시길 바랍니다.<br/>
<img src = "Step3_commit,push하기.png" width = "800" height = "500">

# Step4. Pull Request 
### 1. PR 버튼 누르기
push까지 하면 원래 저장소에 아래 사진처럼 노란색 칸처럼 어떤 push가 있엇다와 **compare & pull request**란 초록색 버튼이 활성화된 것을 확인할 수 있습니다. 초록 버튼 클릭 후 이동
<br/>
<img src = "Step4_PR버튼 누르기.png" width = "800" height = "400">


### 2. PR template에 따라 작성하기
<img src = "Step4_PRtemplate에 따라 작성하기.png" width = "800" height = "500">
<br/>

- PR Template(작업 주제, 구현 사항, 궁금한 점 & 성장 포인트) 를 기록한 후 Create pull request합니다. (아래 캡처 사진 확인)
- 주의 사항❗️: **base**가 내가 머지하고자 하는 브랜치로 잘 되어있는지 꼭!꼭!꼭! 확인하시길 바랍니다!(현재 예시에서는 feat-joy의 PR연습 브랜치에서 PR_test로 머지하는 거라 base가 PR_test임을 확인할 수 있습니다.)  

# Step5. Review 받기
<!-- <img src = "Step5_생성된PR확인.png" width = "800" height = "400"> -->
<img src = "https://github.com/DeveloperAcademy-POSTECH/MC2-Team10-AlphaCar/blob/main/Rules/Step5_%EC%83%9D%EC%84%B1%EB%90%9CPR%ED%99%95%EC%9D%B8.png?raw=true" width = "800" height = "400">
<br/>

- 최소 2명 이상의 approve를 받아야 develop(예시에서는 PR_test브랜치)에 머지할 수 있습니다.
- 팀원 중 누군가 PR를 올렸다면 카톡에 공유하고, 나머지 팀원들은(리뷰어)는 최대한 12시간 안에는 꼭 확인해 주세요!

# Step6. Merge하기
<!-- <img src = "Step6_머지하기.png" width = "800" height = "400"> -->
<img src = "https://github.com/DeveloperAcademy-POSTECH/MC2-Team10-AlphaCar/blob/main/Rules/Step6_%EB%A8%B8%EC%A7%80%ED%95%98%EA%B8%B0.png?raw=true" width = "800" height = "400">
<br/>

- 만약 merge conflict이 생겼다면 한 줄 한 줄 맞추어 가며 에러를 해결하거나 다른 팀원에게 도움을 요청해 주세요.

# Step7. Merge된 브랜치는 삭제하기

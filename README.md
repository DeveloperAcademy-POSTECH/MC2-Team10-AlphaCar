# 소개
Apple Developer Academy MC2 - 🌓 알파카 팀🦙의 레포지토리입니다.<br/>
'아이들이 그 날의 이야기를 다양한 컨텐츠로 재미있게 표현할 수 있는 이야기 놀이터' 란 주제로 만든 앱입니다. <br/>
🔗 앱스토어 링크: https://apps.apple.com/app/sagaksagak/id6448937856
 <br/>
 
# 개발 환경
- UI: SwiftUI
- 디자인 패턴: Coordinator pattern (화면 전환)
- 의존성 관리 도구: Swift Package Manager
- Apple Resource: AVKit
 <br/>

# 팀원
|박지영|신정연|채영민|박리라|나경빈|박세빈|
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|[Joy](https://github.com/JYPjoy)|[Madeline](https://github.com/MADElinessss)|[Noel](https://github.com/yeongminChae)|[Nova](https://github.com/lil-prime01)|[Theo](https://github.com/ngbeen)|[Binu](https://github.com/SEBIN-PARK)|
<br/>

# 화면 소개
<img width="898" alt="스크린샷 2023-08-17 오전 12 58 16" src="https://github.com/JYPjoy/MC2-Team10-AlphaCar/assets/84610593/b2975353-ca88-4684-ba28-849d3613a476">



# 규칙
## 코딩 컨벤션
코드는 
[Swift API Design Guidelines](https://cozzin.gitbook.io/swift-api-design-guidelines/) 에 따라 작성합니다. 

## 브랜치 전략
- `main` : 제품을 배포하는 브랜치입니다.
- `develop` : 개발자들이 작업한 코드를 합치는 브랜치입니다.
- `feat - 기능명` : 각각의 기능을 수행하는 브랜치입니다.

<img src = "./Rules/gitbranch.png" width = "600" height = "400">
<br/>

## commit 메시지 규칙

|커밋 타입|기능|사용 예시|
|:---|:---|:----|
|✨ feat  |새로운 기능 추가|✨ feat: 화면 전환 기능을 추가했습니다.|
|🐛 fix  |버그 수정|🐛 fix: 메인 화면에서 스크롤이 작동하지 않는 문제를 해결했습니다.|
|♻️ refactor|리팩터링|♻️ refactor: MVC로 된 구조를 MVVM 구조로 리팩토링 했습니다.|
|💄 style  |코드 의미에 영향이 없는 변경 사항|💄 style: print문 뒤에 오타난 ;를 제거하였습니다.|
|📝 docs|문서 수정|📝 docs: readme 파일을 수정하였습니다.|
|✅ test|테스트 코드 작성|✅ test: 테스트 코드를 작성해 수행하였습니다.|
|🚚 chore|기타 사항|🚚 chore: Info.plist에 push notification과 관련된 설정을 변경하였습니다.|

## 코드 리뷰 방법
- 최소 2명 이상의 approve를 받아야 develop에 머지할 수 있습니다.
- 팀원 중 누군가 PR를 올렸다면 **카톡**에 공유하고, 나머지 팀원들은(리뷰어)는 최대한 **12시간** 안에는 꼭 확인해 주세요! 
- PR 올리는 방법 → [PR 올리는 방법](./Rules/PR올리는법.md) 
- PR Template ➡️ [PR template](./Rules/PR_template.md) 


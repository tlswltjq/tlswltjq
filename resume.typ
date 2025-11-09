#set page(width: 210mm, height: 297mm, margin: 20mm)

// ----------------------
// 스타일 정의
// ----------------------
#let title(txt) = text(txt, weight: "bold", size: 14pt)
#let hrule = line(length: 100%, stroke: 1pt + gray)
#let greeting(txt) = [
  #text(weight: "bold", size: 12pt)[#txt]
  #v(0.8em)
]
#set text(font: "Pretendard")

// ----------------------
// 개인정보 (3열)
// ----------------------
#let personal_info(phone, email, github) = grid(
  columns: 3,
  column-gutter: 1em,
  align: center,
  [#phone], [#email], [#github],
)

// ----------------------
// 자기소개
#let introduction(content) = [
  #title("자기소개")
  #hrule
  #content
  #v(0.8em)
]

// ----------------------
#let project_block(proj_title, org, team, period, tech, desc) = [
  #grid(
    columns: (1fr, 3fr),
    column-gutter: 2em,

    align(left)[
      #text(weight: "bold", 1.1em)[#proj_title]
      #v(0.2em)
      #text(weight: "bold", 1.1em)[#org]
      #v(0.8em)

      #set text(size: 0.9em)
      #box([
        인원: #h(0.5em) #team \
        기간: #h(0.5em) #period \
        기술: #h(0.5em) #tech
      ])
    ],

    align(left)[
      #desc
      #v(0.8em)
    ],
  )
]

#let projects(..blocks) = [
  #title("프로젝트")
  #hrule
  #for block in blocks.pos() [
    #block
    #v(0.8em)
  ]
]

// ----------------------
// 교육
#let education_item(program, institution, period, desc) = [
  #program — #institution \
  #emph(period) \
  #desc
]

#let education(..items) = [
  #title("교육")
  #hrule
  #for item in items.pos() [
    #item
    #v(0.8em)
  ]
]

// ----------------------
// 자격증
#let certificate_item(name, date, issuer) = [
  #name — #issuer \
  #emph(date)
]

#let certificates(..items) = [
  #title("자격증")
  #hrule
  #for item in items.pos() [
    #item
    #v(0.5em)
  ]
]

// ----------------------
// 실제 내용
// ----------------------
#greeting([
  = 바로 투입될 준비가 되어있는 개발자\ 신지섭입니다.
])

#personal_info("(+82) 10-6619-9035", "wltjq1203@icloud.com", "github.com/tlswltjq")

#introduction([
  == 마지막 학기를 호주에서 영어 수업과 인턴십을 병행하며, 수·출입 지원서 관리 플랫폼을 직접 개발했습니다.
  언어 장벽 속에서도 요구사항 분석부터 구현, 수정까지 전 과정을 반복하며 실제 서비스 개발 프로세스를 익혔습니다. \
  이를 통해 단순한 기능 구현을 넘어 업무 흐름을 이해하고 협업으로 문제를 해결하는 역량 을 키웠습니다. \
  최근에는 부트캠프를 수료하며 네 번의 협업 프로젝트를 진행했고, 마지막 팀 프로젝트로 우수상을 수상했습니다.

  == 기술적 문제를 구조적으로 해결하는 개발자입니다.
  - 대용량 영상 업로드 과정에서 발생 가능한 서버 병목을 사전에 방지하기 위해 Presigned URL 을 적용해 I/O 부하를 분산했습니다.
  - CPU 부하가 큰 트랜스코딩 작업은 이벤트 기반 워커 컨테이너 로 분리하여 안정적인 처리를 설계했습니다.

  == 새로운 문제에 직면했을 때, 지속 가능한 해결책을 설계합니다.
  - WebSocket 세션에서 인증 객체가 유지되지 않는 문제를 분석하고, HandshakeInterceptor와 ChannelInterceptor 를 이용한 전용 인증 로직을 설계했습니다.
  - 이를 통해 실시간 기능에서도 REST API와 동일한 인증 구조를 유지하며, 재사용 가능한 인증 체계 를 구축했습니다.

  == 팀의 기술적 문제를 함께 해결하며 개발 효율을 높였습니다.
  - 복잡한 도메인 설계로 어려움을 겪던 팀원을 도와 서비스 계층을 분리하고 책임을 명확히 하는 방향 으로 문제를 해결했습니다.
  - 단위 테스트 경험이 부족한 팀원들과 MockMvc, JUnit 개념을 공유 하며 테스트 구조를 개선해 전체 코드 품질을 높였습니다.
])

#projects(
  project_block(
    "JobMate\nIT 진로 탐색 및 멘토링 서비스",
    "백엔드 데브코스 팀 프로젝트",
    "5명",
    "2025.09 - 2025.10",
    "Spring Boot, MySQL, AWS, Docker",
    [
      == 이벤트 기반 영상 업로드 및 트랜스코딩 파이프라인 설계
      === 기술 : FFmpeg, Python, S3/MinIO, Docker, Kafka
      - 영상 게시글 업로드 시 발생할 수 있는 서버 스레드 점유와 대역폭 낭비 문제를 예방 하기 위해 구조를 설계했습니다.
      - Presigned URL 로 사용자가 직접 업로드하도록 하여 서버의 I/O 부하를 분산했습니다.
      - FFmpeg 파이프라인 을 별도 워커 컨테이너(Python)에서 비동기로 수행하고, Spring 서버는 메타데이터와 상태 관리만 담당하도록 역할을 분리했습니다.
      - 모든 과정은 Kafka 이벤트 메시지 기반으로 비동기 제어되며, 안정적인 트랜스코딩 흐름을 보장했습니다.
      - 결과적으로 대용량 영상 처리 중에도 서버 성능 저하 없이 안정적인 서비스 제공이 가능해졌습니다.

      == WebSocket 인증 세션 관리 개선
      === 기술 : WebSocket, Spring Security
      - 실시간 멘토링 기능 개발 중 WebSocket 세션에서 인증 객체가 유지되지 않는 문제를 발견했습니다.
      - HandshakeInterceptor와 ChannelInterceptor를 활용해 인증 객체를 세션에 저장·복원하는 구조를 구현했습니다.
      - 이를 통해 REST API와 동일한 인증 흐름을 WebSocket에서도 유지하며, 채팅 및 화면공유 기능의 안정성을 확보했습니다.

      == 개발 지연 대처 및 구성요소 모듈화
      === 기술 : AWS S3, SNS, EC2, Docker
      - AWS 계정 지급이 지연되어 S3 버킷 구성이 불가능한 상황에서, 임시로 MinIO를 Docker Compose로 구성해 개발 일정을 유지했습니다.
      - 이후 운영 단계에서 Presigned URL이 `localhost:9000`으로 반환되는 문제를 직접 분석해 endpointOverride 설정 문제를 해결했습니다.
      - 장기적 유지보수를 고려해 S3 + SNS 이벤트 브릿지 구조로 전환, 객체 생성 이벤트를 비동기로 수신하도록 개선했습니다.
      - 이를 통해 MinIO 기반 개발과 AWS 전환 간의 호환성을 확보하며, 일정 지연 없이 안정적으로 개발을 진행 했습니다.
    ],
  ),
  project_block(
    "수·출입 지원서\n관리 플랫폼",
    "Norwegian Australian Chamber of Commerce (NACC)",
    "2명",
    "2024.10 - 2024.12",
    "Spring Boot, Vue",
    [
      == 수·출입 지원서 관리 기능
      - multipart/form-data로 제출된 데이터를 회사·사용자·상품 양식에 맞춰 저장하고, 조건별 검색 기능을 JPA로 구현했습니다.
      - 저장된 지원서를 CSV·Excel 형식으로 내보낼 수 있도록 Apache POI와 OpenCSV를 활용했습니다.

      == 뉴스레터 발송 기능
      - Spring Boot Mail Starter와 SMTP를 이용해 뉴스레터 일괄 발송 기능을 구현했습니다.

      == 어드민 페이지 구현
      - Spring Security 기반의 인증·인가를 적용해 관리자 전용 기능 접근을 제어했습니다.
    ],
  ),
  project_block(
    "SafeCare\n그룹 알림 서비스",
    "영진전문대학교",
    "5명",
    "2024.04 - 2024.06",
    "Spring Boot, Vue",
    [
      = 개요
      사용자가 지정한 스케줄에 따라 음성 메시지를 포함한 푸시 알림을 자동 발송하는 서비스입니다.

      == 스케줄링 및 푸시 알림 발송
      - 사용자가 입력한 제목, 본문, 음성 파일을 FCM(Firebase Cloud Messaging)을 통해 발송했습니다.
      - 발송 주기를 CRON 표현식으로 테이블에 저장하고, Quartz 스케줄러를 통해 주기적으로 실행되도록 관리했습니다.
      - 스케줄러가 실행될 때 수신자를 실시간 조회하여 푸시 알림을 발송하도록 설계했습니다.

      == 그룹 Job 관리 구조 개선
      - 초기에는 그룹원별로 개별 Job을 등록했으나, 그룹 변경 시 관련 Job 전체를 수정해야 하는 비효율이 있었습니다.
      - 이를 해결하기 위해 발송 유형(개인/그룹) 기준으로 Job을 등록하고, 실행 시점에 수신자를 동적으로 조회하도록 구조를 변경했습니다.
      - 그 결과, 스케줄 관리 로직이 단순화되고 그룹원 변동에도 안정적으로 대응 가능한 구조를 확보했습니다.

      == CI/CD 자동화 및 AWS S3 연동
      - GitHub Actions와 AWS CodeDeploy를 이용해 CI/CD 파이프라인을 구축 했습니다.
      - 코드 푸시 시 자동 빌드·테스트·배포가 수행되도록 구성해 배포 과정의 반복 작업을 줄였습니다.
      - 음성 파일은 AWS S3에 저장하여 푸시 알림 수신 시 앱에서 바로 재생할 수 있도록 구현했습니다.
    ],
  ),
)

#education(
  education_item(
    "백엔드 데브코스",
    "프로그래머스",
    "2025.05 - 2025.10",
    "프로그래머스에서 진행하는 백엔드 개발자 과정 부트캠프입니다. 부트캠프중 4번에 걸친 프로젝트 협업을 통해 원만한 협업능력과 개발능력을 함양하였습니다",
  ),
  education_item(
    "영진전문대학교",
    "컴퓨터 정보계열, 전문학사",
    "2020.03 - 2025.03",
    "기초적인 컴퓨터 지식을 배우고, 다양한 프레임워크를 통한 웹 프로젝트를 수행해 주도적으로 부족한 부분을 탐구하고 매꿨습니다.",
  ),
  education_item(
    "글로벌 인턴십",
    "TAFE NSW",
    "2024.09 - 2024.12",
    "General English Course 를 통해 실무에 필요한 비즈니스 영어를 집중 학습하고 Dubai Chamber의 임원과 SpringBoot 기반의 공급자 지원서 제출 및 관리 웹 서비스 개발하였습니다.",
  ),
  education_item(
    "단기 해외 연수",
    "Box Hill Institute",
    "2024.01 - 2024.02",
    "Short Term Study Tour를 통해 영어의 기초를 다듬고 네트워크, 리눅스 기초학습, TerraForm을 통한 네트워크 실습을 진행했습니다",
  ),
  education_item(
    "스마트 웹 & 콘텐츠 개발자 양성과정",
    "예담 직업 전문학교",
    "2018.05 - 2018.11",
    "프로그래밍과 웹에 대한 기초지식을 습득하였습니다.",
  ),
)

#certificates(
  certificate_item("SQLD", "2024.09", "한국데이터산업진흥원"),
)

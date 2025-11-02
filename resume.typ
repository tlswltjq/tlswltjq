#set page(width: 210mm, height: 297mm, margin: 20mm)

// ----------------------
// 스타일 정의
// ----------------------
#let title(txt) = text(txt, weight: "bold", size: 14pt)
#let hrule = line(length: 100%, stroke: 1pt + gray)
#let greeting(txt) = text(txt, weight: "bold", size: 12pt)

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
#greeting("안녕하세요. 문제를 빠르게 파악하고 현실적인 기술적 대안을 제시하는 개발자 신지섭입니다.")

#personal_info("(+82) 10-6619-9035", "wltjq1203@icloud.com", "github.com/wltjq1203")

#introduction([
  저는 짧고 함축된 예쁜 코드를 추구했지만, \
  프로젝트를 거듭하며 유지보수성과 구조적 안정성이 더 큰 가치를 만든다는 것을 깨달았습니다. \
  최근에는 안정적인 시스템 설계와 실용적인 기술 선택에 집중하고 있습니다.
])

#projects(
  project_block(
    "JobMate\nIT진로 탐색 및 멘토링 서비스",
    "백엔드 데브코스 팀 프로젝트",
    "2명",
    "2025.05 - 2025.10",
    "Spring Boot, MySQL, AWS, Docker",
    [
      == 이벤트기반 영상 업로드, 트랜스코딩, 상태관리 파이프 라인 설계
      === 기술 : FFmpeg, python, S3/MinIo, Docker, Kafka
      - 뉴스 게시글에 영상을 첨부하는 기능을 구현하면서, 대용량 파일 업로드와 트랜스코딩 과정에서 발생하는 서버 스레드 점유와 네트워크 대역폭 낭비 문제를 인식하고, 이를 고려한 구조를 설계했습니다.

      - 우선 Presigned URL을 사용해 사용자가 직접 업로드하도록 하여 서버의 I/O부하를 제거하였습니다. 이후 FFmpeg 기반의 트랜스코딩 파이프라인을 구축했습니다.

      - FFmpeg를 수행하는 스크립트는 Python으로 작성하고 워커 컨테이너로 실행시켜 CPU, 메모리 사용량이 많은 작업을 스프링 외부에서 처리하고 스프링 서버는 메타데이터 관리와 진행 상태 기록을 담당하도록 했습니다.

      - 일련의 과정은 메시지 이벤트로 제어되어 비동기로 진행되도록 구성했습니다.

      - 이 구조를 통해 서버의 I/O부하를 제거하고, 업로드-트랜스코딩-상태 관리를 자동화한 파이프라인을 구성할 수 있었습니다.

      - 결과적으로 영상처리에 의한 중단 없이 안정적인 서비스 제공이 가능해졌습니다.

      == 웹소켓 세션에서 인증객체 유실문제 해결
      === 기술 :  Websocket, SpringSecurity
      - 온라인으로 멘토링을 진행할 수 있도록 하는 기능을 개발 중, 실시간 통신 과정에서 웹소켓 세션이 Spring Security 인증 객체를 유지하지 못하는 문제가 발생했습니다.

      - 이를 해결하기 위해 웹소켓 전용 인증로직을 새로 구현했습니다.

      - HandshakeInterceptor에서 HTTP 요청 헤더에서 토큰을 추출해 저장하고, ChannelInterceptor에서 세션 생성 시 인증 객체를 복원하도록 처리했습니다

      - 결과적으로 웹소켓 통신에서도 REST API와 동일한 인증 구조를 유지할 수 있었고, 멘토링 중 화면공유·채팅 기능의 사용자 인증이 안정적으로 동작했습니다.

      == 프로젝트 개발 지연 대처 및 구성요소 모듈화 및 교체 경험
      === 기술 : AWS S3, SNS, Ec2, Docker

      - AWS 계정 지급 지연으로 인해 영상 처리용 S3 버킷 구성이 늦어져 프로젝트 일정이 중단될 위험이 있었습니다.

      - 비용과 설정 제약이 있는 Cloudflare R2 대신, 빠르게 로컬에 구성 가능한 MinIO를 Docker Compose로 설정하여 개발을 선행했습니다.

      - 이후 운영 단계에서 Presigned URL이 localhost:9000으로 반환되는 문제를 발견했습니다.

      - 문제의 원인은 Presigned URL 생성 시 localhost가 반환되도록 설정된 endpointOverride 값이었습니다.

      - MinIO 환경에서는 S3Presigner 객체 생성 시 endpointOverride를 명시하여 임시로 문제를 해결할 수 있었지만, 운영 도메인이 정해지지 않아 장기적인 유지보수에는 적합하지 않았습니다.

      - 이에 S3로 전환하고, SNS와 HTTP 이벤트 브릿지 컨테이너 구성을 통해 객체 생성 이벤트를 비동기로 수신하도록 구성했습니다.

      - MinIO 기반으로 개발 일정을 유지하면서도, 이후 S3로 자연스럽게 교체 가능한 구조를 완성했습니다.
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

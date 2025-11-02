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
      === FFmpeg, python, S3/MinIo, Docker, Kafka
      - 뉴스 게시글에 영상을 첨부하는 기능을 구현하면서, 대용량 파일 업로드와 트랜스코딩 과정에서 발생하는 서버 스레드 점유와 네트워크 대역폭 낭비 문제를 인식하고, 이를 고려한 구조를 설계했습니다.

      - 우선 Presigned URL을 사용해 사용자가 직접 업로드하도록 하여 서버의 I/O부하를 제거하였습니다. 이후 FFmpeg 기반의 트랜스코딩 파이프라인을 구축했습니다.

      - FFmpeg를 수행하는 스크립트는 Python으로 작성하고 워커 컨테이너로 실행시켜 CPU, 메모리 사용량이 많은 작업을 스프링 외부에서 처리하고 스프링 서버는 메타데이터 관리와 진행 상태 기록을 담당하도록 했습니다.

      - 일련의 과정은 메시지 이벤트로 제어되어 비동기로 진행되도록 구성했습니다.

      - 이 구조를 통해 서버의 I/O부하를 제거하고, 업로드-트랜스코딩-상태 관리를 자동화한 파이프라인을 구성할 수 있었습니다.

      - 결과적으로 영상처리에 의한 중단 없이 안정적인 서비스 제공이 가능해졌습니다.
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

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
  [#phone], [#email], [#github]
)

// ----------------------
// 자기소개
#let introduction(content) = [
  #title("자기소개")
  #hrule
  #content
]

// ----------------------
// 프로젝트 블록
#let project_block(org, proj_title, team, period, tech, desc) = [
  #grid(
    columns: (1fr, 3fr),
    column-gutter: 2em,
    
    align(left)[
      #text(weight: "bold", 1.1em)[#proj_title]\
      #text(weight: "bold", 1.1em)[#org]
      #v(0.5em)
      
      #set text(size: 0.9em)
      #box([
        인원: #h(0.5em) #team \
        기간: #h(0.5em) #period \
        기술: #h(0.5em) #tech
      ])
    ],
    
    align(left)[
      #desc
    ]
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
    "프로그래머스",
    "JobMate \ IT진로 탐색 및 멘토링 서비스",
    "2명",
    "2025.05 - 2025.10",
    "Spring Boot, MySQL, Bootstrap, Apache POI",
    [
      == 이벤트기반 영상 업로드, 트랜스코딩, 상태관리 파이프 라인 설계

      - Spring Boot 기반 수출입 Supplier 관리 시스템을 개발했습니다.
      - 뉴스레터 발송, CSV/Excel 내보내기, 첨부 파일 처리 기능을 구현했습니다.
   ]
  )
)

#education(
  education_item("백엔드 데브코스", "프로그래머스", "2025.05 - 2025.10", "프로그래머스에서 진행하는 백엔드 개발자 과정 부트캠프입니다. 부트캠프중 4번에 걸친 프로젝트 협업을 통해 원만한 협업능력과 개발능력을 함양하였습니다"),
  education_item("영진전문대학교", "컴퓨터 정보계열, 전문학사", "2020.03 - 2025.03", "기초적인 컴퓨터 지식을 배우고, 다양한 프레임워크를 통한 웹 프로젝트를 수행해 주도적으로 부족한 부분을 탐구하고 매꿨습니다."),
  education_item("글로벌 인턴십", "TAFE NSW", "2024.09 - 2024.12", "General English Course 를 통해 실무에 필요한 비즈니스 영어를 집중 학습하고 Dubai Chamber의 임원과 SpringBoot 기반의 공급자 지원서 제출 및 관리 웹 서비스 개발하였습니다."),
  education_item("단기 해외 연수", "Box Hill Institute", "2024.01 - 2024.02", "Short Term Study Tour를 통해 영어의 기초를 다듬고 네트워크, 리눅스 기초학습, TerraForm을 통한 네트워크 실습을 진행했습니다"),
  education_item("스마트 웹 & 콘텐츠 개발자 양성과정", "예담 직업 전문학교", "2018.05 - 2018.11", "프로그래밍과 웹에 대한 기초지식을 습득하였습니다.")
  
)

#certificates(
  certificate_item("SQLD", "2024.09", "한국데이터산업진흥원")
)
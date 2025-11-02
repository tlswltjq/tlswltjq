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
#let personal_info(phone, email, github) = table(
  columns: 3,
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
#let project_block(org, team, proj_title, period, tech, desc) = [
  #grid(
    columns: (1fr, 3fr),
    // 열 사이의 간격
    column-gutter: 2em,
    
    // ⬇️ 좌측 칼럼 내용 (3fr) 
    align(left)[
      // 프로젝트 제목
      #text(weight: "bold", 1.1em)[#proj_title]
      #v(0.5em)
      
      // 기타 정보 (팀원, 기간, 기술 스택)
      #set text(size: 0.9em)
      // 마크업 블록으로 감싸서 오류 해결
      #box([
        // org와 team을 한 줄로 표시
        text(weight: "bold")[인원:] #h(0.5em) #team \
        text(weight: "bold")[기간:] #h(0.5em) #period \
        text(weight: "bold")[기술:] #h(0.5em) #tech
      ])
    ],
    
    // ⬇️ 우측 칼럼 내용 (7fr)
    align(left)[
      #desc // 상세 설명 내용
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
    "JobMate",
    "2명",
    "IT 진로 탐색 및 멘토링 서비스",
    "2025.05 - 2025.10",
    "Spring Boot, MySQL, Bootstrap, Apache POI",
    [
      Spring Boot 기반 수출입 Supplier 관리 시스템을 개발했습니다. \
     뉴스레터 발송, CSV/Excel 내보내기, 첨부 파일 처리 기능을 구현했습니다.
   ]
  )
)

#education(
  education_item("TAFE English Course", "TAFE NSW", "2024.03 - 2024.10", "English Communication & Workplace Skills"),
  education_item("Software Engineering Bootcamp", "CodeStates", "2023.01 - 2023.06", "Spring Boot 기반 웹 백엔드 개발 교육 수료")
)

#certificates(
  certificate_item("정보처리기사", "2023.06", "한국산업인력공단"),
  certificate_item("TOEIC 890", "2024.07", "ETS")
)
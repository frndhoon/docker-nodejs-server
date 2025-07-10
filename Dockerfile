# 노드 이미지 사용 (Node.js 설치)
FROM node:20-slim

# 작업 디렉토리 설정
WORKDIR /app

# 현재 디렉토리의 모든 파일을 이미지 경로에 복사
COPY . .

# RUN npm install # package.json 설치 (/bin/sh -c npm install 실행이기 때문에 호환성 문제가 있을 수 있음)

# package.json 설치
RUN ["npm", "install"] 

# 포트 노출
EXPOSE 8080

# 서버 실행 (CMD는 마지막 명령어)
CMD ["node", "server.js"]
# 노드 이미지 사용 (Node.js 설치)
FROM node:20-slim

# 작업 디렉토리 설정
WORKDIR /app

# 현재 디렉토리의 package.json 파일을 먼저 이미지 경로에 복사
COPY package*.json .

# RUN npm install # package.json 설치 (/bin/sh -c npm install 실행이기 때문에 호환성 문제가 있을 수 있음)

# package.json 설치 (캐싱이 잘 돼있기 때문에 빠름)
# npm ci는 package-lock.json 기준으로 설치
RUN ["npm", "install"] 

# 현재 디렉토리의 모든 파일을 이미지 경로에 복사
COPY . .
# 포트 노출
EXPOSE 8080

# 노드 사용자로 실행 (노드 사용자는 루트 권한이 없으니 좀 더 안전함)
# node는 FROM 명령어에서 지정한 이미지의 사용자
USER node

# 서버 실행 (CMD는 마지막 명령어)
CMD ["node", "server.js"]
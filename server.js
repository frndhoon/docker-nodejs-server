const express = require('express'); // express 모듈 불러오기
const app = express();

app.listen(8080, () => { // 서버 실행
  console.log('server is running http://localhost:8080');
});

app.get('/', (req, res) => { // 메인페이지 방문 시 'hi' 메시지 전달
  res.send('hi');
}); 
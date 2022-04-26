const http = require('http')

const server = http.createServer((req, res) => {
  res.writeHead(200, {
    'Content-Type': 'application/json'
  })
  res.end(JSON.stringify({ hello: 'world' }))
})

server.listen(process.env.PORT, () => {
  console.log('listening on port', process.env.PORT)
})

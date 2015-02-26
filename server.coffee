env        = require "node-env-file"
express    = require "express"
bodyParser = require "body-parser"
Pusher     = require "pusher"

app = express()

try
  env "#{__dirname}/.env"
catch error
  console.log error

pusher = new Pusher(
  appId: process.env.PUSHER_APP_ID
  key: process.env.PUSHER_KEY
  secret: process.env.PUSHER_SECRET
)

app.use bodyParser.urlencoded(extended: true)
app.set "port", (process.env.PORT or 5000)

app.post "/", (request, response) ->
  pusher.trigger "drone", "command",
    message: request.body.Body
  response.end()

app.listen app.get("port"), ->
  console.log "Node app is running at localhost:" + app.get("port")

env    = require "node-env-file"
Drone  = require "rolling-spider"
repl   = require "repl"
Pusher = require "pusher-client"

try
  env "#{__dirname}/.env"
catch error
  console.log error

drone = new Drone(process.env.UUID)

drone.connect ->
  console.log 'Connected'
  drone.setup ->
    console.log 'setup'
    drone.startPing()
    socket = new Pusher(process.env.UUID)
    channel = socket.subscribe('drone')
    channel.bind 'command', (data) ->
      switch data.message.toLowerCase()
        when 'takeoff'
          drone.takeOff()
        when 'land'
          drone.land()
        when 'flip'
          drone.frontFlip()
        when 'up'
          drone.up()
        when 'down'
          drone.down()
        when 'left'
          drone.tiltRight()
        when 'right'
          drone.tiltRight()

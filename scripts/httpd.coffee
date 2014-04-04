# Description:
#   A simple interaction with the built in HTTP Daemon
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /hubot/version
#   /hubot/ping
#   /hubot/time
#   /hubot/info
#   /hubot/ip

spawn = require('child_process').spawn
Util = require 'util'

module.exports = (robot) ->

  robot.router.post "/say", (req, res) ->
    what = req.body.param
    # res.end what
    robot.send "Samuel L Hubot", ""+what+" Motherfucker!"
    res.end "Done."

  robot.router.get "/hubot/version", (req, res) ->
    # res.end robot.version
    robot.respond "bla bla bla"
    # messsage = new Message("bla");
    # msg.send "bla bla bla"
    # res.send "bla bla bla"
    robot.send "Samuel L Hubot", "bla bla Motherfucker!"
    res.end robot.version

  robot.router.post "/hubot/ping", (req, res) ->
    res.end "PONG"

  robot.router.get "/hubot/time", (req, res) ->
    res.end "Server time is: #{new Date()}"

  robot.router.get "/hubot/info", (req, res) ->
    child = spawn('/bin/sh', ['-c', "echo I\\'m $LOGNAME@$(hostname):$(pwd) \\($(git rev-parse HEAD)\\)"])

    child.stdout.on 'data', (data) ->
      res.end "#{data.toString().trim()} running node #{process.version} [pid: #{process.pid}]"
      child.stdin.end()

  robot.router.get "/hubot/ip", (req, res) ->
    robot.http('http://ifconfig.me/ip').get() (err, r, body) ->
      res.end body

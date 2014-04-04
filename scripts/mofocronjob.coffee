mainrobot = null
times = 1

module.exports = (robot) ->
  mainrobot = robot

  cronJob = require('cron').CronJob
  new cronJob('*/1 * * * * *', saySomethingEveryMinute, null, true)
  robot.send "Samuel L Hubot", "CronJob set up successfully Motherfucker!"
  robot.send "Samuel L Hubot", "CronJob set up successfully Motherfucker!"
  robot.send "Samuel L Hubot", "CronJob set up successfully Motherfucker!"
  robot.send "Samuel L Hubot", "CronJob set up successfully Motherfucker!"
  robot.send "Samuel L Hubot", "CronJob set up successfully Motherfucker!"


saySomethingEveryMinute = ->
  mainrobot.send "Samuel L Hubot", "Insulted you "+times+" times already Motherfucker"
  times = times + 1

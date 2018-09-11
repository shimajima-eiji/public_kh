require 'slack'

TOKEN = '(your token)'
MESSAGE = 'TEST!'
CHANNEL = '#general'

Slack.configure {|conf| conf.token = TOKEN }
Slack.chat_postMessage(text: MESSAGE, channel: CHANNEL)
__EOS__

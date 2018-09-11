require 'slack'

TOKEN = '(your token)'
Slack.configure {|conf| conf.token = TOKEN }
Slack.chat_postMessage(text: 'TEST!', channel: '#general')
__EOS__

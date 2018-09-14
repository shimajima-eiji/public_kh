# coding: utf-8
import gmail

# Login to Gmail settings
GMAIL_USER = '(user)'
GMAIL_PASS = '(pass)'

# Mail parameter
TOADDR = '(slackbot)@(your workspace).slack.com)'

subject = '日本語'  # Japanese
body = 'メッセージ\n改行も'  # Message, and new line
message = gmail.Message(subject, to=TOADDR , text=body)

# send mail
client = gmail.GMail(GMAIL_USER , GMAIL_PASS)
client.send(message)
client.close()

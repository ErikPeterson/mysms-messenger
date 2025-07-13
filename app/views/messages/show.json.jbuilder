json.message do 
	json.content @message.content
	json.phone_number @message.phone_number
	json.sent_at @message.sent_at
	json.sent @message.sent
	json.sid @message.sid
	json.user @message.user, :email
end
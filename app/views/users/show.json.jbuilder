json.user do 
	json.email @user.email
	json.created_at @user.created_at
	json.updated_at @user.updated_at

	json.messages @user.messages, :content, :sent_at, :phone_number, :sent, :sid
end
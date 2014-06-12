get '/create_meetup' do
  authenticate!

  erb :create_meetup
end

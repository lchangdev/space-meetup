get '/meetups/:id' do
  authenticate!
  @meetup_details = Meetup.find(params[:id])
  @attendee_details = Attendee.find_by(user_id: current_user.id, meetup_id: params[:id])
  @comment_details = Comment.where(meetup_id: params[:id])

  erb :show
end

post '/meetups/:id' do
  new_attendee = Attendee.create(user_id: current_user.id, meetup_id: params[:id])
  flash[:notice] = "You have now joined this Meetup"

  redirect "/meetups/#{params[:id]}"
end

# DELETE /attendees/:id
post '/meetups/:id/leave' do
  delete_attendee = Attendee.find_by(user_id: current_user.id, meetup_id: params[:id])
  delete_attendee.destroy
  flash[:notice] = "You have now left this Meetup"

  redirect "/meetups/#{params[:id]}"
end

# POST /meetups
post '/create_meetup' do
  new_meetup = Meetup.create(name: params[:name], location: params[:location], description: params[:description])

  flash[:notice] = "Your Meetup has just been posted!"
  redirect "/meetups/#{new_meetup.id}"
end

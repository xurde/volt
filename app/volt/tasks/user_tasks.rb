class UserTasks < Volt::TaskHandler
  # Login a user, takes a username and password

  def login(username, password)
    return store._users.find(username: username).then do |users|
      user = users.first

      match_pass = BCrypt::Password.new(user._hashed_password)
      if match_pass == password
        # TODO: returning here should be possible, but causes some issues
        user_id_hash = BCrypt::Password.create(user._id)

        puts "#{user._id}:#{user_id_hash}"
        # Return user_id:hash on user id
        next "#{user._id}:#{user_id_hash}"
      else
        raise "Password did not match"
      end
    end
  end
end

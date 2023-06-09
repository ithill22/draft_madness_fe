class UserLeaguesFacade
  def create_user_league(ul_details)
    email_user(ul_details[:user_id])
    service.new_user_league(ul_details)
  end

  def email_user(user_id)
    recipient_info = service.get_one_user(user_id.to_i)
    recipient = User.new(recipient_info[:data])
    email_info = {
      friend: recipient.name
    }

    InviteNotifierMailer.notify(email_info, recipient.email).deliver_now
  end

  private

  def service
    @_service ||= DraftMadnessService.new
  end
end

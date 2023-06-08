class InviteNotifierMailer < ApplicationMailer
  def notify(info, recipient)
    @friend = info[:friend]

    mail(
      to: recipient,
      subject: "You've been added to a league!"
      )
  end
end

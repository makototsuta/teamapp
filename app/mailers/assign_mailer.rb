class AssignMailer < ApplicationMailer
  default from: 'from@example.com'

  def assign_mail(email, password)
    @email = email
    @password = password
    mail to: @email, subject: I18n.t('views.messages.complete_registration')
  end

  def send_when_owner_change(team)
    @team = team
    mail to: @team.owner.email, subject: 'リーダー変更通知。'
  end
end

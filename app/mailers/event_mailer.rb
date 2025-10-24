class EventMailer < ApplicationMailer

  def send_mail(group, mail_title, mail_content)
    @group = group
    @mail_title = mail_title
    @mail_content = mail_content

    mail(
      bcc: group.users.pluck(:email), 
      subject: mail_title
    )

    group_users.each do |user|
      Notification.create!(
        user: user,
        notifiable: @group,
        read: false
      )
    end
  end
end

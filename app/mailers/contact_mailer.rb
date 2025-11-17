class ContactMailer < ApplicationMailer
  default to: "MAIL_ADDRESS"

  def send_mail(contact)
    @contact = contact
    mail(
      from: @contact.email,
      subject: '【お問い合わせ】'
    )
  end
end

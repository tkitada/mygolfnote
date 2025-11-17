class ContactMailer < ApplicationMailer
  default to: ENV["MAIL_ADDRESS"]

  def contact_mail(contact)
    @contact = contact
    mail(
      from: @contact.email,
      subject: '【お問い合わせ】' + I18n.t("activerecord.attributes.contact.subject.#{@contact.subject}") 
    )
  end
end

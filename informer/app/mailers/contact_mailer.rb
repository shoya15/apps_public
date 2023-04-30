class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['ACTION_MAILER_ADMIN'], subject: 'Informerお問い合わせ（自動送信）'
  end
end

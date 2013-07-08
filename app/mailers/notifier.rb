class Notifier < ActionMailer::Base
  default from: "webapp@boozeepoque.com"

  def event_inquiry(ei)
    @event_inquiry = ei
    mail(from:    ei.email,
         to:      'pete@boozeepoque.com',
         subject: "[BÉ.com] Event inquiry from #{ei.name}")
  end
end

class SubscribeJob
  # include SuckerPunch::Job

  def perform(email)
    ActiveRecord::Base.connection_pool.with_connection do
      # user = User.find(id)
      list_id = Rails.application.secrets.mailchimp_list_id
      # email = email.email

      begin
        g = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
        g.lists(list_id).members.create(body: {email_address: email, status: "subscribed", merge_fields: {FNAME: "Bob", LNAME: "Smith"}})

        # SubscribeMailer.confirmation_email(user).deliver
      rescue Gibbon::MailChimpError => mce
        # SuckerPunch.logger.error("subscribe failed: due to #{mce.message}")
        raise mce
      rescue Exception => e
        # SuckerPunch.logger.error("subscribe failed: due to #{e.message}")
        raise e
      end
    end
  end

end

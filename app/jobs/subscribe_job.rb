class SubscribeJob
  # include SuckerPunch::Job

  def perform(user_event)
    ActiveRecord::Base.connection_pool.with_connection do
      # user = User.find(id)
      list_id = Rails.application.secrets.mailchimp_list_id
      email = user_event.user_email
      first_name = user_event.first_name
      last_name = user_event.last_name

      begin
        g = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
        g.lists(list_id).members.create(body: {email_address: email, status: "subscribed", merge_fields: {FNAME: first_name, LNAME: last_name}, send_welcome: true})

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

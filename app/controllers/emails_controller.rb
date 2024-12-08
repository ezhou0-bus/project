class EmailsController < ApplicationController
  def index
    matching_emails = Email.all

    @list_of_emails = matching_emails.order({ :created_at => :desc })

    render({ :template => "emails/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_emails = Email.where({ :id => the_id })

    @the_email = matching_emails.at(0)

    render({ :template => "emails/show" })
  end

  def create
    the_email = Email.new
    the_email.receiver_name = params.fetch("query_receiver_name")
    the_email.receiver_email = params.fetch("query_receiver_email")

    if the_email.valid?
      the_email.save
      redirect_to("/emails", { :notice => "Email created successfully." })
    else
      redirect_to("/emails", { :alert => the_email.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_email = Email.where({ :id => the_id }).at(0)

    the_email.receiver_name = params.fetch("query_receiver_name")
    the_email.receiver_email = params.fetch("query_receiver_email")

    if the_email.valid?
      the_email.save
      redirect_to("/emails/#{the_email.id}", { :notice => "Email updated successfully."} )
    else
      redirect_to("/emails/#{the_email.id}", { :alert => the_email.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_email = Email.where({ :id => the_id }).at(0)

    the_email.destroy

    redirect_to("/emails", { :notice => "Email deleted successfully."} )
  end
end

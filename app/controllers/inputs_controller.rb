class InputsController < ApplicationController
  def index
    matching_inputs = Input.all

    @list_of_inputs = matching_inputs.order({ :created_at => :desc })

    render({ :template => "inputs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_inputs = Input.where({ :id => the_id })

    @the_input = matching_inputs.at(0)

    render({ :template => "inputs/show" })
  end

  def create
    the_input = Input.new
    the_input.receiver_name = params.fetch("query_receiver_name")
    the_input.receiver_company = params.fetch("query_receiver_company")
    the_input.receiver_email = params.fetch("query_receiver_email")
    the_input.occasion = params.fetch("query_occasion")
    the_input.topics = params.fetch("query_topics")
    the_input.additional_requests = params.fetch("query_additional_requests")

    if the_input.valid?
      the_input.save
      redirect_to("/inputs", { :notice => "Input created successfully." })
    else
      redirect_to("/inputs", { :alert => the_input.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_input = Input.where({ :id => the_id }).at(0)

    the_input.receiver_name = params.fetch("query_receiver_name")
    the_input.receiver_company = params.fetch("query_receiver_company")
    the_input.receiver_email = params.fetch("query_receiver_email")
    the_input.occasion = params.fetch("query_occasion")
    the_input.topics = params.fetch("query_topics")
    the_input.additional_requests = params.fetch("query_additional_requests")
    the_input.email_body = params.fetch("query_email_body")
    the_input.email_id = params.fetch("query_email_id")

    if the_input.valid?
      the_input.save
      redirect_to("/inputs/#{the_input.id}", { :notice => "Input updated successfully."} )
    else
      redirect_to("/inputs/#{the_input.id}", { :alert => the_input.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_input = Input.where({ :id => the_id }).at(0)

    the_input.destroy

    redirect_to("/inputs", { :notice => "Input deleted successfully."} )
  end
end

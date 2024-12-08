class InputsController < ApplicationController
  def index
    @list_of_inputs = Input.order(created_at: :desc)

    render template: "inputs/index"
  end

  def show
    the_id = params.fetch("path_id")
    @the_input = Input.find_by(id: the_id)

    render template: "inputs/show"
  end

  def create
    the_input = Input.new(
      receiver_name: params.fetch("query_receiver_name"),
      receiver_company: params.fetch("query_receiver_company"),
      receiver_email: params.fetch("query_receiver_email"),
      occasion: params.fetch("query_occasion"),
      topics: params.fetch("query_topics"),
      additional_requests: params.fetch("query_additional_requests")
    )

    if the_input.save
      redirect_to "/inputs", notice: "Input created successfully."
    else
      redirect_to "/inputs", alert: the_input.errors.full_messages.to_sentence
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_input = Input.find_by(id: the_id)

    if the_input.update(
         receiver_name: params.fetch("query_receiver_name"),
         receiver_company: params.fetch("query_receiver_company"),
         receiver_email: params.fetch("query_receiver_email"),
         occasion: params.fetch("query_occasion"),
         topics: params.fetch("query_topics"),
         additional_requests: params.fetch("query_additional_requests"),
         email_body: params.fetch("query_email_body", nil),
         email_id: params.fetch("query_email_id", nil)
       )
      redirect_to "/inputs/#{the_input.id}", notice: "Input updated successfully."
    else
      redirect_to "/inputs/#{the_input.id}", alert: the_input.errors.full_messages.to_sentence
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_input = Input.find_by(id: the_id)

    if the_input&.destroy
      redirect_to "/inputs", notice: "Input deleted successfully."
    else
      redirect_to "/inputs", alert: "Failed to delete input."
    end
  end
end

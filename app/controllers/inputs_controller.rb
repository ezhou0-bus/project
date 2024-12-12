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

    if the_input.valid?
      the_input.save


      # create api response 
      system_message = Message.new 
      system_message.input_id = the_input.id
      system_message.role = "system"
      system_message.body = "You are a Master of Business Administration student at a top US business school. Write a professional and eloquent thank you email to recruiters. Use #{the_input.receiver_name} as the receiver's name in email body, use #{the_input.receiver_company} as the receiver's company in email body. Incorporate #{the_input.occasion} as reference for the occasion of interaction between the user and the receiver. Use #{the_input.topics} as reference for conversation topics covered between the user and the receiver and express gratitude for specific learnings. Use #{the_input.additional_requests} as reference for potential requests to receiver to include in the email body. Replace all transition words and conjunctions in the sentences with the most basic and commonly used ones. Use simple expressions, avoiding complex vocabulary. Ensure the logical connections between sentences are clear."
      # call api to get message 


      redirect_to "/inputs/#{the_input.id}", notice: "Input created successfully."
    else
      redirect_to "/inputs#{the_input.id}", alert: the_input.errors.full_messages.to_sentence
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

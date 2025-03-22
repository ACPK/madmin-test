class MessageTemplatesController < ApplicationController
  def show
    @template = MessageTemplate.find(params[:id])
    render partial: "messages/preview", locals: { template: @template }
  end
end
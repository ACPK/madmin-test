class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :ensure_user_is_logged_in, only: %i[ index ]
  allow_unauthenticated_access only: [:index]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    # @message = Current.user.messages.new(message_params)
    @message = Message.new(message_params)
    @message.encrypted_user_id = Current.user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy!

    respond_to do |format|
      format.html { redirect_to messages_path, status: :see_other, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def ensure_user_is_logged_in
      # If the user isn't logged in
      if Current.user.nil?
        # Try to find the user with ID = 1
        user = User.find_by(email_address: 'admin@example.com')

        if user
          # If the user exists, log them in
          start_new_session_for user
        else
          # If the user doesn't exist, create them
          user = User.create!(email_address: 'admin@example.com', password: 'password123', password_confirmation: 'password123')
          Message.create(title: "hello world", content: '<p>this is the body</p>', encrypted_user_id: user.id)
          start_new_session_for user
        end
      end
    end

    def set_message
      @message = Message.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.expect(message: [ :title, :content ])
    end
end

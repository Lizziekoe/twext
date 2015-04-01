class TextsController<ApplicationController
  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    @text.user_id = current_user.id
    @text.from = ENV['OUR_TWILIO_NUMBER']
    if @text.save
      flash[:notice] = "Message Successfully Sent"
      redirect_to user_path(current_user)
    else
      errors = ""
      @text.errors.messages[:base].each do |e|
        if e == @text.errors.messages[:base].first
          errors = errors + e
        else
          errors = errors + '\n' + e
        end
      end
      flash[:alert] = errors
      redirect_to :back
    end
  end


  private

  def text_params
    params.require(:text).permit(:to, :body)
  end

end

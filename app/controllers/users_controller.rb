class UsersController < ApplicationController
  def show
    @text = Text.new
    @contact = Contact.new
    @contacts = current_user.contacts
  end
end

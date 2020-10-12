class PortalController < ApplicationController
  # GET /portal
  # GET /portal.json
  def index; end

  # def about; end

  # GET /web_form
  def web_form
    @contact = Contact.new
  end

  # GET /tutor_form
  def tutor_form
    @contact = Contact.new
  end

  # GET /employee_form
  def employee_form
    @contact = Contact.new
  end

  # POST /web_form
  def web_form_send
    @contact = Contact.create(contact_params)
    @user = Contact.first
    ContactMailer.with(user: @user).contact_me.deliver_now
    Contact.first.destroy
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_website
  #   @website = Website.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end

class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver_later
      redirect_to contact_path(@contact), notice: "お問い合わせを送信しました"
    else
      flash.now[:alert] = "入力内容に誤りがあります"
      render :new
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end

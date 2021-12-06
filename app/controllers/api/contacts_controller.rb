class Api::ContactsController < ApplicationController

  before_action :set_contact, only: [:update, :destroy]

  def index
    @contacts = Contact.latest
    per_page = params[:all].blank? ? (params[:per_page] || Contact.per_page) : Contact.count
    @q = @contacts.ransack(params[:q])
    @contacts = @q.result.paginate(page: params[:page], per_page: per_page)
    render json: @contacts, meta: pagination_meta(@contacts), each_serializer: ContactSerializer
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact, serializer: ContactSerializer, status: 200
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  def update
    if !@contact.update(contact_params)
      render json: @contact.errors, status: :unprocessable_entity and return
    end
      render json: @contact, serializer: ContactSerializer, status: 200
  end

  def destroy
    if @contact.destroy
      render json: {message: 'Contact deleted Successfully'}, status: 200
    else
      render json: @contact.errors, status: :unprocessable_entity and return
    end
  end

  private

  def set_contact
    @contact = Contact.find_by_id(params[:id])
    render json: {error: 'Contact not found'}, status: :not_found if @contact.nil?
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end

end

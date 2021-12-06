class Api::LogHistoriesController < ApplicationController

  def create
    @log_history = LogHistroy.new(log_history_params)
    if @log_history.save
      render json: @log_history, serializer: ContactSerializer, status: 200
    else
      render json: @log_history.errors, status: :unprocessable_entity
    end
  end

  private
  
  def log_history_params
    params.require(:log_history).permit(:elementable_type, :elementable_id, :old_values, :new_values)
  end

end

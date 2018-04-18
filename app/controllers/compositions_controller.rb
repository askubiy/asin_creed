class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def show

  end

  def create
    @composition = Composition.create(composition_params)
    redirect_to compositions_path
  end

  def update
  end

  def delete
  end

  private

  def composition_params
    params.require(:composition).permit(
      :title, :schedule, :start_date, :end_date, :client_name
    )
  end

end

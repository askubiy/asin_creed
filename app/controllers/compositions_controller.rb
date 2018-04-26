class CompositionsController < ApplicationController
  def index
    @compositions = Composition.all
  end

  def new
    @composition = Composition.new
    @composition.asins.build
  end

  def show

  end

  def create
    accept_params = composition_params
    asins_attributes = accept_params.delete(:asins_attributes)
    @composition = Composition.create(accept_params)
    if asins_attributes.present?
      asins_attributes.each do |key, value|
        Asin.create(value: value["value"], composition: @composition)
      end
    end
    redirect_to compositions_path
  end

  def update
  end

  def delete
  end

  def generate
    @composition = Composition.find(params[:id])
    send_data @composition.generate, type: Mime[:csv], disposition: "attachment; filename='#{@composition.title}.csv'"
  end

  private

  def composition_params
    params.require(:composition).permit(
      :title, :schedule, :start_date, :end_date, :client_name, :price, :fee,
      asins_attributes: [[:value]]
    )
  end

end

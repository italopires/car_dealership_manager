class CarsController < BaseController
  before_action :set_dealerships, only: [:new, :create, :edit, :update]

  private

  def permitted_params
    params.require(:car).permit(:name, :price, :dealership_id, :price, :status)
  end

  def after_save_path
    cars_path
  end

  def set_dealerships
    @dealerships = Dealership.all.order(:name)
  end
end
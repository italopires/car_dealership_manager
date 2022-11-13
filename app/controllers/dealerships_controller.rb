class DealershipsController < BaseController
  private

  def permitted_params
    params.require(:dealership).permit(:name)
  end

  def after_save_path
    dealerships_path
  end
end
class BaseController < ApplicationController
  def index
    authorize object_class.new

    @objects = object_class.all
  end

  def new
    @object = object_class.new

    authorize @object
  end

  def create
    @object = object_class.new permitted_params

    authorize @object
    if @object.save
      yield if block_given?

      respond_to do |format|
        format.html do
          redirect_to after_save_path, notice: t('notices.created', model: object_class.model_name.human)
        end
        format.json { render json: @object, status: :created, location: @object }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @object.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @object = object_class.find params[:id]

    authorize @object
  end

  def update
    @object = object_class.find params[:id]

    authorize @object

    if @object.update(permitted_params)
      yield if block_given?

      redirect_to after_save_path, notice: t('notices.updated', model: object_class.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @object = object_class.find params[:id]

    authorize @object
    @object.destroy

    redirect_to after_save_path, notice: t('notices.destroyed', model: object_class.model_name.human)
  end

  private

  def permitted_params
    raise 'This method should be implemented'
  end

  def object_class
    controller_name.singularize.camelize.constantize
  end

  def after_save_path
    raise 'This method should be implemented'
  end
end
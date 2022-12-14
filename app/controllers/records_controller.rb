class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      flash[:notice] = "記録しました"
      redirect_to records_path
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def index
    @records = Record.all

  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      flash[:notice] = "更新しました"
      redirect_to record_path(@record.id)
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to records_path
  end

  private
  def record_params
    params.require(:record).permit(:title, :content, :start_time)
  end
end


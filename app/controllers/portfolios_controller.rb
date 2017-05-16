class PortfoliosController < ApplicationController
  before_action :find_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def show; end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new portfolio_item_params
    if @portfolio_item.save
      flash[:success] = 'Portfolio was created successfully'
      redirect_to @portfolio_item
    else
      flash.now[:error] = 'Portfolio creation failed'
      render :new
    end
  end

  def edit; end

  def update
    if @portfolio_item.update portfolio_item_params
      flash[:success] = 'Portfolio was updated successfully'
      redirect_to @portfolio_item
    else
      flash.now[:error] = 'Portfolio update failed'
      render :edit
    end
  end

  def destroy
    if @portfolio_item.destroy
      flash[:success] = 'Portfolio was deleted successfully'
      redirect_to portfolios_path
    end
  end

  private

  def find_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body,
                                      :main_image, :thumb_image)
  end
end

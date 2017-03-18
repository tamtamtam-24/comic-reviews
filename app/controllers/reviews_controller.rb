class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @review = Review.new
    # Messageを全て取得する。
    @reviews = Review.all
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path , notice: '口コミを保存しました'
    else
      # メッセージが保存できなかった時
      @reviews = Review.all
      flash.now[:alert] = "口コミの保存に失敗しました。"
      render 'index'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @review.update(review_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to review_path , notice: '口コミを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @review.destroy
    redirect_to root_path, notice: '口コミを削除しました'
  end

  private

  def review_params
    params.require(:review).permit(:name, :body, :title, :comic_name)
  end
  
  def set_review
    @review = Review.find(params[:id])
  end
end

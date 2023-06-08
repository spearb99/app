class ListsController < ApplicationController
  def new
    @list = List.new
  end
  
  
  def create
    
    list = List.new(list_params)
    # 2. データをデータベースに保存するためのsaveメソッド実行
    list.save
    # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
    flash[:notice] = "投稿が成功しました"
    redirect_to list_path(list.id)
  end
   
   

  def index
     @lists = List.all
  end

  def show
     @list = List.find(params[:id])

  end

  def edit
     @list = List.find(params[:id])
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

private

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end

class ListsController < ApplicationController
  before_action :set_user
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET users/1/lists
  def index
    @lists = @user.lists
  end

  # GET users/1/lists/1
  def show
    @item = @list.items.new
  end

  # GET users/1/lists/new
  def new
    @list = @user.lists.build
  end

  # GET users/1/lists/1/edit
  def edit
  end

  # POST users/1/lists
  def create
    @list = @user.lists.new(list_params)

    if @list.save
      redirect_to(lists_path)
    else
      render action: 'new'
    end
  end

  # PUT users/1/lists/1
  def update
    if @list.update(list_params)
      redirect_to(lists_path)
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/lists/1
  def destroy
    @list.destroy

    redirect_to lists_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_list
      @list = @user.lists.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:title)
    end
end

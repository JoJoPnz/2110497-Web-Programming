class MainController < ApplicationController
  before_action :must_be_logged_in, only: %i[ user_Items, show_inventory ]

  def login
  end

  def create
    u = User.where(login: params[:login]).first
    if u && u.authenticate(params[:password])
      redirect_to '/main/user_Item'
      session[:logged_in] = true
      session[:login_user_id] = u.id
    else
      redirect_to main_login_path, notice: 'wrong username or password'
    end
  end

  def destroy
    reset_session
  end

  def user_Items
    @login_user_id = session[:login_user_id].to_i
    @user = User.where(id: @login_user_id).first
  end

  def user_Item_delete
    @item = Item.find(params[:id])
    @item.user_id = nil
    @item.save
    redirect_to(main_user_Item_path)
  end

  def show_shop
    @user = User.where(id: params[:id].to_i).first
    if(session[:logged_in] == true)
      @user_login = User.where(id: session[:login_user_id].to_i).first
    end
  end

  def buy_item
    @item = Item.find(params[:item_id])
    @buyer_id = session[:login_user_id].to_i
    @buyer = User.where(id: @buyer_id).first
    if(@item.stock <= 0)
      redirect_to '/shop/' + params[:shop_user_id].to_s + '?warning=true'
    else
      @item.stock -= 1
      @item.save
      Inventory.create(user_id: @buyer_id, item_id: @item.id, price: @item.price, timestamp: DateTime.current)
      redirect_to '/shop/' + params[:shop_user_id].to_s + '?success=true'
    end
  end

  def show_inventory
    @login_user_id = session[:login_user_id].to_i
    @user = User.where(id: @login_user_id).first
  end

end

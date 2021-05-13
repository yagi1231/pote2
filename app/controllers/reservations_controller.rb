class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @posts=Post.all
  end
  
  def show
    @reservation = Reservation.find_by(id: params[:id])
    @post = @reservation.post
  end
  
  def new
    @reservation = Reservation.new(
      start: params[:start],
      end: params[:end],
      num: params[:num],
      money: params[:fe].to_i*(params[:end].to_date-params[:start].to_date).to_i*params[:num].to_i
    )
  end
  
  def create
    @reservation = Reservation.new(
      start: params[:start],
      end: params[:end],
      num: params[:num],
      money: params[:fe].to_i*(params[:end].to_date-params[:start].to_date).to_i*params[:num].to_i
    )
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to("/reservations")
    else
      render("reservation/new")
    end
  end
  def destroy
    @reservation= Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice]="スケジュールを削除しました"
    redirect_to :reservations
  end
  end

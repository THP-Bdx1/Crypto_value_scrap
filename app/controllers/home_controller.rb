class HomeController < ApplicationController
  
  def index
      @currencies=Currency.all
      if @currencies.name == nil
        StartScrap.new.perform
      else
        Currency.destroy_all
        ActiveRecord::Base.connection.reset_pk_sequence!("currency")
        StartScrap.new.perform
      end
      @currencycurrent=Currency.new
  end

  def show
    @currency=Currency.find(params[:currency][:id])
  end
end
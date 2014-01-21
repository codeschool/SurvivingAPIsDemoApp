class PaymentsController < ApplicationController
  def index
    payments = current_user.payments
    render json: payments, status: 200
  end
end

class V1::Users::ExpensesController < V1Controller
  before_action :set_user
  before_action :set_expense, only: [:show, :update, :destroy]

  # GET v1/users/:user_id/expenses
  def index
    @expenses = @user.expenses
    render json: @expenses
  end

  # GET v1/users/:user_id/expenses/:id
  def show
    render json: @expense
  end

  # POST v1/users/:user_id/expenses
  def create
    @expense = @user.expenses.new(expense_params)

    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT v1/users/:user_id/expenses/:id
  def update
    if @expense.update(expense_params)
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE v1/users/:user_id/expenses/:id
  def destroy
    @expense.destroy
  end

  # GET v1/users/:user_id/expenses/summary
  def summary
    total_expenses = @user.expenses.sum(:amount)
    average_expense = @user.expenses.average(:amount)

    render json: { total: total_expenses, average: average_expense }
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_expense
    @expense = @user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:description, :amount)
  end
end

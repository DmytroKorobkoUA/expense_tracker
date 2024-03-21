require 'test_helper'

class V1::Users::ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "test_user", email: "test@example.com")
    @expense = Expense.create(description: "Test expense", amount: 50, user: @user)
  end

  test "should get index" do
    get user_expenses_path(@user), as: :json
    assert_response :success
  end

  test "should show expense" do
    get user_expense_path(@user, @expense), as: :json
    assert_response :success
  end

  test "should create expense" do
    assert_difference('Expense.count') do
      post create_user_expense_path(@user), params: { expense: { description: "New expense", amount: 100 } }, as: :json
    end

    assert_response :created
  end

  test "should update expense" do
    patch update_user_expense_path(@user, @expense), params: { expense: { description: "Updated expense", amount: 75 } }, as: :json
    assert_response :success
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete delete_user_expense_path(@user, @expense), as: :json
    end

    assert_response :no_content
  end

  test "should get summary" do
    get user_expenses_summary_path(user_id: @user.id), as: :json
    assert_response :success

    summary = JSON.parse(response.body)
    assert_not_nil summary["total"]
    assert_not_nil summary["average"]
  end
end

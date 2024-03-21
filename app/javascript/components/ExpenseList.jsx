import React, { useState, useEffect } from 'react';

function ExpenseList({ userId }) {
    const [expenses, setExpenses] = useState([]);

    useEffect(() => {
        const fetchExpenses = async () => {
            const response = await fetch(`/v1/users/${userId}/expenses`);
            const data = await response.json();
            setExpenses(data);
        };

        fetchExpenses();
    }, [userId]);

    return (
        <div className="expense-list">
            <h2>Expense List</h2>
            <ul>
                {expenses.map(expense => (
                    <li key={expense.id}>
                        {expense.description} - ${expense.amount}
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default ExpenseList;

import React, { useState } from 'react';

function AddExpenseForm({ userId }) {
    const [description, setDescription] = useState('');
    const [amount, setAmount] = useState('');

    const handleSubmit = async (event) => {
        event.preventDefault();
        if (!description || !amount) return;

        try {
            const response = await fetch(`/v1/users/${userId}/expenses`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ description, amount: parseFloat(amount) })
            });
            const data = await response.json();
            console.log(data);
        } catch (error) {
            console.error('Error adding expense:', error);
        }

        setDescription('');
        setAmount('');
    };

    return (
        <div className="add-expense-form">
            <h2>Add Expense</h2>
            <form onSubmit={handleSubmit}>
                <label>
                    Description:
                    <input
                        type="text"
                        value={description}
                        onChange={(e) => setDescription(e.target.value)}
                    />
                </label>
                <label>
                    Amount:
                    <input
                        type="number"
                        value={amount}
                        onChange={(e) => setAmount(e.target.value)}
                    />
                </label>
                <button type="submit">Add Expense</button>
            </form>
        </div>
    );
}

export default AddExpenseForm;

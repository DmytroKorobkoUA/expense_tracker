import React, { useState } from 'react';
import AddExpenseForm from './AddExpenseForm';
import ExpenseList from './ExpenseList';
import Summary from './Summary';

function App() {
    const [userId, setUserId] = useState(null);

    const handleUserIdChange = (event) => {
        setUserId(event.target.value);
    };

    return (
        <div className="App">
            <h1>Expense Tracker</h1>
            <div>
                <label htmlFor="userId">Enter User ID: </label>
                <input type="text" id="userId" onChange={handleUserIdChange} />
            </div>
            {userId && (
                <>
                    {/*<nav>*/}
                    {/*    <ul>*/}
                    {/*        <li>*/}
                    {/*            <a href={`#add-expense/${userId}`}>Add Expense</a>*/}
                    {/*        </li>*/}
                    {/*        <li>*/}
                    {/*            <a href={`#expense-list/${userId}`}>Expense List</a>*/}
                    {/*        </li>*/}
                    {/*        <li>*/}
                    {/*            <a href={`#summary/${userId}`}>Summary</a>*/}
                    {/*        </li>*/}
                    {/*    </ul>*/}
                    {/*</nav>*/}
                    <section>
                        <AddExpenseForm userId={userId} />
                    </section>
                    <section>
                        <ExpenseList userId={userId} />
                    </section>
                    <section>
                        <Summary userId={userId} />
                    </section>
                </>
            )}
        </div>
    );
}

export default App;

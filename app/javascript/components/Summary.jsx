import React, { useState, useEffect } from 'react';

function Summary({ userId }) {
    const [summary, setSummary] = useState(null);

    useEffect(() => {
        const fetchSummary = async () => {
            const response = await fetch(`/v1/users/${userId}/expenses/summary`);
            const data = await response.json();
            setSummary(data);
        };

        fetchSummary();
    }, [userId]);

    return (
        <div className="summary">
            <h2>Summary</h2>
            {summary && (
                <div>
                    <p>Total Expenses: ${summary.total}</p>
                    <p>Average Expense: ${summary.average}</p>
                </div>
            )}
        </div>
    );
}

export default Summary;

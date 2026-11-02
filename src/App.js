
import React, { useState } from 'react';
import Star from "C:/Users/rayen/td2/src/Composant/Star.jsx";

function App() {
    const [rating, setRating] = useState(0);

    return (
        <div style={{
            width: 'fit-content',
            border: '1px solid #ccc',
            padding: '8px',
            textAlign: 'center',
            fontFamily: 'Arial'
        }}>
            <p style={{
                fontSize: '18px',
                margin: '0 0 12px 0'
            }}>
                Donne ton avis
            </p>

            <div style={{ display: 'flex' }}>
                {[1, 2, 3, 4, 5].map((number) => (
                    <Star
                        key={number}
                        active={number <= rating}
                        onClick={() => setRating(number)}
                    />
                ))}
            </div>

        </div>
    );
}

export default App;

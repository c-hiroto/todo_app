import React, { useState } from "react";


export const LoginForm = () => {
    const [email, setEmail] = useState(''); //入力されたemailを管理
    const [password, setPassword] = useState(''); //入力されたpasswordを管理

  const handleSubmit = async (event) => {
    event.preventDefault();
    const res = await fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ email, password })
    });
    const data = await res.json();
    if (res.ok) {
      // ログイン成功
      setIsLoggedIn(true);
    } else {
      // ログイン失敗
      setError(data.message);
    }
  };
    return(
        <>
            <h1>Log in</h1>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <form onSubmit={handleSubmit}>
                        <div>
                            <label htmlFor="email">Email</label>
                            <input
                            type="text"
                            className="form-control"
                            id="email"
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                            />
                        </div>
                        <div>
                            <label htmlFor="password">Password</label>
                            <input
                            type="password"
                            className="form-control"
                            id="password"
                            value={password}
                            onChange={(e) => setPassword(e.target.value)}
                            />
                        </div>
                        <button type="submit" className="btn btn-primary">Log in</button>
                    </form>
                    <p>New user? <a href="/signup">Sign up now!</a></p>
                </div>
            </div>
        </>
        
    );
};
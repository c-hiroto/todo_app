import React, { useState } from "react";
import { ErrorMessages } from "./ErrorMessages";

export const Form = (props) => {
  const ButtonName = props.buttonName;
  const [user, setUser] = useState({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
  });

  const handleInputChange = (event) => {
    const { name, value } = event.target;
    setUser({ ...user, [name]: value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    // フォームの処理を実装する
  };

  return (
    <>
      <div className="row">
        <div className="col-md-6 col-md-offset-3">
          <form onSubmit={handleSubmit}>
            {/* エラーメッセージを表示するコンポーネント */}
            <ErrorMessages />

            <label htmlFor="name">Name</label>
            <input
              type="text"
              id="name"
              name="name"
              value={user.name}
              className="form-control"
              onChange={handleInputChange}
            />

            <label htmlFor="email">Email</label>
            <input
              type="email"
              id="email"
              name="email"
              value={user.email}
              className="form-control"
              onChange={handleInputChange}
            />

            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              name="password"
              value={user.password}
              className="form-control"
              onChange={handleInputChange}
            />

            <label htmlFor="password_confirmation">Password confirmation</label>
            <input
              type="password"
              id="password_confirmation"
              name="password_confirmation"
              value={user.password_confirmation}
              className="form-control"
              onChange={handleInputChange}
            />

            <button type="submit" className="btn btn-primary">
              {ButtonName} {/*ボタン名を動的に表示する*/}
            </button>
          </form>
        </div>
      </div>
    </>
  );
};

import React from "react";
import { render } from "react-dom";

export const NotLoggedIn = () => {
    render(
    <div class="center jumbotron">
      <h1>Welcome to the ToDo App</h1>
      <h2>
          これは勉強用のToDoアプリです。
      </h2>
    </div>
    )
}
import React from "react";
import { SignupButton } from "./SignupButton";

export const NotLoggedIn = () => {
    return(
    <div class="center jumbotron">
      <h1>Welcome to the ToDo App</h1>
      <h2>
          これは勉強用のToDoアプリです。
      </h2>
      <SignupButton />
    </div>
    );
};
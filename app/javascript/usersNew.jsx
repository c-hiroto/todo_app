import React from "react";
import { createRoot } from "react-dom/client";
import { Signup } from "./components/users_new/Signup";

const signup = document.getElementById("signup");
createRoot(signup).render(
  <React.StrictMode>
    <Signup />
  </React.StrictMode>
);

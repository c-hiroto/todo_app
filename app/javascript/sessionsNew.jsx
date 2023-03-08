import React from "react";
import { createRoot } from 'react-dom/client';
import { LoginForm } from "./components/sessions_new/LoginForm";


const login = document.getElementById('login');
createRoot(login).render(
  <React.StrictMode>
    <LoginForm />
  </React.StrictMode>
  );
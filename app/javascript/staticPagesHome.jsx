import React from "react";
import { createRoot } from 'react-dom/client';
import { LoggedIn } from "./components/static_pages_home/LoggedIn";
import { NotLoggedIn } from "./components/static_pages_home/NotLoggedIn"


const home = document.getElementById('home');
createRoot(home).render(
  <React.StrictMode>
    {!current_user ? <NotLoggedIn /> : <LoggedIn />}
  </React.StrictMode>
    
  );
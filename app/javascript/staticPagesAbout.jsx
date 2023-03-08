import React from "react";
import { createRoot } from "react-dom/client";
import { AboutPage } from "./components/static_pages_about/AboutPage";

const about = document.getElementById("about");
createRoot(about).render(
  <React.StrictMode>
    <AboutPage />
  </React.StrictMode>
);

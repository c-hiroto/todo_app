import React from "react";
import { createRoot } from "react-dom/client";
import { ContactPage } from "./components/static_pages_contact/ContactPage";

const contact = document.getElementById("contact");
createRoot(contact).render(
  <React.StrictMode>
    <ContactPage />
  </React.StrictMode>
);

import React from "react";

export const ErrorMessages = () => {
  return true ? (
    <div id="error_explanation">
      <div className="alert alert-danger">
        The form contains (エラー数を動的に変化させて表示).
      </div>
      <ul>
        <li>エラーメッセージの表示</li>
      </ul>
    </div>
  ) : null;
};

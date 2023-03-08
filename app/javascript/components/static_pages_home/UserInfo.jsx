import React from "react";

export const UserInfo = (props) => {
    return(
      <section class="user_info">
        <h1>{props.user}(ユーザー名の表示をしたい)</h1>
        <span><a href="#">View Completed tasks</a></span>
        <span>The number of upcoming Tasks(未完了タスクの個数を表示したい)</span>
      </section>
    )
}
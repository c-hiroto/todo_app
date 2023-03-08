import React from "react";
import { TaskForm } from "./TaskForm";
import { UpcomingTasks } from "./UpcomingTasks";
import { UserInfo } from "./UserInfo";

export const LoggedIn = () => {

    return(
      <div class="row">
        <aside class="col-md-4">
          <UserInfo />
          <TaskForm />
        </aside>
        <div class="col-md-8">
          <UpcomingTasks />
        </div>
      </div>
    )
}
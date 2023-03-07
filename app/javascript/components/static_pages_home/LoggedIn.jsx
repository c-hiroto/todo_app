import React from "react";
import { render } from "react-dom";
import { TaskForm } from "./TaskForm";
import { UserInfo } from "./UserInfo";

export const LoggedIn = () => {
    render(
      <div class="row">
        <aside class="col-md-4">
          <section class="user_info">
            <UserInfo />
          </section>
          <section class="task_form">
            <TaskForm />
          </section>
        </aside>
        <div class="col-md-8">
          <h3>Upcoming Tasks</h3>
            {/* <%= form_tag root_path, method: :get do %>
              <%= select_tag :tag_id,
                      options_from_collection_for_select(Tag.all, :id, :name, params[:tag_id]),
                      {
                        prompt: 'Filter',
                        onchange: 'submit(this.form);'
                      }
              %>
            <% end %>
          <%= render 'shared/feed' %> */}
        </div>
      </div>
    )
}
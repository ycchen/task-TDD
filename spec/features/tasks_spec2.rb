 require 'spec_helper'

describe "Tasks" do
  before do
    @task = Task.create(task: 'go to bed')
  end

  describe "GET /tasks" do
    # it "works! (now write some real specs)" do
    #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #   get tasks_index_path
    #   response.status.should be(200)
    # end
    it "display some tasks" do
    	# @task = Task.create(task: 'Go to bed')
            visit tasks_path
            page.should have_content 'go to bed'
    	#using capybara to visit the /tasks path
    	# visit tasks_path
    	# page.should have_content 'go to bed'
    end

    it "create a new task" do
        visit tasks_path
        fill_in 'Task', with: 'go to mall'
        click_button 'Create Task'

        current_path.should == tasks_path
        page.should have_content 'go to mall'
    end
  end

  describe "Put /tasks" do
    it "edit a task" do
        visit tasks_path
        click_link 'Edit'
        
        find_field('Task').value.should == 'go to bed'
        current_path.should == edit_task_path(@task)
        fill_in 'Task', with: 'updated task'
        click_button 'Update Task'

        current_path.should == tasks_path
        page.should have_content 'updated task'
    end

    it "should not update an empty task" do
        visit tasks_path
        click_link 'Edit'
        fill_in 'Task', with: ''
        click_button 'Update Task'

        current_path.should == edit_task_path(@task)
        page.should have_content 'There was an error updating your task.'

    end
  end

  describe "DELETE" do
    
    it "delete a task" do
      visit tasks_path
      click_link 'Destroy'

      current_path.should == tasks_path
      page.should have_content 'Task has been deleted.'

    end
  end

end

require('spec_helper')
describe(Task) do

  describe(".all") do
    it("is initiall empty") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#description") do
    it("lets you give a task description") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      test_task1 = Task.new({:description => "learn SQL", :list_id => 1})
      test_task2 = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task1).to(eq(test_task2))
    end
  end

  describe("#save") do
    it("saves a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
end

require('spec_helper')
describe(List) do

  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a list by its ID number") do
      test_list1 = List.new({:name => "Epicodus Stuff", :id => nil})
      test_list1.save()
      test_list2 = List.new({:name => "Other Stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end

  describe("#name") do
    it("tells you the list item name") do
      list = List.new({:name => "Epicodus Stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus Stuff"))
    end
  end

  describe("#id") do
    it("sets the ID when saved") do
      list = List.new({:name => "Epicodus Stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      test_list1 = List.new({:name => "Epicodus Stuff", :id => nil})
      test_list2 = List.new({:name => "Epicodus Stuff", :id => nil})
      expect(test_list1).to(eq(test_list2))
    end
  end

  describe("#save") do
    it("saves a task to the array of saved tasks") do
      test_list = List.new({:name => "Epicodus Stuff", :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "learn SQL", :due_date => "January 18, 2015", :list_id => test_list.id()})
      test_task.save()
      test_task2 = Task.new({:description => "Review Ruby", :due_date => "January 18, 2015", :list_id => test_list.id()})
      test_task2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task2]))
    end
  end

end

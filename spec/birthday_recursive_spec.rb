require './birthday_recursive.rb'

describe Birthday do
  before do
    Birthday.stub!(:puts)
    Birthday.stub!(:gets => mock.as_null_object)
    Birthday.stub!(:confirm_data_correct => true)
  end

  describe "#interrogate" do
    it "Asks you what year you were born in" do
      Birthday.should_receive(:puts).with("What year were you born in?")
      Birthday.interrogate
    end

    it "Requests some input for the year you were born in" do
      Birthday.should_receive(:get_input).any_number_of_times
      Birthday.interrogate
    end

    it "Asks what month you were born in" do
      Birthday.should_receive(:puts).at_least(:once).with("What month were you born in?")
      Birthday.interrogate
    end

    it "Asks what day you were born on" do
      Birthday.should_receive(:puts).at_least(:once).with("What day were you born on?")
      Birthday.interrogate
    end

    it "Responds to the interrogation with statements" do
      Birthday.should_receive(:get_input).and_return("1970")
      Birthday.should_receive(:get_input).and_return("Oct")
      Birthday.should_receive(:get_input).and_return("5")
      Birthday.should_receive(:puts).at_least(:once).with("So, you were born on Oct 5, 1970?")
      Birthday.interrogate
    end

    it "Responds naturally when given different inputs" do
      Birthday.should_receive(:get_input).and_return("1983")
      Birthday.should_receive(:get_input).and_return("Oct")
      Birthday.should_receive(:get_input).and_return("4")
      Birthday.should_receive(:puts).at_least(:once).with("So, you were born on Oct 4, 1983?")
      Birthday.interrogate
    end

    it "Goes through the questions again if you tell it that the data is wrong" do
      Birthday.unstub(:confirm_data_correct)
      Birthday.should_receive(:get_input).at_least(3).times.and_return("data")
      Birthday.should_receive(:puts).at_least(:once)
      Birthday.should_receive(:get_input).and_return("no")
      Birthday.should_receive(:get_input).at_least(3).times.and_return("data")
      Birthday.should_receive(:get_input).and_return("yes")
      Birthday.interrogate
    end
  end

  describe "#confirm_data_correct" do
    before do
      Birthday.unstub(:confirm_data_correct)
    end
    it "returns true for a 'yes' answer" do
      Birthday.should_receive(:get_input).and_return("yes")
      Birthday.confirm_data_correct.should be_true
    end

    it "returns false for a 'no' answer" do
      Birthday.should_receive(:get_input).and_return("no")
      Birthday.confirm_data_correct.should be_false
    end

    it "asks again if you respond with invalid input" do
      Birthday.should_receive(:get_input).and_return("foo")
      Birthday.should_receive(:get_input).and_return("yes")
      Birthday.should_receive(:puts).with("What? Answer 'yes' or 'no'")
      Birthday.confirm_data_correct
    end
  end

  describe "#ask questions" do
    it "Asks questions" do
      Birthday.should_receive(:puts).exactly(3).times
      Birthday.should_receive(:get_input).exactly(3).times
      Birthday.ask_questions(Birthday.questions)
    end

    it "Returns the answers" do
      Birthday.should_receive(:get_input).and_return("Foo")
      Birthday.should_receive(:get_input).and_return("Bar")
      Birthday.should_receive(:get_input).and_return("Baz")
      Birthday.ask_questions(Birthday.questions).should == ["Foo", "Bar", "Baz"]


    end
  end
end

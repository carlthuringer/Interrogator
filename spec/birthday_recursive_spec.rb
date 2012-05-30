require './birthday_recursive.rb'

describe Birthday do
  before do
    Birthday.stub!(:puts)
    Birthday.stub!(:gets)
  end
  it "exists" do
    Birthday
  end

  it "Asks you what year you were born in" do
    Birthday.should_receive(:puts).with("What year were you born in?")
    Birthday.interrogate
  end

  it "Requests some input for the year you were born in" do
    Birthday.should_receive(:gets).and_return("1970")
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
    Birthday.should_receive(:gets).and_return("1970")
    Birthday.should_receive(:gets).and_return("Oct")
    Birthday.should_receive(:gets).and_return("5")
    Birthday.should_receive(:puts).at_least(:once).with("So, you were born on Oct 5, 1970?")
    Birthday.interrogate
  end

  it "Responds naturally when given different inputs" do
    Birthday.should_receive(:gets).and_return("1983")
    Birthday.should_receive(:gets).and_return("Oct")
    Birthday.should_receive(:gets).and_return("4")
    Birthday.should_receive(:puts).at_least(:once).with("So, you were born on Oct 4, 1983?")
    Birthday.interrogate
  end
end

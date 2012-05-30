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

  it "Responds to the interrogation with statements." do
    Birthday.should_receive(:gets).and_return("1970")
    Birthday.should_receive(:puts).with("What year were you born in?")
    Birthday.should_receive(:puts).once.with("So, you were born in 1970?")
    Birthday.interrogate
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "Dynamoid::Associations::BelongsTo" do
  
  context 'has many' do
    before do
      @subscription = Subscription.create
    end
  
    it 'determins nil if it has no associated record' do
      @subscription.magazine.should be_nil
    end
  
    it 'delegates equality to its source record' do
      @magazine = @subscription.magazine.create
    
      @subscription.magazine.should == @magazine
    end
  
    it 'associates has_many automatically' do
      @magazine = @subscription.magazine.create
    
      @magazine.subscriptions.size.should == 1
      @magazine.subscriptions.should include @subscription
    end
  end
  
  context 'has one' do
    before do
      @sponsor = Sponsor.create
    end
    
    it 'determins nil if it has no associated record' do
      @sponsor.magazine.should be_nil
    end
  
    it 'delegates equality to its source record' do
      @magazine = @sponsor.magazine.create
    
      @sponsor.magazine.should == @magazine
    end
  
    it 'associates has_one automatically' do
      @magazine = @sponsor.magazine.create
      
      @magazine.sponsor.size.should == 1
      @magazine.sponsor.should == @sponsor
    end
  end
end

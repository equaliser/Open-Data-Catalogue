require File.dirname(__FILE__) + '/base'

describe SerializationHelper::Utils, " convert records utility method" do
	before do
		silence_warnings { ActiveRecord::Base = mock('ActiveRecord::Base', :null_object => true) }
		ActiveRecord::Base.connection = mock('connection')
	end

	it "returns an array of hash values using an array of ordered keys" do
		SerializationHelper::Utils.unhash({ 'a' => 1, 'b' => 2 }, [ 'b', 'a' ]).should == [ 2, 1 ]
    end

	it "should unhash each hash an array using an array of ordered keys" do
		SerializationHelper::Utils.unhash_records([ { 'a' => 1, 'b' => 2 }, { 'a' => 3, 'b' => 4 } ], [ 'b', 'a' ]).should == [ [ 2, 1 ], [ 4, 3 ] ]
	end

	it "should return true if it is a boolean type" do
		SerializationHelper::Utils.is_boolean(true).should == true
		SerializationHelper::Utils.is_boolean('true').should_not == true
	end

	it "should return an array of boolean columns" do
		ActiveRecord::Base.connection.stub!(:columns).with('mytable').and_return([ mock('a',:name => 'a',:type => :string), mock('b', :name => 'b',:type => :boolean) ])
		SerializationHelper::Utils.boolean_columns('mytable').should == ['b']
	end

	it "should quote the table name" do
		ActiveRecord::Base.connection.should_receive(:quote_table_name).with('values').and_return('`values`')
		SerializationHelper::Utils.quote_table('values').should == '`values`'
	end
end

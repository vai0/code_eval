require 'spec_helper'

describe "Number to Text Converter" do
	it "converts 1 to One" do 
		num_to_word("1").should == "One"
	end 
	
	it 'converts 3 to Three' do
		num_to_word("3").should == "Three"
	end

	it "converts 9 to Nine" do
		num_to_word("9").should == "Nine"
	end

	it 'converts 10 to Ten' do
		num_to_word("10").should == "Ten"
	end

	it "converts 21 to TwentyOne" do
		num_to_word("21").should == "TwentyOne"
	end

	it 'converts 03 to Three' do 
		num_to_word("03").should == "Three"
	end

	it 'converts 30 to Thirty' do
		num_to_word("30").should == "Thirty"
	end

	it 'converts 50 to Fifty' do
		num_to_word("50").should == "Fifty"
	end

	it 'converts 99 to NinetyNine' do
		num_to_word("99").should == "NinetyNine"
	end

	it 'converts 050 to Fifty' do
		num_to_word("050").should == "Fifty"
	end

	it 'converts 100 to OneHundred' do
		num_to_word("100").should == "OneHundred"
	end

	it 'converts 101 to OneHundredOne' do
		num_to_word("101").should == "OneHundredOne"
	end

	it 'converts 110 to OneHundredTen' do
		num_to_word("110").should == "OneHundredTen"
	end

	it 'converts 466 to FourHundredSixtySix' do
		num_to_word("466").should == "FourHundredSixtySix"
	end

	it 'converts 1234 to OneThousandTwoHundredThirtyFour' do
		num_to_word("1234").should == "OneThousandTwoHundredThirtyFour"
	end

	it 'converts 12345 to TwelveThousandThreeHundredFortyFive' do
		num_to_word("12345").should == "TwelveThousandThreeHundredFortyFive"
	end

	it 'converts 123456 to OneHundredTwentyThreeThousandFourHundredFiftySix' do
		num_to_word("123456").should == "OneHundredTwentyThreeThousandFourHundredFiftySix"
	end

	it 'converts 1000000 to OneMillion' do
		num_to_word("1000000").should == "OneMillion"
	end

	it 'converts 10000 to TenThousand' do
		num_to_word("10000").should == "TenThousand"
	end 

	it 'converts 1000 to OneThousand' do
		num_to_word("1000").should == "OneThousand"
	end

	it 'converts 999_999_000 to NineHundredNinetyNineMillionNineHundredNinetyNineThousand' do
		num_to_word("999999000").should == "NineHundredNinetyNineMillionNineHundredNinetyNineThousand"
	end 

	it 'converts 1001321 to OneMillionOneThousandThreeHundredTwentyOne' do
		num_to_word("1001321").should == "OneMillionOneThousandThreeHundredTwentyOne"
	end

	it 'converts 1_011_321 to OneMillionElevenThousandThreeHundredTwentyOne' do
		num_to_word("1011321").should == "OneMillionElevenThousandThreeHundredTwentyOne"
	end
end
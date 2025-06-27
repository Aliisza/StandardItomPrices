item[] derivatives = {
	$item[Rock Garden Guide],
	$item[S.I.T. Course Voucher],
	$item[closed-circuit phone system],
	$item[cursed monkey glove],
	$item[shrink-wrapped Cincho de Mayo],
	$item[sleeping patriotic eagle],
	$item[boxed august scepter],
	$item[book of facts],
	$item[dark Jill-of-All-Trades],
	$item[A Guide to Burning Leaves],
	$item[wrapped candy cane sword cane],
	$item[baby chest mimic],
	$item[in-the-box spring shoes],
	$item[packaged Everfull Dart Holster],
	$item[boxed Apriling band helmet],
	$item[boxed Mayam Calendar],
	$item[mini kiwi egg],
	$item[packaged Roman Candelabra],
	$item[untorn tearaway pants package],
	$item[boxed Sept-Ember Censer],
	$item[boxed bat wings],
	$item[peace turkey outline],
	$item[sealed TakerSpace letter of Marque],
	$item[McHugeLarge deluxe ski set],
	$item[new-in-box toy Cupid bow],
	$item[assemble-it-yourself Leprecondo],
	$item[Packaged April Shower Thoughts Calendar],
	$item[Unpeeled Peridot of Peril],
	$item[packaged prismatic beret],
	$item[shrink-wrapped 2002 Mr. Store Catalog],
};

string pretty_prices(float x) {
	if (x<0)
		return '-'+pretty_prices(0-x);
	for i from 9 to 3
		if (x >= 10**i)
			return (x.to_float()/10**(3*(i/3))).to_string('%'+(i-(i%3))+'.'+(2-i%3)+'f') + string[]{'k','M','B'}[i/3-1];
	return (x.to_int().to_float() != x && x.to_int().to_string('%d').length() < 3)
		? x.to_string('%1.2f')
		: x.to_int().to_string('%d');
}

int clean_int(string s)
{
	return replace_string(s, ",", "").to_string().to_int();
}

int get_lowest_price(item i)
{
	string s = cli_execute_output("searchmall " + i.to_string());

	matcher m = create_matcher("([0-9,]+) @ ([0-9, ]+) meat", s);
	if (find(m)) { # NOTE: You could while loop and get all listings
		# m.group(1) is count, m.group(2) is price
		return(clean_int(m.group(2)));
	}
	return 0;
}

void main() {

float[item] rates;
	foreach it,x in derivatives {
		rates[x] = x.get_lowest_price();
	}
	sort derivatives by rates[value];
	foreach i,it in derivatives
	print(`{it} price = {rates[it].pretty_prices()}`);		
}

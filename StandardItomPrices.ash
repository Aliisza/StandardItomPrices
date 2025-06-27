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

void main() {

float[item] rates;
	foreach it,x in derivatives {
		rates[x] = x.mall_price();
	}
	sort derivatives by rates[value];
	//print(`inflammable leaf derivatives are selling at {lorate}~{hirate} meat per leaf`);
	foreach i,it in derivatives
	print(`{it} price = {it.mall_price().pretty_prices()}`);		
}
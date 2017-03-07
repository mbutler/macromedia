<?

// Recieving the variables.
$style = $_POST['style'];
$hair = $_POST['haircolor'];
$eye = $_POST['eyecolor'];
$dress = $_POST['dresstype'];
$price = $_POST['price'];
$dollname = $_POST['dollname'];
$momname = $_POST['momname'];
$birthday = $_POST['birthday'];

// doing something with the variables
// creates a makeshift sku # by contatenating style,hair,eye,dress in that order

echo "SKU #";
echo $style;
echo $hair;
echo $eye;
echo $dress;
echo "\n<br />The price is $$price";

?> 
<?php
require_once "saveDB.php";
?>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel = "stylesheet" type = "text.css" href = "style.css">
	
	<style type="text/css">
	.auto-style2 {
		margin-left: 0px;
	}
	</style>
	
</head>
<body>

<div id = 'CheckOutPage'>
	<h1>CHECKOUT FORM</h1>
    <div id = "CheckOut" style="column-count: 3; column-gap: 30px; display: table;">
        <form method='post' name ="SHIPPING"action ="saveDB.php">
            <div class="three_column" style="text-align: left;display: table-cell;">
                <h2>1.SHIPPING</h2>
                <div class="row">
                    <div class="col-50">
                        <input type="text" id="first_name" name="first_name" placeholder="FIRST NAME" style="width: 168px">
                    </div>
                    <div class="col-50">
                        <input type="text" id="last_name" name="last_name" placeholder="LAST NAME" style="width: 168px">
                    </div>
                </div>
                <input type="text" id="email" name="email" placeholder="EMAIL ADDRESS">
                <input type="text" id="adr1" name="address" placeholder="ADDRESS">
                <input type="text" id="city" name="city" placeholder="CITY">

                <div class="row">
                    <div class="col-50">
                        <input id ="state"class =" textboxes" list="suggs" name="state" placeholder="STATE" onkeyup="suggest(this.value, 'suggs')">
						<datalist id="suggs"></datalist>

                    </div>
                    <div class="col-50">
                        <input type="text" id="zip" name="zipcode" placeholder="ZIP CODE" onkeyup =" updateState(this.value,'state')" style="width: 168px">
                    </div>
                </div>
                <input type="text" id="phone" name="phone_number" placeholder="PHONE NUMBER" maxlength='12' size='12'>
				<h3>SHIPPING METHOD</h3>
                <input checked type="radio" name="method" value="3_DAY"> STANDARD 3 DAY<br><br>
                <input type="radio" name="method" value="2_DAY"> 2 DAY SHIPPING<br><br>
                <input type="radio" name="method" value="1_DAY"> 1 DAY SHIPPING<br>

                <label>
                    <br><br>
                    <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
                </label>

				
            </div>

            <div class="three_column" style="text-align: left;display: table-cell;">
				<h2>2.PAYMENT</h2>
                <input type="text" id="cname" name="cardname" placeholder="NAME ON CARD" style="width: 400px">
                <div class="row">
                    <div class="col-50">
                        <input type="text" id="ccnum" name="cardnumber" placeholder="CARD NUMBER" style="width: 188px">
                    </div>
                    <div class="col-50">
                        <input type="text" id="cvv" name="cvv" placeholder="CVV" style="width: 188px">
                    </div>
                </div>
                <div class="row">
                    <div class="col-50">
                        <input type="text" id="expmonth" name="expmonth" placeholder="MONTH" style="width: 188px">
                    </div>
                    <div class="col-50">
                        <input type="text" id="expyear" name="expyear" placeholder="YEAR" style="width: 188px">
                    </div>
                </div>
                <br>
                <br>
                <input type="button" value="CONTINUE" class="tab_link" style=
                        "background-color: black; color: white;float: right; width: 200px; height: 80px;
                            text-align: center; " onclick="checkCheckOut();finalShoppingBag();">
            </div>

            <div class="three_column" style="text-align: left;display: table-cell;">

                <div style="overflow: auto; height: 300px;">
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <thead>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="padding-right: 100px;width: 300px;">
                                        </td>
                                        <td style="width: 100px; text-align: right">
                                        </td>
                                    </tr>
                                    </thead>
                                    <tbody id="FinalSummary">
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr>
                <h3>ORDER SUMMARY</h3>
				<br>
                <h4>SUBTOTAL  <span id = 'final_subtotal' style="float: right"> $0.00</span> </h4>
                <h4>SHIPPING <span style="float: right">$0.00</span></h4>
                <h4>ESTIMATED SALES TAX <span style="float: right">$0.00</span></h4>
                <hr>
                <h4> ORDER TOTAL <span id = 'final_order_total' style="float: right">$0.00</span></h4><br>
                <br>
                <br>
                &nbsp;<input class="tab_link" style="background-color: black; color: white; width: 300px; height: 80px;
                       text-align: right;" type="submit" value="COMPLETE ORDER"></div>
                </form>
    </div>
</div>
</html>

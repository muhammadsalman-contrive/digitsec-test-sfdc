/**
* Description of the Controller and the logic it provides
*
* @module  controllers/SecurityTesting
*/

'use strict';

var guard = require('storefront_controllers/cartridge/scripts/guard');
var ISML = require('dw/template/ISML');
var libsecure = require('training/cartridge/controllers/libsecure');

/* API Includes */
//var ContentMgr = require('dw/content/ContentMgr');
var OrderMgr = require('dw/order/OrderMgr');
//var PagingModel = require('dw/web/PagingModel');

/* Script Modules */
//var app = require('~/cartridge/scripts/app');



function start() {
	try
	{
	//var q = request.
	response.getWriter().println(libsecure.htmlEncode('<b>Whatsup</b>'));
	response.getWriter().println(request.httpParameterMap.redirect.value);
	/*response.addHttpHeader('X-FRAME-OPTIONS', 'DENY');
	response.addHttpHeader('Content-Security-Policy','default-src \'*\' https:');
	response.addHttpHeader('X-XSS-Protection','1');*/
	response.getWriter().write('Testing');
	response.getWriter().print('Testing');
		//ISML.renderTemplate('checkout/cart/security');
		//ISML.renderTemplate('content/home/test');
		//ISML.renderTemplate('storefront_core/cartridge/templates/default/testing/security'); 
var orders = OrderMgr.getOrder('8696a9cc3cb404e2ac8ef9dcbf');
response.getWriter().print(orders);
	 var parameterMap = request.httpParameterMap;

    if (empty(parameterMap.orderID.stringValue)) {
        //app.getView().render('account/orderhistory/orderdetails');
        //return response;
    }

    var uuid = parameterMap.orderID.stringValue;
	response.getWriter().print(uuid);    
    //var orders;// = OrderMgr.getOrder('8696a9cc3cb404e2ac8ef9dcbf');
//response.getWriter().print(orders);

    orders = OrderMgr.getOrder('00000202');
    response.getWriter().print(orders);

    //orders = OrderMgr.getOrder();
    //response.getWriter().print(orders);
    
    //orders = OrderMgr.searchOrders('*','');
    response.getWriter().print(orders);
    var Order = orders.next();
    response.getWriter().write(Order);
    //app.getView({Order: Order}).render('account/orderhistory/orderdetails');
    response.getWriter().println(libsecure.htmlEncode('<b>Whatsup</b>'));
	response.getWriter().println(request.httpParameterMap.redirect.value);
	/*response.addHttpHeader('X-FRAME-OPTIONS', 'DENY');
	response.addHttpHeader('Content-Security-Policy','default-src \'*\' https:');
	response.addHttpHeader('X-XSS-Protection','1');*/
	response.getWriter().write('Testing');
	response.getWriter().print('Testing');
	

	}catch(e)
	{
		response.getWriter().println(libsecure.htmlEncode('<b>Whatsup</b>'));
		response.getWriter().println(e);
		
	}
	
};
function redirect()
{
	try
	{
	//var q = request.
	var red = request.httpParameterMap.redirect.value;
	response.redirect(red);
	response.redirect(request.httpParameterMap.redirect.value);
		//ISML.renderTemplate('checkout/cart/security');
		ISML.renderTemplate('content/home/test');
		//ISML.renderTemplate('storefront_core/cartridge/templates/default/testing/security'); 
	}catch(e)
	{
		response.getWriter().println(e);
		
	}
	}

exports.Start = guard.ensure(['get'], start);
exports.Redirect = guard.ensure(['get'], redirect);



$(document).ready(function() {
	
	ko.applyBindings(new ProductViewModel());
});

function ProductViewModel() {
	var self = this

	self.prodId = ko.observable("ID");
	self.prodName = ko.observable("name");
	self.prodDesc = ko.observable("dESC");
}

function Product() {
	var self = this

	self.prodId = ko.observable();
	self.prodName = ko.observable();
	self.prodDesc = ko.observable();

}

function getProductList() {

}
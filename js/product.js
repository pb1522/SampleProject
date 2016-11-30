$(document).ready(function() {
	
	ko.applyBindings(new ProductViewModel());
});

function ProductViewModel() {
	var self = this;

	self.prodList = ko.observableArray($.map(getProductList(), function(item) {
		console.log(item);
		return new Product(item);
	}));

	self.isEdited = ko.observable(false);

	self.saveChange = function() {

	};

	self.cancelChange = function() {

	};

	self.addProduct = function() {

	};



}

function Product(data) {
	var self = this;

	self.prodId = ko.observable(data.prodId);
	self.prodName = ko.observable(data.prodName);
	self.prodDesc = ko.observable(data.prodDesc);
}

function getProductList() {
	var prodArr = [];

	for(var i = 0; i < 10; i++) {
		var prodObj = { prodId: i, 
						prodName: "Test Product - " + i, 
						prodDesc: "A test product for a category - " + i
						};

		prodArr[i] = prodObj;
	}

	return prodArr;
}
var CANCEL_CHANGE = "cancel";
var SAVE_CHANGE = "save";
var ORIGINAL_DATA = "original_data";

var productViewModel = new ProductViewModel();

$(document).ready(function() {

		
	ko.applyBindings(productViewModel);

	$("#addProductDialog").dialog({autoOpen: false});
});

function ProductViewModel() {
	var self = this;

	self.prodList = ko.observableArray($.map(getProductList(), function(item) {
		return new Product(item);
	}));

	self.isEdited = ko.observable(false);

	self.editProduct = function(item) {
		item.isEditable(true);
		self.isEdited(true);
	};

	self.saveChange = function() {
		processChange(self.prodList, SAVE_CHANGE);
		self.isEdited(false);
	};

	self.cancelChange = function() {
		processChange(self.prodList, CANCEL_CHANGE);
		self.isEdited(false);
	};

	self.addProduct = function() {
		addNewProduct();
		resetInput();
	};

	self.deleteProduct = function(item) {
		self.prodList.remove(item);
	};

	self.refreshList = function() {
		//self.prodList().valueHasMutated();
		var data = self.prodList().slice(0);
    	self.prodList([]);
    	self.prodList(data);
	}
}

function Product(data) {
	var self = this;

	self.backUp = new BackUpItem(data, ORIGINAL_DATA);

	self.prodId = ko.observable(data.prodId);
	self.prodName = ko.observable(data.prodName);
	self.prodDesc = ko.observable(data.prodDesc);

	self.isEditable = ko.observable(false);

	self.restoreProduct = function() {
		restoreItem( self );
	};

	self.newBackUp = function() {
		self.backUp = new BackUpItem(self, SAVE_CHANGE);
	};

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

function processChange(arrList, event) {
	for(var i = 0; i < arrList().length; i++) {
		arrList()[i].isEditable(false);

		if(event == CANCEL_CHANGE) {
			arrList()[i].restoreProduct();
		} else {
			arrList()[i].newBackUp();
		}
	}
}

function BackUpItem(data, transactType ) {
	this.prodId = transactType == ORIGINAL_DATA ? data.prodId : data.prodId();
	this.prodName = transactType == ORIGINAL_DATA ? data.prodName : data.prodName(); 
	this.prodDesc = transactType == ORIGINAL_DATA ? data.prodDesc : data.prodDesc();
}

function restoreItem( data ) {
	data.prodId(data.backUp.prodId);
	data.prodName(data.backUp.prodName);
	data.prodDesc(data.backUp.prodDesc);
}

function addNewProduct() {
	var prodName = $("#productName").val();
	var prodDesc = $("#productDesc").val();

	if(prodName == "" || prodDesc == "" ) {
		return;
	}

	var productId = productViewModel.prodList().length;
	var newProduct = { prodId: productId, prodName: prodName, prodDesc: prodDesc};

	productViewModel.prodList().push(new Product(newProduct));
	productViewModel.refreshList();
}

function resetInput() {
	$("#productName").val("");
	$("#productDesc").val("")
}

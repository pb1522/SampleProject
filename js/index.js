$(document).ready(function() {
	//var loginViewModel = new loginViewModel();

	ko.applyBindings(new LoginViewModel());
});

function LoginViewModel() {
	var self = this;

	//self.username = ko.observable();
	//self.password = ko.observable();

	self.login = function() {
		
		//validateUser(self.username, self.password);
		window.open('http://localhost/product.html', "_self");
	};

}

function validateUser() {
	/*var user = { username: "test", password: "test"};

	var validUserName = user.username;
	var validPass = user.password;

	var user = username;
	var pass = password;*/

	//if(user == validUserName) {
		window.open('http://localhost/product.html', "_self");

	//}
}
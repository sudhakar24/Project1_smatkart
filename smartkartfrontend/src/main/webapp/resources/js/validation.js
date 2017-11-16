$(function() 
{
	$("#loginForm").validate({
		rules : {
			email : {
				required : true
			},
			password : {
				required : true
			}
		},
		messages : {
			email : {
				required : "Please enter email"
			},
			password : {
				required : "Please enter password"
			}
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#registerForm").validate({
		rules : {
			firstname : {
				required : true
			},
			email : {
				required : true,
				email : true
			},
			
			phone : {
				required : true,
				minlength : 10,
				maxlength : 10
			},
			password : {
				required : true,
				minlength : 5,
				maxlength : 15
			},
			
			address : {
				required : true
			},
			country : {
				required : true
			}
		},
		messages : {
			firstname : {
				required : "Please enter your name"
			},
			email : {
				required : "Please enter your email",
				email : "Please enter valid email"
			},
			
			
			phone : {
				required : "Please enter phone",
				minlength : "Please enter valid 10 digit mobile number",
				maxlength : "Please enter valid 10 digit mobile number"
			},
			password : {
				required : "Please enter password",
				minlength : "Your password must between 5 and 15 characters",
				maxlength : "Your password must between 5 and 15 characters"
			},
			address : {
				required : "Please enter your address"
			},
			country : {
				required : "Please enter your country"
			}
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#categoryForm").validate({
		rules : {
			catId : {
				required : true
			},
		catName : {
				required : true
			}
			
		},
		messages : {
			catId : {
				required : "Please enter category Id"
			},
		catName : {
				required : "Please enter category name"
			}
			
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#supplierForm").validate({
		rules : {
			supplierId :{
				required:true
			},
			supplierName : {
				required : true
			},
			supplierDes : {
				required : true
			},
			supplierEmail : {
				required : true,
				email : true
			}
		},
		messages : {
			supplierId : {
				required:"Please enter supplier id"
			},
			supplierName : {
				required : "Please enter supplier name"
			},
			supplierDes : {
				required : "Please enter supplier Description"
			},
			supplierEmail : {
				required : "Please enter supplier email",
				email : "Please enter valid email"
			}
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	
	$("#productForm").validate({
		rules : {
			productName : {
				required : true
			},
			productDes : {
				required : true
			},
			price : {
				required : true,
				digits : true,
				min : 1
			},
			stock : {
				required : true,
				digits : true,
				min : 1
			},
			catname: {
				required:true
	        },
	        supplierName: {
				required: true
	        },
	        pimage :{
	        	required : true
	        }
			
		},
		messages : {
			productName : {
				required : "Please enter product name"
			},
			productDes : {
				required : "Please enter product description"
			},
			price : {
				required : "Please enter product price",
				digits: "Please enter only digits",
				min: "Please enter valid product price"
			},
			stock : {
				required : "Please enter product stock",
				digits: "Please enter only digits",
				min: "Please enter valid product stock"
			},
			catname : {
				required : "Please choose a category"
			},
			supplierName : {
				required : "Please choose a supplier"
			},
			pimage : {
				required : "Please add image"
			}
			
		},
		submitHandler: function(form) {
			form.submit();
		}
	});
	$("#cartvalidator").validate({
		rules : {
			quant :
				{
				required : true,
				digits : true,
				min : 1
				},
			
		messages : {
			quant : {
				required : "Please enter quantity",
				digits: "Please enter only digits"
			}
		
	
		},
	submitHandler: function(form) {
		form.submit();
		}
		}
	});
	
});
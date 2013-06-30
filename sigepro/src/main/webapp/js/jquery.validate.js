/*
 * jQuery validation plug-in 1.5.5
 *
 * http://bassistance.de/jquery-plugins/jquery-plugin-validation/
 * http://docs.jquery.com/Plugins/Validation
 *
 * Copyright (c) 2006 - 2008 Jörn Zaefferer
 *
 * $Id: jquery.validate.js 6403 2009-06-17 14:27:16Z joern.zaefferer $
 *
 * Dual licensed under the MIT and GPL licenses:
 *   http://www.opensource.org/licenses/mit-license.php
 *   http://www.gnu.org/licenses/gpl.html
 */


(function($) {

$.extend($.fn, {
	// http://docs.jquery.com/Plugins/Validation/validate
	validate: function( options ) {

		// if nothing is selected, return nothing; can't chain anyway
		if (!this.length) {
			options && options.debug && window.console && console.warn( "nothing selected, can't validate, returning nothing" );
			return;
		}

		// check if a validator for this form was already created
		var validator = $.data(this[0], 'validator');
		if ( validator ) {
			return validator;
		}
		
		validator = new $.validator( options, this[0] );
		$.data(this[0], 'validator', validator); 
		
		if ( validator.settings.onsubmit ) {
			//alert("enbtra un formmm")
			// allow suppresing validation by adding a cancel class to the submit button
			this.find("input, button").filter(".cancel").click(function() {
				validator.cancelSubmit = true;
			});
			
	/*		if (validator.settings.algo) {
				this.find("input, button").filter(":submit").click(function() {
					validator.submitButton = this;
				});
			}*/
			
			// when a submitHandler is used, capture the submitting button
			if (validator.settings.submitHandler) {
				this.find("input, button").filter(":submit").click(function() {
					validator.submitButton = this;
				});
			}
		
			// validate the form on submit
			this.submit( function( event ) {
				if ( validator.settings.debug )
					// prevent form submit to be able to see console output
					event.preventDefault();
					
				function handle() {
					if ( validator.settings.submitHandler ) {
						if (validator.submitButton) {
							// insert a hidden input as a replacement for the missing submit button
							var hidden = $("<input type='hidden'/>").attr("name", validator.submitButton.name).val(validator.submitButton.value).appendTo(validator.currentForm);
						}
						//Aqui se ejecuta la funcion despues de submit exitoso
						validator.settings.submitHandler.call( validator, validator.currentForm );
						//validator.settings.algo.call( validator, validator.currentForm );
						if (validator.submitButton) {
							// and clean up afterwards; thanks to no-block-scope, hidden can be referenced
							hidden.remove();
						}
						return false;
					}
					return true;
				}
					
				// prevent submit for invalid forms or custom submit handlers
				if ( validator.cancelSubmit ) {
					validator.cancelSubmit = false;
					return handle();
				}
				if ( validator.form() ) {
					if ( validator.pendingRequest ) {
						validator.formSubmitted = true;
						return false;
					}
					return handle();
				} else {
					validator.focusInvalid();
					return false;
				}
			});
		}
		
		return validator;
	},
	// http://docs.jquery.com/Plugins/Validation/valid
	valid: function() {
        if ( jQuery(this[0]).is('form')) {
            return this.validate().form();
        } else {
            var valid = true;
            var validator = jQuery(this[0].form).validate();
            this.each(function() {
				valid &= validator.element(this);
            });
            return valid;
        }
    },
	// attributes: space seperated list of attributes to retrieve and remove
	removeAttrs: function(attributes) {
		var result = {},
			jQueryelement = this;
		jQuery.each(attributes.split(/\s/), function(index, value) {
			result[value] = jQueryelement.attr(value);
			jQueryelement.removeAttr(value);
		});
		return result;
	},
	// http://docs.jquery.com/Plugins/Validation/rules
	rules: function(command, argument) {
		var element = this[0];
		
		if (command) {
			var settings = jQuery.data(element.form, 'validator').settings;
			var staticRules = settings.rules;
			var existingRules = jQuery.validator.staticRules(element);
			switch(command) {
			case "add":
				jQuery.extend(existingRules, jQuery.validator.normalizeRule(argument));
				staticRules[element.name] = existingRules;
				if (argument.messages)
					settings.messages[element.name] = jQuery.extend( settings.messages[element.name], argument.messages );
				break;
			case "remove":
				if (!argument) {
					delete staticRules[element.name];
					return existingRules;
				}
				var filtered = {};
				jQuery.each(argument.split(/\s/), function(index, method) {
					filtered[method] = existingRules[method];
					delete existingRules[method];
				});
				return filtered;
			}
		}
		
		var data = jQuery.validator.normalizeRules(
		jQuery.extend(
			{},
			jQuery.validator.metadataRules(element),
			jQuery.validator.classRules(element),
			jQuery.validator.attributeRules(element),
			jQuery.validator.staticRules(element)
		), element);
		
		// make sure required is at front
		if (data.required) {
			var param = data.required;
			delete data.required;
			data = jQuery.extend({required: param}, data);
		}
		
		return data;
	}
});

// Custom selectors
jQuery.extend(jQuery.expr[":"], {
	// http://docs.jquery.com/Plugins/Validation/blank
	blank: function(a) {return !jQuery.trim(a.value);},
	// http://docs.jquery.com/Plugins/Validation/filled
	filled: function(a) {return !!jQuery.trim(a.value);},
	// http://docs.jquery.com/Plugins/Validation/unchecked
	unchecked: function(a) {return !a.checked;}
});

// constructor for validator
jQuery.validator = function( options, form ) {
	this.settings = jQuery.extend( {}, jQuery.validator.defaults, options );
	this.currentForm = form;
	this.init();
};

jQuery.validator.format = function(source, params) {
	if ( arguments.length == 1 ) 
		return function() {
			var args = jQuery.makeArray(arguments);
			args.unshift(source);
			return jQuery.validator.format.apply( this, args );
		};
	if ( arguments.length > 2 && params.constructor != Array  ) {
		params = jQuery.makeArray(arguments).slice(1);
	}
	if ( params.constructor != Array ) {
		params = [ params ];
	}
	jQuery.each(params, function(i, n) {
		source = source.replace(new RegExp("\\{" + i + "\\}", "g"), n);
	});
	return source;
};

jQuery.extend(jQuery.validator, {
	
	defaults: {
		messages: {},
		groups: {},
		rules: {},
		errorClass: "error",
		validClass: "valid",
		errorElement: "label",
		focusInvalid: true,
		errorContainer: jQuery( [] ),
		errorLabelContainer: jQuery( [] ),
		onsubmit: true,
		ignore: [],
		ignoreTitle: false,
		
		onfocusin: function(element) {
			this.lastActive = element;
				
			// hide error label and remove error class on focus if enabled
		/*	if ( this.settings.focusCleanup && !this.blockFocusCleanup ) {
				this.settings.unhighlight && this.settings.unhighlight.call( this, element, this.settings.errorClass, this.settings.validClass );
				this.errorsFor(element).hide();
			}*/
			if ( element.name in this.submitted ){
				if (this.element(element)==false){
					jQuery(element).btOn();
				}
			}
		},
		onfocusout: function(element) {
//			if ( !this.checkable(element) && (element.name in this.submitted || !this.optional(element)) ) {
			if ( !this.checkable(element) && (element.name in this.submitted) ) {
				if(this.element(element)==true){
					var name = jQuery(element).attr("name");
					if (name.indexOf('_sexyCombo')!='-1'){
						jQuery('div[htmlfor='+name+']').remove();	
					}
				}
			}
			jQuery(element).btOn().stop().btOff();
		},
		onkeyup: function(element) {
			if (jQuery(element).val()!=""){
				if ( element.name in this.submitted || element == this.lastElement ) {
					if (this.element(element)==true){
						jQuery(element).btOn().stop().btOff();
						//alert("entra");
						var name = jQuery(element).attr("name");
						if (name.indexOf('_sexyCombo')!='-1'){
							jQuery('div[htmlfor='+name+']').remove();	
						}						
					}
					else{
	                    if (typeof $(element).data('bt-box') != 'object') {
	                    jQuery(element).btOn();
	                    }
	                    }
				}
			}	
		},
		onclick: function(element) {
			if ( element.name in this.submitted )
				if(this.element(element)==true){
					if (jQuery(element).attr('type')=="radio"){
						jQuery('input[type=radio][name='+element.name+']').each(function (i){
							$(this).parent().unbind("mouseover").unbind("mouseout");
						
							$(this).attr("class","");	
							$(this).parent().attr("class","");
							
							});
					}
				}
		},
		highlight: function( element, errorClass, validClass ) {
			jQuery(element).addClass(errorClass).removeClass(validClass);
		},
		unhighlight: function( element, errorClass, validClass ) {
			jQuery(element).removeClass(errorClass).addClass(validClass);
		}
	},

	// http://docs.jquery.com/Plugins/Validation/Validator/setDefaults
	setDefaults: function(settings) {
		jQuery.extend( jQuery.validator.defaults, settings );
	},

	messages: {
		required: "",
		remote: "",
		email: "",
		url: "",
		date: "",
		dateISO: "",
		dateDE: "",
		dateFormat: "",
		dateValid: "",
		dateRange: "",
		number: "",
		numberDE: "",
		digits: "",
		creditcard: "",
		equalTo: "",
		accept: "",
		maxlength: jQuery.validator.format("Please enter no more than {0} characters."),
		minlength: jQuery.validator.format("Please enter at least {0} characters."),
		rangelength: jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
		range: jQuery.validator.format("Please enter a value between {0} and {1}."),
		max: jQuery.validator.format("Please enter a value less than or equal to {0}."),
		min: jQuery.validator.format("Please enter a value greater than or equal to {0}.")
	},
	
	autoCreateRanges: false,
	
	prototype: {
		
		init: function() {
			this.labelContainer = jQuery(this.settings.errorLabelContainer);
			this.errorContext = this.labelContainer.length && this.labelContainer || jQuery(this.currentForm);
			this.containers = jQuery(this.settings.errorContainer).add( this.settings.errorLabelContainer );
			this.submitted = {};
			this.valueCache = {};
			this.pendingRequest = 0;
			this.pending = {};
			this.invalid = {};
			this.reset();
			this.formTrigger=0;
			
			var groups = (this.groups = {});
			jQuery.each(this.settings.groups, function(key, value) {
				jQuery.each(value.split(/\s/), function(index, name) {
					groups[name] = key;
				});
			});
			var rules = this.settings.rules;
			jQuery.each(rules, function(key, value) {
				rules[key] = jQuery.validator.normalizeRule(value);
			});
			
			function delegate(event) {
				var validator = jQuery.data(this[0].form, "validator");
				validator.settings["on" + event.type] && validator.settings["on" + event.type].call(validator, this[0] );
			}
			jQuery(this.currentForm)
				.delegate("focusin focusout keyup", ":text, :password, :file, select, textarea", delegate)
				.delegate("click", ":radio, :checkbox", delegate);

			if (this.settings.invalidHandler)
				jQuery(this.currentForm).bind("invalid-form.validate", this.settings.invalidHandler);
		},

		// http://docs.jquery.com/Plugins/Validation/Validator/form
		form: function() {
			this.checkForm();
			jQuery.extend(this.submitted, this.errorMap);
			this.invalid = jQuery.extend({}, this.errorMap);
			if (!this.valid())
				jQuery(this.currentForm).triggerHandler("invalid-form", [this]);
			//alert("buscando ya en el form!");
			this.formTrigger=1;
			this.showErrors();
			//alert("form"+this.formTrigger);
			return this.valid();
		},
		
		//Método agregado para validar al instante
		elementNow: function(element) {
			if (jQuery(element).val()!=""){

				if (this.element(element)==true){
						jQuery(element).btOn().stop().btOff();
						jQuery(element).css("color", "");
						//alert("entra");
						var name = jQuery(element).attr("name");
						if (name.indexOf('_sexyCombo')!='-1'){
							jQuery('div[htmlfor='+name+']').remove();	
							jQuery(element).css("color", "");
						}
						if(jQuery(element).attr('class')=='fieldsetType valid'){
							   if (typeof jQuery("#"+element.name).data('bt-box') == 'object') {
									jQuery("#"+element.name).btOff();
						       }
						       jQuery("#"+element.name).css("border","").unbind("mouseover").
								unbind("mouseout");
						}
					return true;	
					}
					else{
	                    if (typeof $(element).data('bt-box') != 'object') {
	                    jQuery(element).btOn();
	                    }
	                return false;
	                }
				
			}	
		},
		
		checkForm: function() {
			this.prepareForm();
			for ( var i = 0, elements = (this.currentElements = this.elements()); elements[i]; i++ ) {
				this.check( elements[i] );
			}
			return this.valid(); 
		},
		
		// http://docs.jquery.com/Plugins/Validation/Validator/element
		element: function( element ) {
			element = this.clean( element );
			this.lastElement = element;
			this.prepareElement( element );
			this.currentElements = jQuery(element);
			var result = this.check( element );
			if ( result ) {
				delete this.invalid[element.name];
			} else {
				this.invalid[element.name] = true;
			}
			if ( !this.numberOfInvalids() ) {
				// Hide error containers on last error
				this.toHide = this.toHide.add( this.containers );
			}
			//alert("sera che element");
			this.showErrors();
			return result;
		},

		// http://docs.jquery.com/Plugins/Validation/Validator/showErrors
		showErrors: function(errors) {
			if(errors) {
				// add items to error list and map
				jQuery.extend( this.errorMap, errors );
				this.errorList = [];
				for ( var name in errors ) {
					this.errorList.push({
						message: errors[name],
						element: this.findByName(name)[0]
					});
				}
				// remove items from success list
				this.successList = jQuery.grep( this.successList, function(element) {
					return !(element.name in errors);
				});
			}
			//alert("pasa x aca");
			this.settings.showErrors
				? this.settings.showErrors.call( this, this.errorMap, this.errorList )
				: this.defaultShowErrors();
		},
		
		// http://docs.jquery.com/Plugins/Validation/Validator/resetForm
		resetForm: function() {
			if ( jQuery.fn.resetForm )
				jQuery( this.currentForm ).resetForm();
			this.submitted = {};
			//Agrega los labes de error a toHide para ser oculto por hideErrors
			//Oculta los iconos de error de inputs
			this.prepareForm();
			this.hideErrors();
			//alert("form:"+this.currentForm.id+" algo:"+this.errorContext.toString());
			
			//Oculta el icono de error de los sexyC
			jQuery("div[class=error2]",this.errorContext).hide();
			//Agregado para remover el class de los inputs con class error del form
			jQuery("input[class="+this.settings.errorClass+"]",  this.errorContext).removeClass(""+this.settings.errorClass).css("color","");
			jQuery("textarea[class="+this.settings.errorClass+"]",  this.errorContext).removeClass(""+this.settings.errorClass).css("color","");

			this.lastElement = {};
			this.elements().removeClass( this.settings.errorClass );
			//Para sexyCombo incluido, remueve el color rojo de todos los elementos con error
			// si es que no fue alcanzado por el anterior selector que nos remueve
			this.elements().css("color","");
			
		},
		
		numberOfInvalids: function() {
			return this.objectLength(this.invalid);
		},
		
		objectLength: function( obj ) {
			var count = 0;
			for ( var i in obj )
				count++;
			return count;
		},
		
		hideErrors: function() {
			this.addWrapper( this.toHide ).hide();
			//this.addWrapper( this.toHide ).btOff();
		},
		
		valid: function() {
			return this.size() == 0;
		},
		
		size: function() {
			return this.errorList.length;
		},
		
		focusInvalid: function() {
			if( this.settings.focusInvalid ) {
				try {
					jQuery(this.findLastActive() || this.errorList.length && this.errorList[0].element || []).filter(":visible").focus().btOn();
					//jQuery(this.lastActive)
				} catch(e) {
					// ignore IE throwing errors when focusing hidden elements
				}
			}
		},
		
		findLastActive: function() {
			var lastActive = this.lastActive;
			return lastActive && jQuery.grep(this.errorList, function(n) {
				return n.element.name == lastActive.name;
			}).length == 1 && lastActive;
		},
		
		elements: function() {
			var validator = this,
				rulesCache = {};
			
			// select all valid inputs inside the form (no submit or reset buttons)
			// workaround jQueryQuery([]).add until http://dev.jquery.com/ticket/2114 is solved
			return jQuery([]).add(this.currentForm.elements)
			.filter(":input")
			.not(":submit, :reset, :image, [disabled]")
			.not( this.settings.ignore )
			.filter(function() {
				!this.name && validator.settings.debug && window.console && console.error( "%o has no name assigned", this);
			
				// select only the first element for each name, and only those with rules specified
				if ( this.name in rulesCache || !validator.objectLength(jQuery(this).rules()) )
					return false;
				
				rulesCache[this.name] = true;
				return true;
			});
		},
		
		clean: function( selector ) {
			return jQuery( selector )[0];
		},
		
		errors: function() {
			return jQuery( this.settings.errorElement + "." + this.settings.errorClass, this.errorContext );
		},
		
		reset: function() {
			this.successList = [];
			this.errorList = [];
			this.errorMap = {};
			this.toShow = jQuery([]);
			this.toHide = jQuery([]);
			this.formSubmitted = false;
			this.currentElements = jQuery([]);
			this.formTrigger=0;
			
		},
		
		prepareForm: function() {
			this.reset();
			this.toHide = this.errors().add( this.containers );
			this.toHideInput = this.errors();
		},
		
		prepareElement: function( element ) {
			this.reset();
			this.toHide = this.errorsFor(element);
		},
	
		check: function( element ) {
			element = this.clean( element );
			
			// if radio/checkbox, validate first element in group instead
			if (this.checkable(element)) {
				element = this.findByName( element.name )[0];
			}
			
			var rules = jQuery(element).rules();
			var dependencyMismatch = false;
			for( method in rules ) {
				var rule = { method: method, parameters: rules[method] };
				try {
					var result;
					//CAMBIADO POR MI PARA LA FUNCION REQUERIDED
					if (method=="required"){
						var message = this.defaultMessage(element, rule.method );
						//alert("el mensaje es:"+message);
						result = jQuery.validator.methods[method].call( this, element.value.replace(/\r/g, ""), element, rule.parameters,message );
					}
					else{					
					result = jQuery.validator.methods[method].call( this, element.value.replace(/\r/g, ""), element, rule.parameters );
					}
		
					
					// if a method indicates that the field is optional and therefore valid,
					// don't mark it as valid when there are no other rules
					if ( result == "dependency-mismatch" ) {
						dependencyMismatch = true;
						continue;
					}
					dependencyMismatch = false;
					
					if ( result == "pending" ) {
						this.toHide = this.toHide.not( this.errorsFor(element) );
						return;
					}
					
					if( !result ) {
						this.formatAndAdd( element, rule );
						return false;
					}
				} catch(e) {
					this.settings.debug && window.console && console.log("exception occured when checking element " + element.id
						 + ", check the '" + rule.method + "' method");
					throw e;
				}
			}
			if (dependencyMismatch)
				return;
			if ( this.objectLength(rules) )
				this.successList.push(element);
			return true;
		},
		
		// return the custom message for the given element and validation method
		// specified in the element's "messages" metadata
		customMetaMessage: function(element, method) {
			if (!jQuery.metadata)
				return;
			
			var meta = this.settings.meta
				? jQuery(element).metadata()[this.settings.meta]
				: jQuery(element).metadata();
			
			return meta && meta.messages && meta.messages[method];
		},
		
		// return the custom message for the given element name and validation method
		customMessage: function( name, method ) {
			var m = this.settings.messages[name];
			return m && (m.constructor == String
				? m
				: m[method]);
		},
		
		// return the first defined argument, allowing empty strings
		findDefined: function() {
			for(var i = 0; i < arguments.length; i++) {
				if (arguments[i] !== undefined)
					return arguments[i];
			}
			return undefined;
		},
		
		defaultMessage: function( element, method) {
			return this.findDefined(
				this.customMessage( element.name, method ),
				this.customMetaMessage( element, method ),
				// title is never undefined, so handle empty string as undefined
				!this.settings.ignoreTitle && element.title || undefined,
				jQuery.validator.messages[method],
				"<strong>Warning: No message defined for " + element.name + "</strong>"
			);
		},
		
		formatAndAdd: function( element, rule ) {
			var message = this.defaultMessage( element, rule.method );
			if ( typeof message == "function" ) 
				message = message.call(this, rule.parameters, element);
			this.errorList.push({
				message: message,
				element: element
			});
			this.errorMap[element.name] = message;
			this.submitted[element.name] = message;
		},
		
		addWrapper: function(toToggle) {
			if ( this.settings.wrapper ){
				alert("entra toogle?");
				toToggle = toToggle.add( toToggle.parent( this.settings.wrapper ) );
			}
			return toToggle;
		},
		
		defaultShowErrors: function() {
			//alert("contando errores");
			for ( var i = 0; this.errorList[i]; i++ ) {
				var error = this.errorList[i];
				this.settings.highlight && this.settings.highlight.call( this, error.element, this.settings.errorClass, this.settings.validClass );
				this.showLabel( error.element, error.message );
				this.applyEmptyText( error.element, error.message);
			}
			this.formTrigger=0;
			//alert("default");
			if( this.errorList.length ) {
				//alert("a mostrar errores");
				this.toShow = this.toShow.add( this.containers );
			}
			if (this.settings.success) {
			//	alert("success");
				for ( var i = 0; this.successList[i]; i++ ) {
					this.showLabel( this.successList[i] );
				}
			}
			if (this.settings.unhighlight) {
				for ( var i = 0, elements = this.validElements(); elements[i]; i++ ) {
					this.settings.unhighlight.call( this, elements[i], this.settings.errorClass, this.settings.validClass );
				}
			}
			this.toHide = this.toHide.not( this.toShow );
			//alert("a ocultar");
			this.hideErrors();
			//Parcheado
			this.addWrapper( this.toShow ).show().css("display","inline");
		
		},
		
		//Function para aparecer y desaparecer texto en el input al darse un error
		applyEmptyText: function(element, message) {
			

				if 	 (jQuery(element).val()=="") {
					jQuery(element).val(message).css("color","red");
				}
				else if (jQuery(element).attr("name").indexOf('_sexyCombo')!='-1'){
					jQuery(element).css("color","red");
				}
				
				
		    jQuery(element).bind("focus", function() {
		    	 if (jQuery(element).val()==message) {
		   		    jQuery(element).val("").css("color","");
		   		    //alert("borrado");
		   	        }
		    	 else{
		    		 jQuery(element).css("color","");
		    	 }
		    });
		    
			return;
	    },
		
	    validElements: function() {
			return this.currentElements.not(this.invalidElements());
		},
		
		invalidElements: function() {
			return jQuery(this.errorList).map(function() {
				return this.element;
			});
		},
		
		showLabel: function(element, message) {
			var label = this.errorsFor( element );
			
			if ( label.length ) {
				// refresh error/success class
				label.removeClass().addClass( this.settings.errorClass );
			
				// check if we have a generated label, replace the message then
				label.attr("generated") && label.html();
				
				//set the tooltip message for next time it show 
				jQuery(element).newMessage(message);
				
				//get the tooltip message at the moment
				var text = jQuery(element).getTextMessage();
				//if there is more than one rule validating the input and the message
				//of rules are different, the tooltip will change of message
				if (text!="" && text!=message){
				    if (typeof $(element).data('bt-box') == 'object') {
					jQuery(element).btOff().stop().btOn();	
	                 }
				}
				//only for testing		
				//jQuery('#texto').html(jQuery('#texto').html()+" "+message);
			} else {
				// create label
				label = jQuery("<" + this.settings.errorElement + "/>")
					.attr({"for":  this.idOrName(element), generated: true})
					.addClass(this.settings.errorClass);
					//.html(message || "");
				if ( this.settings.wrapper ) {
					// make sure the element is visible, even in IE
					// actually showing the wrapped element is handled elsewhere
					label = label.hide().show().wrap("<" + this.settings.wrapper + "/>").parent();
				}
				if ( !this.labelContainer.append(label).length ){
					//if the field is a sexy combo, change the way error is show
					//creating a special tag so the image is properly showed
					if (jQuery(element).attr("name").indexOf('_sexyCombo')!='-1'){
						label = jQuery("<div/>")
						.attr({"for":  this.idOrName(element), generated: true})
						.addClass('error2');
						if (jQuery(element).next().next().next().attr('class')!="error2")
								label.insertAfter(jQuery(element).next().next());	
						else jQuery(element).next().next().next().show();
					}
					else{
						if (jQuery(element).attr("type")=='radio'){
							//if is a radio button, create a special tag span
							//if already created, dont create it again
							
							var attrValue = jQuery(element).parent().attr('generated');
							if (attrValue!='true'){
								jQuery('input[type=radio][name='+element.name+']').each(function (i){
									
									var aSpan='<span generated="true" class="errorRadio"></span>';
									if (!navigator.userAgent.match(/mozilla/i) && 
									        ! navigator.userAgent.match(/webkit/i )){
										aSpan='<span generated="true" class=""></span>';
										$(this).addClass("errorRadio");
										}
									$(this).wrapAll(aSpan);
									});
								
								var inputRadio = jQuery('input[type=radio][name='+element.name+']').parent();
								for (var i=0;inputRadio.length>i; i++){
									this.createToolTip(inputRadio[i], message, 'none');
									jQuery(inputRadio[i]).mouseover(function(e){this.btOn();})
									.mouseout(function(){this.btOff();});
;
								}
							}
							if (attrValue=='true'){ 
								jQuery('input[type=radio][name='+element.name+']').each(function (i){
									$(this).parent().addClass("error");
									});
								}
						}
						else{
							var classEspecialE = jQuery(element).attr('class');
							if((classEspecialE=='fieldsetType error') || (classEspecialE=='fieldsetType error bt-active')){
								 jQuery("#"+element.name).css("border","2px solid red");
								 var elementfield =jQuery("#"+element.name);
								 var functionField =  function(objectV){objectV.elementNow(element)};
								 var thisObject = this;
								 
								 if(elementfield.attr("special")!="special"){
									 this.createToolTip(elementfield, message, 'none');
									 elementfield.attr("special","special");
									 elementfield.find("input[type=checkbox]")
										.bind("click",function(){functionField.call(this,thisObject);});
								 }
								
								elementfield.mouseover(function(e){this.btOn();})
										.mouseout(function(){this.btOff();});
							}
						else{	
								//Se crea el tolltip
								this.createToolTip(element, message, 'none');
							if (jQuery(element).attr("validation")=="calendar"){
								label.insertAfter(jQuery(element).next());	
							}
							else{
							this.settings.errorPlacement
								? this.settings.errorPlacement(label, jQuery(element) )
								: label.insertAfter(element);
							}
					    }
						}		
					}
				}
				
			}
			if ( !message && this.settings.success ) {
				alert("corregido!");
				label.text("");
				typeof this.settings.success == "string"
					? label.addClass( this.settings.success )
					: this.settings.success( label );
			}
			this.toShow = this.toShow.add(label);
		},
		//Aca se crea el mensaje de ayuda que se muestra en el globo
		createToolTip:function(element, message,triggerType){
		
		jQuery(element).bt(''+message,
				 {showTip: function(box){
		    	 			jQuery(box).fadeIn(300);
		  					},
		 		  trigger: [''+triggerType],
		  		  strokeStyle: '#D92929', //color del borde del globo'#0080FF' 
				  positions: ['right','left','top'],
				  fill: '#FFF',  //color de relleno del globo
				  spikeLength: 10, //Largo de la flecha
				  spikeGirth: 10, //Ancho de la flecha
				  width: 150,
				  shrinkToFit: true,
				  padding: 8,      //Espacio de separacion entre el texto y el globo
				  cornerRadius: 5, //radio de las esquinas del globo
				  //overlap: -10,
				  cssStyles: {
					    fontFamily: '"lucida grande",tahoma,verdana,arial,sans-serif', 
					    fontSize: '11px',
					    fontStyle: 'italic'
					  }
				 });
		},	
		
		isLowerDate: function(init,end){

			var dia1 = init.substring(0, 2);
			var mes1 = init.substring(3, 5);
			var anio1 = init.substring(6, 10);
			var fechaInicio = new Date(anio1, mes1, dia1);

			var dia2 = end.substring(0, 2);
			var mes2 = end.substring(3, 5);
			var anio2 = end.substring(6, 10);

			var fechaTermino = new Date(anio2, mes2, dia2);



			if (fechaInicio <= fechaTermino) {
				return  true;
			} else {
				return false;
			}
		},
		
		isDateBetween: function(pattern,first,last,middle){

			if (pattern=='dd/mm/yyyy'){
			var dia = first.substring(0, 2);
			var mes = first.substring(3, 5);
			var anio = first.substring(6, 10);
			var fechaInicio = new Date(anio, mes, dia);

			dia = last.substring(0, 2);
			mes = last.substring(3, 5);
			anio = last.substring(6, 10);
			var fechaTermino = new Date(anio, mes, dia);
			
			dia = middle.substring(0, 2);
			mes = middle.substring(3, 5);
			anio = middle.substring(6, 10);
			var fechaMedio = new Date(anio, mes, dia);
			}
			else{return false;}  //Implementar para otro patron
			
			if ((fechaInicio <= fechaMedio) && (fechaMedio <= fechaTermino)) {
				return  true;
			} else {
				return false;
			}
		},
		
		isValidDatePattern: function( dateParam , patternParam ){
			
			var validPattern = false;    
			var pattern;
			
			if ( patternParam == 'dd/mm/yyyy' ){
		    	pattern = /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/;
		    }
		    else if ( patternParam == 'dd-mm-yyyy' ){
		    	pattern = /^[0-9]{2}\-[0-9]{2}\-[0-9]{4}$/;
		    }    
			
			if ( pattern.exec ( dateParam ) ) {
				validPattern = true;
			}
			return validPattern;
		    
		},

		isValidDate: function( dateParam, patternParam ){
			
			var valid = true;
			var dia,mes,anio;		
			if (( patternParam == 'dd/mm/yyyy') || ( patternParam == 'dd-mm-yyyy' )){
				dia  = dateParam.substring(0, 2);
			    mes  = dateParam.substring(3, 5);
			    anio = dateParam.substring(6, 10); 
			} 
			else{
				jAlert("Unknow pattern");  
				return null;  
			}
			if ( mes > 12 ){
				valid = false;
			}	
			else if (mes == 2 ) {
				if ( ( ( anio % 4 )== 0 ) && ( dia > 29 || dia < 1 ) ){
		            valid = false;
		        }
		        if ( ( (anio % 4 ) != 0 ) && (dia > 28 || dia < 1) ){
		            valid = false;
		        }                        
			}	    
		    else if ( ( mes == '04' || mes == '06' || mes == '09' || mes == '11' ) && ( dia > 30 || dia < 1 ) ){
		        	valid = false;
		    }
		    else if( ( mes == '01' || mes == '03' || mes == '05' || mes == '07' || mes == '08' || mes == '10' || mes == '12' ) 
		    		&& ( dia > 31 || dia < 1 ) ){
		            valid = false;
		        }    
		    
			
			return valid;
		},
		 
		
		errorsFor: function(element) {
			return this.errors().filter("[for='" + this.idOrName(element) + "']");
		},
		
		idOrName: function(element) {
			return this.groups[element.name] || (this.checkable(element) ? element.name : element.id || element.name);
		},

		checkable: function( element ) {
			return /radio|checkbox/i.test(element.type);
		},
		
		findByName: function( name ) {
			// select by name and filter by form for performance over form.find("[name=...]")
			var form = this.currentForm;
			return jQuery(document.getElementsByName(name)).map(function(index, element) {
				return element.form == form && element.name == name && element  || null;
			});
		},
		
		getLength: function(value, element) {
			switch( element.nodeName.toLowerCase() ) {
			case 'select':
				return jQuery("option:selected", element).length;
			case 'input':
				if( this.checkable( element) )
					return this.findByName(element.name).filter(':checked').length;
			}
			return value.length;
		},
	
		depend: function(param, element) {
			return this.dependTypes[typeof param]
				? this.dependTypes[typeof param](param, element)
				: true;
		},
	
		dependTypes: {
			"boolean": function(param, element) {
			//alert("entra aca cuando es required=true/false");
				return param;
			},
			"string": function(param, element) {
				return !!jQuery(param, element.form).length;
			},
			"function": function(param, element) {
				return param(element);
			}
		},
		
		optional: function(element) {
			return !jQuery.validator.methods.required.call(this, jQuery.trim(element.value), element) && "dependency-mismatch";
		},
		
		startRequest: function(element) {
			if (!this.pending[element.name]) {
				this.pendingRequest++;
				this.pending[element.name] = true;
			}
		},
		
		stopRequest: function(element, valid) {
			this.pendingRequest--;
			// sometimes synchronization fails, make sure pendingRequest is never < 0
			if (this.pendingRequest < 0)
				this.pendingRequest = 0;
			delete this.pending[element.name];
			if ( valid && this.pendingRequest == 0 && this.formSubmitted && this.form() ) {
				jQuery(this.currentForm).submit();
			} else if (!valid && this.pendingRequest == 0 && this.formSubmitted) {
				jQuery(this.currentForm).triggerHandler("invalid-form", [this]);
			}
		},
		
		previousValue: function(element) {
			return jQuery.data(element, "previousValue") || jQuery.data(element, "previousValue", previous = {
				old: null,
				valid: true,
				message: this.defaultMessage( element, "remote" )
			});
		}
		
	},
	
	classRuleSettings: {
		required: {required: true},
		email: {email: true},
		url: {url: true},
		date: {date: true},
		dateISO: {dateISO: true},
		dateDE: {dateDE: true},
		number: {number: true},
		numberDE: {numberDE: true},
		digits: {digits: true},
		creditcard: {creditcard: true}
	},
	
	addClassRules: function(className, rules) {
		className.constructor == String ?
			this.classRuleSettings[className] = rules :
			jQuery.extend(this.classRuleSettings, className);
	},
	
	classRules: function(element) {
		var rules = {};
		var classes = jQuery(element).attr('class');
		classes && jQuery.each(classes.split(' '), function() {
			if (this in jQuery.validator.classRuleSettings) {
				jQuery.extend(rules, jQuery.validator.classRuleSettings[this]);
			}
		});
		return rules;
	},
	
	attributeRules: function(element) {
		var rules = {};
		var jQueryelement = jQuery(element);
		
		for (method in jQuery.validator.methods) {
			var value = jQueryelement.attr(method);
			if (value) {
				rules[method] = value;
			}
		}
		
		// maxlength may be returned as -1, 2147483647 (IE) and 524288 (safari) for text inputs
		if (rules.maxlength && /-1|2147483647|524288/.test(rules.maxlength)) {
			delete rules.maxlength;
		}
		
		return rules;
	},
	
	metadataRules: function(element) {
		if (!jQuery.metadata) return {};
		
		var meta = jQuery.data(element.form, 'validator').settings.meta;
		return meta ?
			jQuery(element).metadata()[meta] :
			jQuery(element).metadata();
	},
	
	staticRules: function(element) {
		var rules = {};
		var validator = jQuery.data(element.form, 'validator');
		//Agregado
		if (validator!=null)
		if (validator.settings.rules) {
			rules = jQuery.validator.normalizeRule(validator.settings.rules[element.name]) || {};
		}
		return rules;
	},
	
	normalizeRules: function(rules, element) {
		// handle dependency check
		jQuery.each(rules, function(prop, val) {
			// ignore rule when param is explicitly false, eg. required:false
			if (val === false) {
				delete rules[prop];
				return;
			}
			if (val.param || val.depends) {
				var keepRule = true;
				switch (typeof val.depends) {
					case "string":
						keepRule = !!jQuery(val.depends, element.form).length;
						break;
					case "function":
						keepRule = val.depends.call(element, element);
						break;
				}
				if (keepRule) {
					rules[prop] = val.param !== undefined ? val.param : true;
				} else {
					delete rules[prop];
				}
			}
		});
		
		// evaluate parameters
		jQuery.each(rules, function(rule, parameter) {
			rules[rule] = jQuery.isFunction(parameter) ? parameter(element) : parameter;
		});
		
		// clean number parameters
		jQuery.each(['minlength', 'maxlength', 'min', 'max'], function() {
			if (rules[this]) {
				rules[this] = Number(rules[this]);
			}
		});
		jQuery.each(['rangelength', 'range'], function() {
			if (rules[this]) {
				rules[this] = [Number(rules[this][0]), Number(rules[this][1])];
			}
		});
		
		if (jQuery.validator.autoCreateRanges) {
			// auto-create ranges
			if (rules.min && rules.max) {
				rules.range = [rules.min, rules.max];
				delete rules.min;
				delete rules.max;
			}
			if (rules.minlength && rules.maxlength) {
				rules.rangelength = [rules.minlength, rules.maxlength];
				delete rules.minlength;
				delete rules.maxlength;
			}
		}
		
		// To support custom messages in metadata ignore rule methods titled "messages"
		if (rules.messages) {
			delete rules.messages
		}
		
		return rules;
	},
	
	// Converts a simple string to a {string: true} rule, e.g., "required" to {required:true}
	normalizeRule: function(data) {
		if( typeof data == "string" ) {
			var transformed = {};
			jQuery.each(data.split(/\s/), function() {
				transformed[this] = true;
			});
			data = transformed;
		}
		return data;
	},
	
	// http://docs.jquery.com/Plugins/Validation/Validator/addMethod
	addMethod: function(name, method, message) {
		jQuery.validator.methods[name] = method;
		jQuery.validator.messages[name] = message || jQuery.validator.messages[name];
		if (method.length < 3) {
			jQuery.validator.addClassRules(name, jQuery.validator.normalizeRule(name));
		}
	},
	
	
	methods: {

		// http://docs.jquery.com/Plugins/Validation/Methods/required
		required: function(value, element, param, message) {
			//alert("requerido");
			// check if dependency is met
			if ( !this.depend(param, element) )
				return "dependency-mismatch";
			switch( element.nodeName.toLowerCase() ) {
			case 'select':
				var options = jQuery("option:selected", element);
				return options.length > 0 && ( element.type == "select-multiple" || (jQuery.browser.msie && !(options[0].attributes['value'].specified) ? options[0].text : options[0].value).length > 0);
			case 'input':
				if ( this.checkable(element) )
					return this.getLength(value, element) > 0;
			default:
				if (message==value) return false;
				else{
				return jQuery.trim(value).length > 0;
				}
			}
		},
		
/*		notEmpty: function(value, element, param, message) {
			if ( !this.depend(param, element) )
				return "dependency-mismatch";
			switch( element.nodeName.toLowerCase() ) {
			case 'select':
				var options = jQuery("option:selected", element);
				return options.length > 0 && ( element.type == "select-multiple" || (jQuery.browser.msie && !(options[0].attributes['value'].specified) ? options[0].text : options[0].value).length > 0);
			case 'input':
				if ( this.checkable(element) )
					return this.getLength(value, element) > 0;
			default:
				
				var id = param[0];
				var numElements = param[1];
			    jQuery(id+'input[class=error]:eq()');
				
				return false;
		},*/
		
		// http://docs.jquery.com/Plugins/Validation/Methods/remote
		remote: function(value, element, param) {
			if ( this.optional(element) )
				return "dependency-mismatch";
			
			var previous = this.previousValue(element);
			
			if (!this.settings.messages[element.name] )
				this.settings.messages[element.name] = {};
			this.settings.messages[element.name].remote = typeof previous.message == "function" ? previous.message(value) : previous.message;
			
			param = typeof param == "string" && {url:param} || param; 
			
			if ( previous.old !== value ) {
				previous.old = value;
				var validator = this;
				this.startRequest(element);
				var data = {};
				data[element.name] = value;
				jQuery.ajax(jQuery.extend(true, {
					url: param,
					mode: "abort",
					port: "validate" + element.name,
					dataType: "json",
					data: data,
					success: function(response) {
						var valid = response === true;
						if ( valid ) {
							var submitted = validator.formSubmitted;
							validator.prepareElement(element);
							validator.formSubmitted = submitted;
							validator.successList.push(element);
							validator.showErrors();
						} else {
							var errors = {};
							errors[element.name] = previous.message = response || validator.defaultMessage( element, "remote" );
							validator.showErrors(errors);
						}
						previous.valid = valid;
						validator.stopRequest(element, valid);
					}
				}, param));
				return "pending";
			} else if( this.pending[element.name] ) {
				return "pending";
			}
			return previous.valid;
		},

		// http://docs.jquery.com/Plugins/Validation/Methods/minlength
		minlength: function(value, element, param) {
			return this.optional(element) || this.getLength(jQuery.trim(value), element) >= param;
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/maxlength
		maxlength: function(value, element, param) {
			return this.optional(element) || this.getLength(jQuery.trim(value), element) <= param;
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/rangelength
		rangelength: function(value, element, param) {
			var length = this.getLength(jQuery.trim(value), element);
			return this.optional(element) || ( length >= param[0] && length <= param[1] );
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/min
		min: function( value, element, param ) {
			return this.optional(element) || value >= param;
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/max
		max: function( value, element, param ) {
			return this.optional(element) || value <= param;
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/range
		range: function( value, element, param ) {
			return this.optional(element) || ( value >= param[0] && value <= param[1] );
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/email
		email: function(value, element) {
			// contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
			return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(value);
		},
	
		// http://docs.jquery.com/Plugins/Validation/Methods/url
		url: function(value, element) {
			// contributed by Scott Gonzalez: http://projects.scottsplayground.com/iri/
			return this.optional(element) || /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\jQuery&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\jQuery&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\jQuery&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\jQuery&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\jQuery&'\(\)\*\+,;=]|:|@)|\/|\?)*)?jQuery/i.test(value);
		},
        
		// http://docs.jquery.com/Plugins/Validation/Methods/date
		date: function(value, element) {
			return this.optional(element) || !/Invalid|NaN/.test(new Date(value));
		},
	
		// http://docs.jquery.com/Plugins/Validation/Methods/dateISO
		dateISO: function(value, element) {
			return this.optional(element) || /^\d{4}[\/-]\d{1,2}[\/-]\d{1,2}jQuery/.test(value);
		},
	
		// http://docs.jquery.com/Plugins/Validation/Methods/dateDE
		dateDE: function(value, element) {
			return this.optional(element) || /^\d\d?\.\d\d?\.\d\d\d?\d?jQuery/.test(value);
		},
		
		dateFormat: function(value, element) {
			if (value=="") return true;
			var booleanValue = this.isValidDatePattern( value ,"dd/mm/yyyy");
			return booleanValue;
		},
		
		dateValid: function(value, element) {
			if (value=="") return true;
			var booleanValue = this.isValidDate( value ,"dd/mm/yyyy");
			return booleanValue;
		},
		
		//Date Higer than
		dateHigherThan: function(value, element,param) {
			if ((this.isValidDatePattern( jQuery(param).val() ,"dd/mm/yyyy")) && (this.isValidDate( jQuery(param).val() ,"dd/mm/yyyy"))){
			var booleanValue = this.isLowerDate(jQuery(param).val(),value);
			return booleanValue;
			}
			else{
				return true;	
			}
		},
		//Date lower than
		dateLowerThan: function(value, element,param) {
			if ((this.isValidDatePattern(jQuery(param).val() ,"dd/mm/yyyy")) && (this.isValidDate( jQuery(param).val() ,"dd/mm/yyyy"))){
			var booleanValue = this.isLowerDate(value,jQuery(param).val());
			return booleanValue;
			}
			else{
			return true;	
			}
		},
		//Date between 2 dates
		dateRange: function(value, element,param) {
			if (value=="") return true;
			var booleanValue = this.isDateBetween(param[0],param[1],param[2],value);
			return booleanValue;
		},
	
		// http://docs.jquery.com/Plugins/Validation/Methods/number
		number: function(value, element) {
			alert("asd"+value+element);
			return this.optional(element) || /^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?jQuery/.test(value);
		},
	
		// http://docs.jquery.com/Plugins/Validation/Methods/numberDE
		numberDE: function(value, element) {
			return this.optional(element) || /^-?(?:\d+|\d{1,3}(?:\.\d{3})+)(?:,\d+)?jQuery/.test(value);
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/digits
		digits: function(value, element) {
			//alert(value+""+/^\d+jQuery/.test(value));
			return this.optional(element) || (isNaN(value)==false);
		},
		
		
		digitsAux: function(value, element) {
			return this.optional(element) || /^[0-9]{1,50}$/.test(value);
		},
		
		onlyDigits: function(value, element) {
			return this.optional(element) || /^[0-9]{1,50}$/.test(value);
		},
		
		onlyLetters: function(value, element) {
			return this.optional(element) || /^[a-zA-Záéíóúñ ]{1,100}$/.test(value);
		},
		
		customPattern: function(value, element,param) {
			var textVal = param[0];
			return this.optional(element) || textVal.test(value);
		},
		
		selectOneFieldset: function(value, element) {
			if (jQuery("fieldset[id="+element.name+"] input[type=checkbox]:checked").size()>0)
			return true;
			else return false;
		},

		
		// http://docs.jquery.com/Plugins/Validation/Methods/creditcard
		// based on http://en.wikipedia.org/wiki/Luhn
		creditcard: function(value, element) {
			if ( this.optional(element) )
				return "dependency-mismatch";
			// accept only digits and dashes
			if (/[^0-9-]+/.test(value))
				return false;
			var nCheck = 0,
				nDigit = 0,
				bEven = false;

			value = value.replace(/\D/g, "");

			for (n = value.length - 1; n >= 0; n--) {
				var cDigit = value.charAt(n);
				var nDigit = parseInt(cDigit, 10);
				if (bEven) {
					if ((nDigit *= 2) > 9)
						nDigit -= 9;
				}
				nCheck += nDigit;
				bEven = !bEven;
			}

			return (nCheck % 10) == 0;
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/accept
		accept: function(value, element, param) {
			param = typeof param == "string" ? param.replace(/,/g, '|') : "png|jpe?g|gif";
			return this.optional(element) || value.match(new RegExp(".(" + param + ")jQuery", "i")); 
		},
		
		// http://docs.jquery.com/Plugins/Validation/Methods/equalTo
		equalTo: function(value, element, param) {
			return value == jQuery(param).val();
		}
		
	}
	
});

// deprecated, use jQuery.validator.format instead
jQuery.format = jQuery.validator.format;

})(jQuery);

// ajax mode: abort
// usage: jQuery.ajax({ mode: "abort"[, port: "uniqueport"]});
// if mode:"abort" is used, the previous request on that port (port can be undefined) is aborted via XMLHttpRequest.abort() 
;(function(jQuery) {
	var ajax = jQuery.ajax;
	var pendingRequests = {};
	jQuery.ajax = function(settings) {
		// create settings for compatibility with ajaxSetup
		settings = jQuery.extend(settings, jQuery.extend({}, jQuery.ajaxSettings, settings));
		var port = settings.port;
		if (settings.mode == "abort") {
			if ( pendingRequests[port] ) {
				pendingRequests[port].abort();
			}
			return (pendingRequests[port] = ajax.apply(this, arguments));
		}
		return ajax.apply(this, arguments);
	};
})(jQuery);

// provides cross-browser focusin and focusout events
// IE has native support, in other browsers, use event caputuring (neither bubbles)

// provides delegate(type: String, delegate: Selector, handler: Callback) plugin for easier event delegation
// handler is only called when jQuery(event.target).is(delegate), in the scope of the jquery-object for event.target 

// provides triggerEvent(type: String, target: Element) to trigger delegated events
;(function(jQuery) {
	jQuery.each({
		focus: 'focusin',
		blur: 'focusout'	
	}, function( original, fix ){
		jQuery.event.special[fix] = {
			setup:function() {
				if ( !navigator.userAgent.match(/mozilla/i) && 
				        ! navigator.userAgent.match(/webkit/i ) ) return false;
				this.addEventListener( original, jQuery.event.special[fix].handler, true );
			},
			teardown:function() {
				if (  !navigator.userAgent.match(/mozilla/i) && 
				        ! navigator.userAgent.match(/webkit/i ) ) return false;
				this.removeEventListener( original,
				jQuery.event.special[fix].handler, true );
			},
			handler: function(e) {
				arguments[0] = jQuery.event.fix(e);
				arguments[0].type = fix;
				//return $(this).trigger(e, arguments); //TODO this is for new version of jQuery
				return jQuery.event.handle.apply(this, arguments);
			}
		};
	});
	jQuery.extend(jQuery.fn, {
		delegate: function(type, delegate, handler) {
			return this.bind(type, function(event) {
				var target = jQuery(event.target);
				if (target.is(delegate)) {
					return handler.apply(target, arguments);
				}
			});
		},
		triggerEvent: function(type, target) {
			return this.triggerHandler(type, [jQuery.event.fix({ type: type, target: target })]);
		}
	})
})(jQuery);



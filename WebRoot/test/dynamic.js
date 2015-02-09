/*!
 * Ext JS Library 3.4.0
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */
Ext.onReady(function() {

	Ext.QuickTips.init();

	// turn on validation errors beside the field globally
	Ext.form.Field.prototype.msgTarget = 'side';

	var bd = Ext.getBody();

	/*
	 * ================  Form 2  =======================
	 */
	bd.createChild({
		tag : 'h2',
		html : 'Form 2 - Adding fieldsets'
	});

	var fsf = new Ext.FormPanel({
		labelWidth : 75, // label settings here cascade unless overridden
		url : 'save-form.php',
		frame : true,
		title : 'Simple Form with FieldSets',
		bodyStyle : 'padding:5px 5px 0',
		width : 350,

		items : [ {
			xtype : 'fieldset',
			title : 'User Information',
			collapsible : true,
			autoHeight : true,
			defaults : {
				width : 210
			},
			defaultType : 'textfield',
			collapsed : false,
			items : [ {
				fieldLabel : 'First Name',
				name : 'first',
				allowBlank : false
			}, {
				fieldLabel : 'Last Name',
				name : 'last'
			}, {
				fieldLabel : 'Company',
				name : 'company'
			}, {
				fieldLabel : 'Email',
				name : 'email',
				vtype : 'email'
			} ]
		}, {
			xtype : 'fieldset',
			title : 'Phone Number',
			collapsible : true,
			autoHeight : true,
			defaults : {
				width : 210
			},
			defaultType : 'textfield',
			items : [ {
				fieldLabel : 'Home',
				name : 'home',
				value : '(888) 555-1212'
			}, {
				fieldLabel : 'Business',
				name : 'business'
			}, {
				fieldLabel : 'Mobile',
				name : 'mobile'
			}, {
				fieldLabel : 'Fax',
				name : 'fax'
			} ]
		} ],

		buttons : [ {
			text : 'Save'
		}, {
			text : 'Cancel'
		} ]
	});

	fsf.render(document.body);

	/*
	 * ================  Form 3  =======================
	 */
	bd.createChild({
		tag : 'h2',
		html : 'Form 3 - A little more complex'
	});

	var top = new Ext.FormPanel({
		frame : true,
		title : 'Multi Column, Nested Layouts and Anchoring',
		bodyStyle : 'padding:5px 5px 0',
		width : 600,
		items : [ {
			items : [ {
				layout : 'column',
				items : [ {
					columnWidth : .5,
					layout : "form",
					items : [ {
						xtype : 'textfield',
						fieldLabel : 'First Name',
						name : 'first',
						anchor : '95%'
					} ]
				}, {
					columnWidth : .5,
					layout : "form",
					items : [ {
						xtype : 'textfield',
						fieldLabel : 'First Name',
						name : 'first1',
						anchor : '95%'
					} ]
				} ]
			} ]
		}, {
			items : [ {
				layout : 'column',
				items : [ {
					columnWidth : 1.0,
					layout : "form",
					items : [ {
						xtype : 'htmleditor',
						id : 'bio',
						fieldLabel : 'Biography',
						height : 200,
						anchor : '98%'
					} ]
				} ]
			} ]
		} ],
		buttons : [ {
			text : 'Save'
		}, {
			text : 'Cancel'
		} ]
	});

	top.render(document.body);

});
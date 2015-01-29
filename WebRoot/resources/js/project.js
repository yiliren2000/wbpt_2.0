autoHeightExtend = function(value, meta, record) {
     meta.attr = 'style="white-space:normal;"';     
     if(record.data.isMajor=='是'){
    	 return "<font size=5px>*</font>"+value;
     } else {
    	 return value;     
     }
} 
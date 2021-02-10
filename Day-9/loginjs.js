var myDate = new Date(); 
        var myDay = myDate.getDay(); 
        
        // Array of days. 
        var weekday = ['Sunday', 'Monday', 'Tuesday', 
            'Wednesday', 'Thursday', 'Friday', 'Saturday' 
        ]; 
        var a=	(weekday[myDay]); 
		document.write(a.fontcolor("#E74C3C"));
        document.write("<br/>"); 
        
        // get hour value. 
        var hours = myDate.getHours(); 
        var ampm = hours >= 12 ? 'PM' : 'AM'; 
        hours = hours % 12; 
        hours = hours ? hours : 12; 
        var minutes = myDate.getMinutes(); 
        minutes = minutes < 10 ? '0' + minutes : minutes; 
        var myTime = hours + " " +  " : " + minutes +" "+ ampm; 
        var b=(myTime); 
		document.write(b.fontcolor("#E74C3C"));
/****************************
Common functions
****************************/

function errorCB(tx, err) {
    //console.log("\nError processing SQL: "+JSON.stringify(err));
    throw err;
}

function successCB() {}

/****************************
properDB
****************************/

function properDB(){
    if(!arguments[0]) this.name="PROPERDB";
    if(!arguments[1]) this.version=1;
    if(!arguments[2]) this.displayname="PROPER DATABASE";
    if(!arguments[3]) this.size=100000;

    this.dbShell = window.openDatabase(this.name, this.version, this.displayname, this.size);
    this.tableRegistry = [];
    
    this.addTable = function(tablename, tablefields){
        this[tablename] = new properTable(this,tablename,tablefields);
    }
    
    this.getTable = function(tablename){
        if(this.tableRegistry[tablename]) return this.tableRegistry[tablename]
        else throw "No table by "+tablename+" found.";
    }
    
    this.execute = function(sqlcommand, cbFunction){//execute(command, callback)
        var cb = this;
        var sql = sqlcommand;
        var cbfunc = cbFunction;
        this.dbShell.transaction(function(tx){return cb.executeCB(tx, sql, cbfunc);}, errorCB, successCB);
    }
    this.executeCB = function(tx, sql, cbfunc){
        var cb = this;
        var cbfunc = cbfunc;
        if(cbfunc) tx.executeSql(sql, [], function(tx, results){return cb.execSuccess(results, cbfunc);}, errorCB);
        else tx.executeSql(sql);
    }
    this.execSuccess = function(results, cbfunc){
        var entries = new Array();
        var len = results.rows.length;
        for (var i=0; i<len; i++){
            entries.push(results.rows.item(i));
        }
        if(cbfunc) cbfunc(entries);
        else this.getExecResults(entries);
    }
    this.getExecResults = function(results){
        console.log(JSON.stringify(results));
    }
};

/****************************
properTable
****************************/
function properTable(db, tablename, tablefields){
    
    this.create = function(tablefields){
        var cb = this;
        var fields = tablefields;
        this.dbShell.transaction(function(tx){return cb.createTB(tx, fields);}, errorCB, successCB);
    };
    this.createTB = function(tx){
        var fields = "";
        for(col in this.tablecols){
			if(fields) fields += ",";
            var columnobj = this.tablecols[col];
            for(key in columnobj) fields += key+" "+columnobj[key]; //this runs only once, grabs proper key and init args
        }
        var sqlstring = 'CREATE TABLE IF NOT EXISTS '+this.tablename+'(P_ID INTEGER PRIMARY KEY,'+this.tablefields+')';
        //console.log(sqlstring);
        tx.executeSql(sqlstring);
    };
    
    this.drop = function(){
        var cb = this;
        this.dbShell.transaction(function(tx){return cb.dropTB(tx);}, errorCB, successCB);
        return this;
    };
    this.dropTB = function(tx){
        //console.log("SQL:"+'DROP TABLE IF EXISTS '+this.tablename);
        tx.executeSql('DROP TABLE IF EXISTS '+this.tablename);
    }
    this.recreate = function(){
        this.drop().create();
    }
    this.add = function(){
        var cb = this;
        var data = arguments;
        this.dbShell.transaction(function(tx){return cb.insert(tx, data);}, errorCB, successCB);
        return this;
    };
    this.insert = function(tx, data){
        var values = "";
        var columns = "";
        if(Object.prototype.toString.call(data[0])!="[object Object]"){
            for(value in data){
                if(values) values += ",";
                if(typeof data[value] == "string") values+= "'"+data[value]+"'";
                else values += data[value];
            }
            values = "null,"+values;
        }else{ //treat as obj
            var obj = data[0];
            for(key in obj){
                if(columns) {columns+=",";values+=",";}
                columns += key;
                if(typeof obj[key] == "string") values+= "'"+obj[key]+"'";
                else values += obj[key];
            }
            columns = "("+columns+")";
        }
        
        var sqlstring = 'INSERT INTO '+this.tablename+columns+' VALUES('+values+')';
        //console.log(sqlstring);
        tx.executeSql(sqlstring);
    };

    this.update = function(){
        var cb = this;
        var data = arguments;
        this.dbShell.transaction(function(tx){return cb.edit(tx, data);}, errorCB, successCB);
        return this;
    };
    this.edit = function(tx,data){
        var fields = "";
        var values = "";
        var sqlstring = "";
        if(typeof data[0]=="number"){
            var columns = this.tablefields.split(",");
            for(var col=0;col<columns.length;col++){
                //Using user input for table creation to find field names
                var fieldname = columns[col].replace(/\s+/g," ").trim().split(" ")[0];
                if(fields) fields += ",";
                if(typeof data[col+1] == "string") fields += fieldname+"='"+data[col+1]+"'";
                else fields += fieldname+"="+data[col+1];
            }
            sqlstring = 'UPDATE '+this.tablename+' SET '+fields+' WHERE P_ID='+data[0];
        }else{
            var obj = data[0];
            for(key in obj){
                if(key=="P_ID") continue;
                if(fields) {fields+=",";values+=",";}
                fields += key+"=";
                if(typeof obj[key] == "string") fields+= "'"+obj[key]+"'";
                else fields += obj[key];
            }
            sqlstring = 'UPDATE '+this.tablename+' SET '+fields;
            sqlstring += " WHERE P_ID="+obj["P_ID"];
        }
        //console.log(sqlstring);
        tx.executeSql(sqlstring);
    };

    this.get = function(){
        var cb = this;
        var search = arguments[0];
        var usercb = arguments[1];
        var wherestr = "";
        if(typeof search == "string") wherestr = " WHERE "+search;
        else if(search) wherestr = ' WHERE P_ID='+search;
        this.dbShell.transaction(function(tx){return cb.retrieve(tx, wherestr, usercb);}, errorCB, successCB);
        return this;
    };
    this.retrieve = function(tx, wherestr, usercb){
        var sqlstring = 'SELECT * FROM '+this.tablename+wherestr;
        //console.log(sqlstring);
        var cb = this;
        var usercb = usercb;
        tx.executeSql(sqlstring, [], function(tx, results){return cb.querySuccess(results, usercb);}, usercb, errorCB);
    };
    this.querySuccess = function(results, usercb){
        var entries = new Array();
        var len = results.rows.length;
        for (var i=0; i<len; i++){
            //entries.push(results.rows.item(i));
			//IMPORTANT!!
			//pushing results directly will cause it to be uneditable by callback later on
			var obj = {};
			for(key in results.rows.item(i)){
                obj[key] = results.rows.item(i)[key];
			}
			entries.push(obj);
        }
        if(usercb) usercb(entries);
        else this.getResults(entries);
    }
    this.getResults = function(entries){
        console.log(JSON.stringify(entries));
    }
    
    this.delete = function(entry){
        var cb = this;
        
        var wherestr = "";
        if(typeof entry == "string") wherestr = " WHERE "+entry;
        else if(entry) wherestr = ' WHERE P_ID='+entry;
        this.dbShell.transaction(function(tx, id){return cb.remove(tx, wherestr);}, errorCB, successCB);
        return this;
    };
    this.remove = function(tx, wherestr){
        var sqlstring = 'DELETE FROM '+this.tablename+wherestr;
        tx.executeSql(sqlstring);
    };
    
    this.dbShell = db.dbShell;
    this.tablename = tablename;
    this.tablefields = tablefields;
    this.create();
};

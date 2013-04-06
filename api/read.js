var MongoClient = require('mongodb').MongoClient;

exports.read = function(name,callback,errCallback) {
	MongoClient.connect("mongodb://localhost:27017/simpleApi", function(err, db) {
		if(err){return err;}
		var collection = db.collection('test1');
		console.log('Read:',db.databaseName);
		if (name) {
			collection.findOne({name:name}, function(err,item) {
				try {
					if (item) {

						callback(item);
						
						return(item);

					} else {

						throw "no item found";
					}
				} catch (err) {
					console.log(err);
					errCallback(err);
					return(err);
				}
				
				
			});
		} else {
			collection.find().toArray(function(err,items){
				if (items) {
					callback(items);
					return items;
				} else {
					throw err;
				}
			
			});
		}
			
		
		
	});

}
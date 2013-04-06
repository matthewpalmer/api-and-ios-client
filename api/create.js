var MongoClient = require('mongodb').MongoClient;

exports.create = function(req, callback) {
	if (req) {
		MongoClient.connect("mongodb://localhost:27017/simpleApi", function(err, db) {
			if(err){return err;}
			var collection = db.collection('test1');
			console.log('connected to',db.databaseName);
			if (req.body) {
				req.name = req.body.name;
				req.age = req.body.age;
			}
			var doc2 = {name:req.name, age:req.age};
				
				collection.insert(doc2, function(err, result){
					if (typeof callback == "function") {
						callback(result);
					}
					return result;
				});
		});
	return true;
		
	} else {
		return false;
	}
}


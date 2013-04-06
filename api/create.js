var MongoClient = require('mongodb').MongoClient;

exports.create = function(req, callback) {
	//console.log(req);
	if (req) {
		//console.log('post received');
		//console.log(JSON.stringify(req.body));

		//console.log('req.body.name', req.name);
		//console.log('req.body.age', req.age);

		MongoClient.connect("mongodb://localhost:27017/simpleApi", function(err, db) {
			if(err){return err;}
			var collection = db.collection('test1');
			console.log('connected to',db.databaseName);
			if (req.body) {
				req.name = req.body.name;
				req.age = req.body.age;
			}
			var doc2 = {name:req.name, age:req.age};
			
			//callback(collection.insert(doc2, function(err, result){}));
			
				collection.insert(doc2, function(err, result){
					//console.log(result);
					if (typeof callback == "function") {
						callback(result);
					}
					return result;
				});

			//res();
			
			//;
			//collection.find().toArray(function(err,items){console.log(items)});
			//return collection.find();

		});
		//res.end('Successful');

	return true;
		
	} else {
		return false;
	}
}


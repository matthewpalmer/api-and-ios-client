var expect = require('expect.js');
var read = require('../read');
var assert = require('assert');

describe('Read', function() {
	it('should return a list of objects if no param', function(done) {
		assert.doesNotThrow(function() {
			read.read('',function() {
				done();
			}, function(err) {
				if (err) throw err;
				done();
			});
		});
	});
	it('should return `one` object if param', function(done) {
		assert.doesNotThrow(function() {
			read.read('matt', function() {
				done();
			}, function(err) {
				console.log('error in READ here');
				console.log(err);
				if (err) throw err;
				
				done();
			});
		});
	});
	
		
});

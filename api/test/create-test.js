var expect = require('expect.js'),
	assert = require('assert'),
	create = require('../create');

describe('Create', function() {
	it('should create an object', function(done) {
		assert.ok(create.create({name:'greg',age:55}, function() {
			done();
		}));
		
	});
	it('should reject empty creation', function() {
		expect(create.create()).to.not.be.ok();
	});
});

# ES6
import TestClass from './TestClass.js'

const constructor_test = 'babelで書いてるよ';

global.run = function() {
  let result = new TestClass(constructor_test);
  Logger.log(result);
}

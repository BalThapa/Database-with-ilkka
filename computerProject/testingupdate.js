"use strict";

const Datastorage = require("./sqlStorage/dataStorageLayer");

const storage = new Datastorage();

const newComp = {
  id: 123,
  name: "XYZ",
  type: "qwertyX",
  processor: "XGT III",
  amount: 232,
  imagename: "computer3.png",
};

storage.update(newComp).then(console.log).catch(console.log);

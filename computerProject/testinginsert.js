"use strict";

const Datastorage = require("./sqlStorage/dataStorageLayer");
const { insertParameters } = require("./sqlStorage/parameterFunctions");

const storage = new Datastorage();

const newComp = {
  id: 1234,
  name: "XYZq",
  type: "qwerty1",
  processor: "XGT III",
  amount: 23,
  imagename: "computer4.png",
};

storage.insert(newComp).then(console.log).catch(console.log);

async () => {
  try {
    const result = await storage.insert(newComp);
  } catch (err) {
    console.log(err);

    if (err.code === storage.CODES.NOT_INSERTED) {
      console.log("Computer was not inserted");
    } else if (err.code === storage.CODES.ALREADY_IN_USE) {
      console.log("Computer id was already in use. Please, choose another id.");
    }
  }
};

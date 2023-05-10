"use strict";

function insertParameters(computer) {
  return [
    computer.id,
    computer.name,
    computer.type,
    computer.processor,
    computer.amount,
    computer.imagename,
  ];
}

function updateParameters(computer) {
  return [
    computer.name,
    computer.type,
    computer.processor,
    computer.amount,
    computer.imagename,
    computer.id,
  ];
}

module.exports = { insertParameters, updateParameters };

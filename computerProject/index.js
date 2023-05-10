"use strict";
const path = require("path");
const express = require("express");
const app = express();

const { port, host } = require("./config.json");

const Datastorage = require("./sqlStorage/dataStorageLayer");

const storage = new Datastorage();

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "public", "pages"));
// app.use(express.json()); to put json in the root for all that use json

app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: false }));

app.get("/", (req, res) => res.sendFile(path.join(__dirname, "menu.html")));

app.get("/computers", (req, res) =>
  storage
    .getAll()
    .then((data) => res.json(data))
    .catch((err) => res.json(err))
);

app.get("/all", (req, res) =>
  storage
    .getAll()
    .then((data) => res.render("allComputers", { result: data }))
    .catch((err) => res.json(err))
);

app.get("/computers/:id", express.json(), (req, res) =>
  storage
    .getOne(req.params.id)
    .then((data) => res.json(data))
    .catch((err) => res.json(err))
);

app.post("/getone", (req, res) =>
  storage
    .getOne(req.body.id)
    .then((data) => res.render("oneComputer", { computer: data }))
    .catch((err) => res.json(err))
);

app.get("/insertform", (req, res) =>
  res.render("form", {
    title: "Computers",
    header: "Fill in the Data",
    action: "/insert",
    fields: [
      { name: "Id", size: 5, value: "", readonly: "" },
      { name: "Name", size: 30, value: "", readonly: "" },
      { name: "Type", size: 10, value: "", readonly: "" },
      { name: "Processor", size: 15, value: "", readonly: "" },
      { name: "amount", size: 5, value: "", readonly: "" },
      { name: "Imagename", size: 20, value: "", readonly: "" },
    ],
  })
);

app.post("/insert", (req, res));
storage
  .insert(req.body)
  .then((data) => res.json(data))
  .catch((err) => res.json(err));

app.listen(port, host, () => console.log(`${host}:${port} serving...`));

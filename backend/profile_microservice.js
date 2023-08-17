const express = require("express");
const app = express();
const port = 3000;
const db = require("./databases/database_crud");
const { User } = require("./models/models");

app.use(express.json());

app.get("/profile", (req, res) => {
  db.getProfile("users")
    .then((response) => {
      console.log("get profile successfully", response);
      res.json(response);
    })
    .catch((error) => {
      console.log("get profile failed", error);
      res.json(error);
    });
});

app.get("/contact-info", (req, res) => {
  db.getContactInfo("users")
    .then((response) => {
      console.log("get contact-info successfully", response);
      res.json(response);
    })
    .catch((error) => {
      console.log("get contact-info failed", error);
      res.json(error);
    });
});

app.post("/contact-info", (req, res) => {
  const { name, email, phone_number, address, province, postal_code, country } =
    req.body;

  const userModel = new User(
    name,
    email,
    phone_number,
    address,
    province,
    postal_code,
    country
  );
  db.insert("users", userModel).then((response) => {
    console.log("post contact-info successfully", response);
    res.json(response);
  });
});

app.listen(port, () => {
  console.log(`profile microservice listening on port ${port}`);
});

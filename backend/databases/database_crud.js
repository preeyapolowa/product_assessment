const {
  User,
  ProfileResponse,
  GenericResponse,
  ContactInfoResponse,
} = require("../models/models");
const db = require("./database_connection");

/**
 *
 * @param {String} tablename
 * @param {User} model
 */
async function insert(tablename, model) {
  let insertSql =
    "INSERT INTO " +
    tablename +
    " (name, email, phone_number, address, province, postal_code, country)" +
    "VALUES (?, ?, ?, ?, ?, ?, ?)";
  let updateSql =
    "UPDATE " +
    tablename +
    " SET name = ?, email = ?, phone_number = ?, address = ?, province = ?, postal_code = ?, country = ?" +
    " WHERE id = 1";

  return new Promise((resolve, reject) => {
    getProfile(tablename)
      .then((response) => {
        console.log("get profile successfully", response);
        db.query(
          updateSql,
          [
            model.name,
            model.email,
            model.phone_number,
            model.address,
            model.province,
            model.postal_code,
            model.country,
          ],
          (error, results, fields) => {
            if (error) reject(error);
            console.log("Update data successfully");
            resolve(
              GenericResponse("Success", "Update Information successfully!")
            );
          }
        );
      })
      .catch((error) => {
        console.log("get profile failed", error);
        db.query(
          insertSql,
          [
            model.name,
            model.email,
            model.phone_number,
            model.address,
            model.province,
            model.postal_code,
            model.country,
          ],
          (error, results, fields) => {
            if (error) reject(error);
            console.log("Insert data successfully");
            resolve(
              GenericResponse("Success", "Insert Information successfully!")
            );
          }
        );
      });
  });
}

async function getProfile(tablename) {
  let sql =
    "SELECT name, phone_number, address from " + tablename + " WHERE id = '1'";

  return new Promise((resolve, reject) => {
    db.query(sql, (error, results, fields) => {
      if (results.length == 0) return reject(ProfileResponse(null, null, null));
      const result = results[0];
      const name = result["name"];
      const phoneNumber = result["phone_number"];
      const address = result["address"];
      console.log("Get data successfully");
      resolve(ProfileResponse(name, phoneNumber, address));
    });
  });
}

async function getContactInfo(tablename) {
  let sql = "SELECT * from " + tablename + " WHERE id = '1'";
  return new Promise((resolve, reject) => {
    db.query(sql, (error, results, fields) => {
      if (results.length == 0)
        return reject(
          ContactInfoResponse(null, null, null, null, null, null, null)
        );
      const result = results[0];
      const name = result["name"];
      const email = result["email"];
      const phoneNumber = result["phone_number"];
      const address = result["address"];
      const province = result["province"];
      const postalCode = result["postal_code"];
      const country = result["country"];

      console.log("Get data successfully");
      resolve(
        ContactInfoResponse(
          name,
          email,
          phoneNumber,
          address,
          province,
          postalCode,
          country
        )
      );
    });
  });
}

module.exports = { insert, getProfile, getContactInfo };

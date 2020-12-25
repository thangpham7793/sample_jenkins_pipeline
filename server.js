const hobbies = require("./hobbies");
const app = require("express")();

app.listen(3000, "0.0.0.0", () => {
  console.log(`Listening on PORT 3000`);
});

app.get("/", (req, res) => {
  res.send("Sample API");
});
app.get("/hobbies", (req, res) => {
  res.send(hobbies.getHobbies());
});
app.get("/hobbies/:id", (req, res) => {
  const hobby = hobbies.getHobby(req.params.id);
  if (!hobby) res.status(404).send("Not Found");
  res.send(hobby);
});

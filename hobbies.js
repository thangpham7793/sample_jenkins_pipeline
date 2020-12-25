const hobbies = ["running", "jogging", "eating", "sleeping"];

exports.getHobbies = () => hobbies;
exports.getHobby = (id) =>
  id < 1 || id > hobbies.length ? null : hobbies[id - 1];

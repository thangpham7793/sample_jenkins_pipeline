const hobbies = require("./hobbies");
describe("API unit test suite", () => {
  describe("getHobbies", () => {
    const list = hobbies.getHobbies();
    it("return 4 hobbies", () => {
      expect(list.length).toEqual(4);
    });
    it("return runnning as first hobby", () => {
      expect(hobbies.getHobby(1)).toBe("running");
    });
  });
});

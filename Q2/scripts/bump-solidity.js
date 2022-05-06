const fs = require("fs");
const solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/;

const verifierRegex = /contract Verifier/;

let HelloWorldContent = fs.readFileSync("./contracts/HelloWorldVerifier.sol", {
	encoding: "utf-8",
});
let HelloWorldBumped = HelloWorldContent.replace(
	solidityRegex,
	"pragma solidity ^0.8.0"
);
HelloWorldBumped = HelloWorldBumped.replace(
	verifierRegex,
	"contract HelloWorldVerifier"
);

fs.writeFileSync("./contracts/HelloWorldVerifier.sol", HelloWorldBumped);

// [assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment
let Multiplier3Groth16 = fs.readFileSync(
	"./contracts/Multiplier3Groth16Verifier.sol",
	{ encoding: "utf-8" }
);
let Multiplier3Groth16Bumped = Multiplier3Groth16.replace(
	solidityRegex,
	"pragma solidity ^0.8.0"
);
Multiplier3Groth16Bumped = Multiplier3Groth16Bumped.replace(
	verifierRegex,
	"contract Multiplier3Groth16Verifier"
);

fs.writeFileSync(
	"./contracts/Multiplier3Groth16Verifier.sol",
	Multiplier3Groth16Bumped
);

let Multiplier3Plonk = fs.readFileSync(
	"./contracts/Multiplier3PlonkVerifier.sol",
	{ encoding: "utf-8" }
);
let Multiplier3PlonkBumped = Multiplier3Plonk.replace(
	solidityRegex,
	"pragma solidity ^0.8.0"
);
Multiplier3PlonkBumped = Multiplier3PlonkBumped.replace(
	verifierRegex,
	"contract Multiplier3PlonkVerifier"
);

fs.writeFileSync(
	"./contracts/Multiplier3PlonkVerifier.sol",
	Multiplier3PlonkBumped
);

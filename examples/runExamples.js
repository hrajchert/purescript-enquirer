const select = require("../output/SelectExample");
const confirm = require("../output/ConfirmExample");

const examples = {
  select,
  confirm,
};

function help() {
  console.log(`To run an example you need to call:`);
  console.log(`npm run example [example-name]`);
  console.log(`where the example-name is one of these:`);
  console.log(
    Object.keys(examples)
      .map((name) => `  * ${name}`)
      .join("\n")
  );
}

if (process.argv.length !== 3 || !examples.hasOwnProperty(process.argv[2])) {
  help();
} else {
  examples[process.argv[2]].main();
}

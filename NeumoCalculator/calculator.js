// var display = document.getElementById("calculator-display");
// var result = "";
// var input1 = "";
// var input2 = "";
// var op = "";
//
// function touchNumber(val) {
//     if (result !== "" && input1 !== "") {
//         initCalculator();
//     }
//     if (op === "") {
//         input1  += val;
//         updateDisplay(input1);
//     } else {
//         input2 += val;
//         updateDisplay(input2);
//     }
//
//     log();
//
// }
//
// function touchOperation(val) {
//
//     if (val === "ac") {
//         initCalculator();
//         updateDisplay(0);
//         log();
//         return;
//     }
//
//     if (val !== "eql") {
//         op = val;
//     }
//
//     if (input2 !== "") {
//         switch (op) {
//             case "add":
//                 result = Number(input1) + Number(input2);
//                 break;
//             case "sub":
//                 result = Number(input1) - Number(input2);
//                 break;
//             case "mul":
//                 result = Number(input1) * Number(input2);
//                 break;
//             case "div":
//                 result = Number(input1) / Number(input2);
//                 break;
//             case "mod":
//                 result = Number(input1) % Number(input2);
//                 break;
//             default:
//                 break;
//         }
//     }
//
//
//     if (input1 !== "" && input2 !== "") {
//         updateDisplay(result);
//     }
//
//     if (input2 !== "" && val === "eql") {
//         op = "";
//         input1 = result;
//         input2 = "";
//     } else if (input2 !== "") {
//         input1 = result;
//         input2 = "";
//     }
//     log();
// }
//
// function touchPlusMinus() {
//     result = result * (-1);
//     updateDisplay(result);
//     log();
// }
//
// function updateDisplay(val) {
//     display.value = String(val);
// }
//
// function initCalculator() {
//     result = "";
//     input1 = "";
//     input2 = "";
//     op = "";
// }
//
// function log() {
//     console.log("result : " + result);
//     console.log("input1 : " + input1);
//     console.log("input2 : " + input2);
//     console.log("op : " + op);
//     console.log("------------------");
// }
console.log("hello this is my first program");
var a = 2.5;
var b =2.5;
let s ="hello";
const c = a+b;

console.log(c);

var ans = a+ b + s;
console.log(ans);

if(a===b){
    console.log("equal");
}
else{
    console.log("a is not equal");
    
}

var ab = new Array(1,5,8,4);
console.log(ab);

ab.push(12);
ab.pop(3);
console.log(ab);


for(var i = 0;i<=ab.length - 1; i++){
    console.log(ab[i]);
    
}


console.log(" ");
console.log(" ");

let n =[1,2,3,4];
n.pop();
n.push("rohit")
console.log(n[1]);
console.log(n[3]);
console.log(n);


console.log(" ");
console.log(" ");


function areaoftraingle(a,b,c){
    const s = (a + b + c)/2;
    const area = Math.sqrt(s * (s-a) * (s-b) * (s-c));
    return area;
}

let sidea = 5;
let sideb = 6;
let sidec = 7;

const area = areaoftraingle(sidea, sideb, sidec);
console.log(area);















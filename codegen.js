
const num_words = [
    "Zero",
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven"
]

const nums = [0,1,2,3,4,5,6,7]

for (const x of nums) {
    for (const y of nums) {
        console.log(`\t${num_words[x]} + ${num_words[y]} = ${num_words[(x+y) % 8]}`);
    }
}

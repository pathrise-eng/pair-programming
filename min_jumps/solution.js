// [3,4,2,1,2,3,7,1,1,1,3]

// Explanation:
// Create an additional array where each index is the minimum
// number of hops necessary to reach that index. To calculate
// this, for each element iterate through all previous elements
// and determine if it can be reached from them.  If so, update
// the number of hops to reach that element based on the previos
// elements hops (if it is less than).
//
// Space: O(N)
// Time: O(N^2) (via triangle numbers I believe)

function dpMinNumberOfJumps(array) {
    var hops = [0]
    for (var i=1;i<array.length;i++) {
        hops.push(Infinity);
    }
    var current;
    for (var i=1;i<array.length;i++) {
        for (var j=0;j<i;j++) {
            if (j+array[j] >= i) {
                if (hops[j]+1 < hops[i]) { // second if statement here is just a min(hops[i],hops[j]+1)
                    hops[i] = hops[j]+1;
                }
            }
        }
    }
    return hops[hops.length-1];
}

// Explanation: For each index, iterate over all of its possible
// jump destinations, and see which destination gets you the furthest.
// Then jump to that index, and see which of all its possible
// jump destinations gets you the furthest.  When the end is
// reached, return the number of jumps.
//
// Space: O(1)
// Time: O(N)? I think? Because it is something like 2N
// Hmm for each step i = 1..N, we take
// k iterations, where k is the value
// of the element at i. Then we jump
// to one element in i..k, and go through
// k' iterations.

// [3,4,2,1,2,3,7,1,1,1,3]
function bruteMinNumberOfJumps(array) {
    if (array.length <= 1) {return 0;}
    let jumps = 0;
    for (let i=0;i<array.length;i++) {
        if (array[i]+i >= array.length -1) {
            return jumps +1;
        }
        let max = 0;
        let nextJump = null;
        for (let j=i+1;j<=i+array[i];j++) {
            let furthest = array[j]+j;
            if (furthest > max) {
                max = furthest;
                nextJump = j;
            }
        }
        i = nextJump-1;
        jumps += 1;
    }
    return jumps;
}


// Explanation:
// We know the furtherst we could presently get
// as well as the number of 'steps'- indexes we
// walk over before we NEED to have made another
// jump.

function minNumberOfJumps(array) {
    if (array.length <= 1) {return 0;}
    let jumps = 0
    let stepsLeft = furthest = array[0]
    for (let i=1;i<array.length-1;i++) {
        stepsLeft--;
        if (array[i]+i > furthest) {
            furthest = array[i]+i;
        }
        if (stepsLeft == 0) {
            jumps++;
            stepsLeft = furthest - i;
        }
    }
    return jumps + 1;
}

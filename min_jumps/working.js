// [2,3,1,2,1,1]

function dpMinNumberOfJumps(array) {
    var hops = [0]
    for (var i=1;i<array.length;i++) {
        hops.push(Infinity);
    }
    var current;
    for (var i=1;i<array.length;i++) {
        for (var j=0;j<i;j++) {
            if (j+array[j] >= i) {
                if (hops[j]+1 < hops[i]) { // this is just a min(hops[i],hops[j]+1)
                    hops[i] = hops[j]+1;
                }
            }
        }
    }
    return hops[hops.length-1];
}


















// [2,3,1,2,1,1]

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

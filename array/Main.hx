class Main {
    static public function main() {
        // [0, 1, 2,..., 9]
        var nums: Array<Int> = [for(i in 0...10) i];
        trace(nums);

        var strings: Array<String> = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"];

        trace("Len of strings: " + strings.length);
        
        strings.remove("f");
        trace("Len of strings after remove one position: " + strings.length);

        // Iterate over the positions
        for (i in 0...(strings.length + 1)) {
            trace("Position: " + i);
        }

        // Iterate over the array
        for (s in strings) {
            if (s == "c") break;
            trace("Letter: " + s);
        }

        if (nums.contains(11)) {
            trace("nums contains 11");
        } else {
            trace("nums does not contain 11");
        }

        var nums2 = nums.map(function(v: Int){
            return v * 2;
        });

        trace("nums mapped (val * 2): " + nums2);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// gas golf
contract GasGolf {
    // start - 58545  gas
    // use calldata - 56538  gas
    // load state variables to memory - 56295  gas
    // short circuit - 55930  gas
    // loop increments - 55460  gas
    // cache array length - 55420  gas
    // load array elements to memory - 55234  gas

    uint public total;

    // start - not gas optimized
    function sumIfEvenAndLessThan99(uint[] calldata nums) external {
        uint _sum=total;
        uint len=nums.length;
        for (uint i = 0; i < len; ++i) {
            uint num=nums[i];
            if ( num % 2 == 0 && num < 99) {
                _sum += num;
            }
        }
        total=_sum;
    }

    // gas optimized
    // [1, 2, 3, 4, 5, 100]
    // function sumIfEvenAndLessThan99(uint[] calldata nums) external {
    //     uint _total = total;
    //     uint len = nums.length;

    //     for (uint i = 0; i < len; ++i) {
    //         uint num = nums[i];
    //         if (num % 2 == 0 && num < 99) {
    //             _total += num;
    //         }
    //     }

    //     total = _total;
    // }
}
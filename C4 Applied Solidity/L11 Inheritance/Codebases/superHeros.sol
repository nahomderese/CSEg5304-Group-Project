// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Hero.sol";

contract Mage is Hero {
    constructor() Hero(50) {
    }

    function attack(Enemy _enemy) public override {
        super.attack(_enemy); 
        _enemy.takeAttack(AttackTypes.Spell);
    }
}

contract Warrior is Hero {
    constructor() Hero(200) {
        // Additional setup specific to Warrior, if any
    }

    function attack(Enemy _enemy) public override {
        super.attack(_enemy); // Invoking attack function from the base contract
        _enemy.takeAttack(AttackTypes.Brawl);
    }
}

pragma solidity >=0.5.12;

import "ds-test/test.sol";

import "./DssProxyActions.sol";

import {DssDeployTestBase, GemJoin, Flipper} from "dss-deploy/DssDeploy.t.base.sol";
import {DGD} from "dss-gem-joins/tokens/DGD.sol";
import {GNT} from "dss-gem-joins/tokens/GNT.sol";
import {GemJoin3} from "dss-gem-joins/join-3.sol";
import {GemJoin4} from "dss-gem-joins/join-4.sol";
import {DSValue} from "ds-value/value.sol";
import {DssCdpManager} from "dss-cdp-manager/DssCdpManager.sol";
import {GetCdps} from "dss-cdp-manager/GetCdps.sol";
import {ProxyRegistry, DSProxyFactory, DSProxy} from "proxy-registry/ProxyRegistry.sol";
import {WCOIN9_} from "ds-wcoin/wcoin9.sol";

contract ProxyCalls {
    DSProxy proxy;
    address dssProxyActions;
    address dssProxyActionsEnd;
    address dssProxyActionsDsr;

    function transfer(address, address, uint256) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function open(address, bytes32, address) public returns (uint cdp) {
        bytes memory response = proxy.execute(dssProxyActions, msg.data);
        assembly {
            cdp := mload(add(response, 0x20))
        }
    }

    function give(address, uint, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function giveToProxy(address, address, uint, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function cdpAllow(address, uint, address, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function urnAllow(address, address, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function hope(address, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function nope(address, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function flux(address, uint, address, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function move(address, uint, address, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function frob(address, uint, int, int) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function frob(address, uint, address, int, int) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function quit(address, uint, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function enter(address, address, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function shift(address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function lockCoin(address, address, uint) public payable {
        (bool success,) = address(proxy).call.value(msg.value)(abi.encodeWithSignature("execute(address,bytes)", dssProxyActions, msg.data));
        require(success, "");
    }

    function safeLockCoin(address, address, uint, address) public payable {
        (bool success,) = address(proxy).call.value(msg.value)(abi.encodeWithSignature("execute(address,bytes)", dssProxyActions, msg.data));
        require(success, "");
    }

    function lockGem(address, address, uint, uint, bool) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function safeLockGem(address, address, uint, uint, bool, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function makeGemBag(address) public returns (address bag) {
        address payable target = address(proxy);
        bytes memory data = abi.encodeWithSignature("execute(address,bytes)", dssProxyActions, msg.data);
        assembly {
            let succeeded := call(sub(gas(), 5000), target, callvalue(), add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let response := mload(0x40)
            mstore(0x40, add(response, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(response, size)
            returndatacopy(add(response, 0x20), 0, size)

            bag := mload(add(response, 0x60))

            switch iszero(succeeded)
            case 1 {
                // throw if delegatecall failed
                revert(add(response, 0x20), size)
            }
        }
    }

    function freeCoin(address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function freeGem(address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function exitCoin(address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function exitGem(address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function draw(address, address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function wipe(address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function wipeAll(address, address, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function safeWipe(address, address, uint, uint, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function safeWipeAll(address, address, uint, address) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function lockCoinAndDraw(address, address, address, address, uint, uint) public payable {
        (bool success,) = address(proxy).call.value(msg.value)(abi.encodeWithSignature("execute(address,bytes)", dssProxyActions, msg.data));
        require(success, "");
    }

    function openLockCoinAndDraw(address, address, address, address, bytes32, uint) public payable returns (uint cdp) {
        address payable target = address(proxy);
        bytes memory data = abi.encodeWithSignature("execute(address,bytes)", dssProxyActions, msg.data);
        assembly {
            let succeeded := call(sub(gas(), 5000), target, callvalue(), add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let response := mload(0x40)
            mstore(0x40, add(response, and(add(add(size, 0x20), 0x1f), not(0x1f))))
            mstore(response, size)
            returndatacopy(add(response, 0x20), 0, size)

            cdp := mload(add(response, 0x60))

            switch iszero(succeeded)
            case 1 {
                // throw if delegatecall failed
                revert(add(response, 0x20), size)
            }
        }
    }

    function lockGemAndDraw(address, address, address, address, uint, uint, uint, bool) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function openLockGemAndDraw(address, address, address, address, bytes32, uint, uint, bool) public returns (uint cdp) {
        bytes memory response = proxy.execute(dssProxyActions, msg.data);
        assembly {
            cdp := mload(add(response, 0x20))
        }
    }

    function openLockGNTAndDraw(address, address, address, address, bytes32, uint, uint) public returns (address bag, uint cdp) {
        bytes memory response = proxy.execute(dssProxyActions, msg.data);
        assembly {
            bag := mload(add(response, 0x20))
            cdp := mload(add(response, 0x40))
        }
    }

    function wipeAndFreeCoin(address, address, address, uint, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function wipeAllAndFreeCoin(address, address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function wipeAndFreeGem(address, address, address, uint, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function wipeAllAndFreeGem(address, address, address, uint, uint) public {
        proxy.execute(dssProxyActions, msg.data);
    }

    function end_freeCoin(address a, address b, address c, uint d) public {
        proxy.execute(dssProxyActionsEnd, abi.encodeWithSignature("freeCoin(address,address,address,uint256)", a, b, c, d));
    }

    function end_freeGem(address a, address b, address c, uint d) public {
        proxy.execute(dssProxyActionsEnd, abi.encodeWithSignature("freeGem(address,address,address,uint256)", a, b, c, d));
    }

    function end_pack(address a, address b, uint c) public {
        proxy.execute(dssProxyActionsEnd, abi.encodeWithSignature("pack(address,address,uint256)", a, b, c));
    }

    function end_cashCoin(address a, address b, bytes32 c, uint d) public {
        proxy.execute(dssProxyActionsEnd, abi.encodeWithSignature("cashCoin(address,address,bytes32,uint256)", a, b, c, d));
    }

    function end_cashGem(address a, address b, bytes32 c, uint d) public {
        proxy.execute(dssProxyActionsEnd, abi.encodeWithSignature("cashGem(address,address,bytes32,uint256)", a, b, c, d));
    }

    function dsr_join(address a, address b, uint c) public {
        proxy.execute(dssProxyActionsDsr, abi.encodeWithSignature("join(address,address,uint256)", a, b, c));
    }

    function dsr_exit(address a, address b, uint c) public {
        proxy.execute(dssProxyActionsDsr, abi.encodeWithSignature("exit(address,address,uint256)", a, b, c));
    }

    function dsr_exitAll(address a, address b) public {
        proxy.execute(dssProxyActionsDsr, abi.encodeWithSignature("exitAll(address,address)", a, b));
    }
}

contract FakeUser {
    function doGive(
        DssCdpManager manager,
        uint cdp,
        address dst
    ) public {
        manager.give(cdp, dst);
    }
}

contract DssProxyActionsTest is DssDeployTestBase, ProxyCalls {
    DssCdpManager manager;

    GemJoin3 dgdJoin;
    DGD dgd;
    DSValue pipDGD;
    Flipper dgdFlip;
    GemJoin4 gntJoin;
    GNT gnt;
    DSValue pipGNT;
    ProxyRegistry registry;
    WCOIN9_ realWcoin;

    function setUp() public {
        super.setUp();
        deployKeepAuth();

        // Create a real WCoin token and replace it with a new adapter in the vat
        realWcoin = new WCOIN9_();
        this.deny(address(vat), address(coinJoin));
        coinJoin = new GemJoin(address(vat), "COIN", address(realWcoin));
        this.rely(address(vat), address(coinJoin));

        // Add a token collateral
        dgd = new DGD(1000 * 10 ** 9);
        dgdJoin = new GemJoin3(address(vat), "DGD", address(dgd), 9);
        pipDGD = new DSValue();
        dssDeploy.deployCollateral("DGD", address(dgdJoin), address(pipDGD));
        (dgdFlip, ) = dssDeploy.ilks("DGD");
        pipDGD.poke(bytes32(uint(50 ether))); // Price 50 STBL = 1 DGD (in precision 18)
        this.file(address(spotter), "DGD", "mat", uint(1500000000 ether)); // Liquidation ratio 150%
        this.file(address(vat), bytes32("DGD"), bytes32("line"), uint(10000 * 10 ** 45));
        spotter.poke("DGD");
        (,,uint spot,,) = vat.ilks("DGD");
        assertEq(spot, 50 * RAY * RAY / 1500000000 ether);

        gnt = new GNT(1000000 ether);
        gntJoin = new GemJoin4(address(vat), "GNT", address(gnt));
        pipGNT = new DSValue();
        dssDeploy.deployCollateral("GNT", address(gntJoin), address(pipGNT));
        pipGNT.poke(bytes32(uint(100 ether))); // Price 100 STBL = 1 GNT
        this.file(address(spotter), "GNT", "mat", uint(1500000000 ether)); // Liquidation ratio 150%
        this.file(address(vat), bytes32("GNT"), bytes32("line"), uint(10000 * 10 ** 45));
        spotter.poke("GNT");
        (,, spot,,) = vat.ilks("GNT");
        assertEq(spot, 100 * RAY * RAY / 1500000000 ether);

        manager = new DssCdpManager(address(vat));
        DSProxyFactory factory = new DSProxyFactory();
        registry = new ProxyRegistry(address(factory));
        dssProxyActions = address(new DssProxyActions());
        dssProxyActionsEnd = address(new DssProxyActionsEnd());
        dssProxyActionsDsr = address(new DssProxyActionsDsr());
        proxy = DSProxy(registry.build());
    }

    function ink(bytes32 ilk, address urn) public view returns (uint inkV) {
        (inkV,) = vat.urns(ilk, urn);
    }

    function art(bytes32 ilk, address urn) public view returns (uint artV) {
        (,artV) = vat.urns(ilk, urn);
    }

    function testTransfer() public {
        col.mint(10);
        col.transfer(address(proxy), 10);
        assertEq(col.balanceOf(address(proxy)), 10);
        assertEq(col.balanceOf(address(123)), 0);
        this.transfer(address(col), address(123), 4);
        assertEq(col.balanceOf(address(proxy)), 6);
        assertEq(col.balanceOf(address(123)), 4);
    }

    function testCreateCDP() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        assertEq(cdp, 1);
        assertEq(manager.owns(cdp), address(proxy));
    }

    function testGiveCDP() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.give(address(manager), cdp, address(123));
        assertEq(manager.owns(cdp), address(123));
    }

    function testGiveCDPToProxy() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        address userProxy = registry.build(address(123));
        this.giveToProxy(address(registry), address(manager), cdp, address(123));
        assertEq(manager.owns(cdp), userProxy);
    }

    function testGiveCDPToNewProxy() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        assertEq(address(registry.proxies(address(123))), address(0));
        this.giveToProxy(address(registry), address(manager), cdp, address(123));
        DSProxy userProxy = registry.proxies(address(123));
        assertTrue(address(userProxy) != address(0));
        assertEq(userProxy.owner(), address(123));
        assertEq(manager.owns(cdp), address(userProxy));
    }

    function testFailGiveCDPToNewContractProxy() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        FakeUser user = new FakeUser();
        assertEq(address(registry.proxies(address(user))), address(0));
        this.giveToProxy(address(registry), address(manager), cdp, address(user)); // Fails as user is a contract and not a regular address
    }

    function testGiveCDPAllowedUser() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        FakeUser user = new FakeUser();
        this.cdpAllow(address(manager), cdp, address(user), 1);
        user.doGive(manager, cdp, address(123));
        assertEq(manager.owns(cdp), address(123));
    }

    function testAllowUrn() public {
        assertEq(manager.urnCan(address(proxy), address(123)), 0);
        this.urnAllow(address(manager), address(123), 1);
        assertEq(manager.urnCan(address(proxy), address(123)), 1);
        this.urnAllow(address(manager), address(123), 0);
        assertEq(manager.urnCan(address(proxy), address(123)), 0);
    }

    function testFlux() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));

        assertEq(stbl.balanceOf(address(this)), 0);
        realWcoin.deposit.value(1 ether)();
        realWcoin.approve(address(coinJoin), uint(-1));
        coinJoin.join(manager.urns(cdp), 1 ether);
        assertEq(vat.gem("COIN", address(this)), 0);
        assertEq(vat.gem("COIN", manager.urns(cdp)), 1 ether);

        this.flux(address(manager), cdp, address(this), 0.75 ether);

        assertEq(vat.gem("COIN", address(this)), 0.75 ether);
        assertEq(vat.gem("COIN", manager.urns(cdp)), 0.25 ether);
    }

    function testFrob() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));

        assertEq(stbl.balanceOf(address(this)), 0);
        realWcoin.deposit.value(1 ether)();
        realWcoin.approve(address(coinJoin), uint(-1));
        coinJoin.join(manager.urns(cdp), 1 ether);

        this.frob(address(manager), cdp, 0.5 ether, 60 ether);
        assertEq(vat.gem("COIN", manager.urns(cdp)), 0.5 ether);
        assertEq(vat.stbl(manager.urns(cdp)), mul(RAY, 60 ether));
        assertEq(vat.stbl(address(this)), 0);

        this.move(address(manager), cdp, address(this), mul(RAY, 60 ether));
        assertEq(vat.stbl(manager.urns(cdp)), 0);
        assertEq(vat.stbl(address(this)), mul(RAY, 60 ether));

        vat.hope(address(stblJoin));
        stblJoin.exit(address(this), 60 ether);
        assertEq(stbl.balanceOf(address(this)), 60 ether);
    }

    function testLockCoin() public {
        uint initialBalance = address(this).balance;
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        assertEq(ink("COIN", manager.urns(cdp)), 0);
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        assertEq(ink("COIN", manager.urns(cdp)), 2 ether);
        assertEq(address(this).balance, initialBalance - 2 ether);
    }

    function testSafeLockCoin() public {
        uint initialBalance = address(this).balance;
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        assertEq(ink("COIN", manager.urns(cdp)), 0);
        this.safeLockCoin.value(2 ether)(address(manager), address(coinJoin), cdp, address(proxy));
        assertEq(ink("COIN", manager.urns(cdp)), 2 ether);
        assertEq(address(this).balance, initialBalance - 2 ether);
    }

    function testLockCoinOtherCDPOwner() public {
        uint initialBalance = address(this).balance;
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.give(address(manager), cdp, address(123));
        assertEq(ink("COIN", manager.urns(cdp)), 0);
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        assertEq(ink("COIN", manager.urns(cdp)), 2 ether);
        assertEq(address(this).balance, initialBalance - 2 ether);
    }

    function testFailSafeLockCoinOtherCDPOwner() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.give(address(manager), cdp, address(123));
        this.safeLockCoin.value(2 ether)(address(manager), address(coinJoin), cdp, address(321));
    }

    function testLockGem() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 2 ether);
        assertEq(ink("COL", manager.urns(cdp)), 0);
        this.lockGem(address(manager), address(colJoin), cdp, 2 ether, true);
        assertEq(ink("COL", manager.urns(cdp)), 2 ether);
        assertEq(col.balanceOf(address(this)), 3 ether);
    }

    function testSafeLockGem() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 2 ether);
        assertEq(ink("COL", manager.urns(cdp)), 0);
        this.safeLockGem(address(manager), address(colJoin), cdp, 2 ether, true, address(proxy));
        assertEq(ink("COL", manager.urns(cdp)), 2 ether);
        assertEq(col.balanceOf(address(this)), 3 ether);
    }

    function testLockGemDGD() public {
        uint cdp = this.open(address(manager), "DGD", address(proxy));
        dgd.approve(address(proxy), 2 * 10 ** 9);
        assertEq(ink("DGD", manager.urns(cdp)), 0);
        uint prevBalance = dgd.balanceOf(address(this));
        this.lockGem(address(manager), address(dgdJoin), cdp, 2 * 10 ** 9, true);
        assertEq(ink("DGD", manager.urns(cdp)),  2 ether);
        assertEq(dgd.balanceOf(address(this)), prevBalance - 2 * 10 ** 9);
    }

    function testLockGemGNT() public {
        uint cdp = this.open(address(manager), "GNT", address(proxy));
        assertEq(ink("GNT", manager.urns(cdp)), 0);
        uint prevBalance = gnt.balanceOf(address(this));
        address bag = this.makeGemBag(address(gntJoin));
        assertEq(gnt.balanceOf(bag), 0);
        gnt.transfer(bag, 2 ether);
        assertEq(gnt.balanceOf(address(this)), prevBalance - 2 ether);
        assertEq(gnt.balanceOf(bag), 2 ether);
        this.lockGem(address(manager), address(gntJoin), cdp, 2 ether, false);
        assertEq(ink("GNT", manager.urns(cdp)),  2 ether);
        assertEq(gnt.balanceOf(bag), 0);
    }

    function testLockGemOtherCDPOwner() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        this.give(address(manager), cdp, address(123));
        col.approve(address(proxy), 2 ether);
        assertEq(ink("COL", manager.urns(cdp)), 0);
        this.lockGem(address(manager), address(colJoin), cdp, 2 ether, true);
        assertEq(ink("COL", manager.urns(cdp)), 2 ether);
        assertEq(col.balanceOf(address(this)), 3 ether);
    }

    function testFailSafeLockGemOtherCDPOwner() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        this.give(address(manager), cdp, address(123));
        col.approve(address(proxy), 2 ether);
        this.safeLockGem(address(manager), address(colJoin), cdp, 2 ether, true, address(321));
    }

    function testFreeCoin() public {
        uint initialBalance = address(this).balance;
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.freeCoin(address(manager), address(coinJoin), cdp, 1 ether);
        assertEq(ink("COIN", manager.urns(cdp)), 1 ether);
        assertEq(address(this).balance, initialBalance - 1 ether);
    }

    function testFreeGem() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 2 ether);
        this.lockGem(address(manager), address(colJoin), cdp, 2 ether, true);
        this.freeGem(address(manager), address(colJoin), cdp, 1 ether);
        assertEq(ink("COL", manager.urns(cdp)), 1 ether);
        assertEq(col.balanceOf(address(this)), 4 ether);
    }

    function testFreeGemDGD() public {
        uint cdp = this.open(address(manager), "DGD", address(proxy));
        dgd.approve(address(proxy), 2 * 10 ** 9);
        assertEq(ink("DGD", manager.urns(cdp)), 0);
        uint prevBalance = dgd.balanceOf(address(this));
        this.lockGem(address(manager), address(dgdJoin), cdp, 2 * 10 ** 9, true);
        this.freeGem(address(manager), address(dgdJoin), cdp, 1 * 10 ** 9);
        assertEq(ink("DGD", manager.urns(cdp)),  1 ether);
        assertEq(dgd.balanceOf(address(this)), prevBalance - 1 * 10 ** 9);
    }

    function testFreeGemGNT() public {
        uint cdp = this.open(address(manager), "GNT", address(proxy));
        assertEq(ink("GNT", manager.urns(cdp)), 0);
        uint prevBalance = gnt.balanceOf(address(this));
        address bag = this.makeGemBag(address(gntJoin));
        gnt.transfer(bag, 2 ether);
        this.lockGem(address(manager), address(gntJoin), cdp, 2 ether, false);
        this.freeGem(address(manager), address(gntJoin), cdp, 1 ether);
        assertEq(ink("GNT", manager.urns(cdp)),  1 ether);
        assertEq(gnt.balanceOf(address(this)), prevBalance - 1 ether);
    }

    function testDraw() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        assertEq(stbl.balanceOf(address(this)), 0);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        assertEq(stbl.balanceOf(address(this)), 300 ether);
        assertEq(art("COIN", manager.urns(cdp)), 300 ether);
    }

    function testDrawAfterDrip() public {
        this.file(address(jug), bytes32("COIN"), bytes32("duty"), uint(1.05 * 10 ** 27));
        hevm.warp(now + 1);
        jug.drip("COIN"); // This is actually not necessary as `draw` will also call drip
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        assertEq(stbl.balanceOf(address(this)), 0);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        assertEq(stbl.balanceOf(address(this)), 300 ether);
        assertEq(art("COIN", manager.urns(cdp)), mul(300 ether, RAY) / (1.05 * 10 ** 27) + 1); // Extra wei due rounding
    }

    function testWipe() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 100 ether);
        this.wipe(address(manager), address(stblJoin), cdp, 100 ether);
        assertEq(stbl.balanceOf(address(this)), 200 ether);
        assertEq(art("COIN", manager.urns(cdp)), 200 ether);
    }

    function testWipeAll() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 300 ether);
        this.wipeAll(address(manager), address(stblJoin), cdp);
        assertEq(stbl.balanceOf(address(this)), 0);
        assertEq(art("COIN", manager.urns(cdp)), 0);
    }

    function testSafeWipe() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 100 ether);
        this.safeWipe(address(manager), address(stblJoin), cdp, 100 ether, address(proxy));
        assertEq(stbl.balanceOf(address(this)), 200 ether);
        assertEq(art("COIN", manager.urns(cdp)), 200 ether);
    }

    function testSafeWipeAll() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 300 ether);
        this.safeWipeAll(address(manager), address(stblJoin), cdp, address(proxy));
        assertEq(stbl.balanceOf(address(this)), 0);
        assertEq(art("COIN", manager.urns(cdp)), 0);
    }

    function testWipeOtherCDPOwner() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 100 ether);
        this.give(address(manager), cdp, address(123));
        this.wipe(address(manager), address(stblJoin), cdp, 100 ether);
        assertEq(stbl.balanceOf(address(this)), 200 ether);
        assertEq(art("COIN", manager.urns(cdp)), 200 ether);
    }

    function testFailSafeWipeOtherCDPOwner() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 100 ether);
        this.give(address(manager), cdp, address(123));
        this.safeWipe(address(manager), address(stblJoin), cdp, 100 ether, address(321));
    }

    function testFailSafeWipeAllOtherCDPOwner() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 300 ether);
        this.give(address(manager), cdp, address(123));
        this.safeWipeAll(address(manager), address(stblJoin), cdp, address(321));
    }

    function testWipeAfterDrip() public {
        this.file(address(jug), bytes32("COIN"), bytes32("duty"), uint(1.05 * 10 ** 27));
        hevm.warp(now + 1);
        jug.drip("COIN");
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 100 ether);
        this.wipe(address(manager), address(stblJoin), cdp, 100 ether);
        assertEq(stbl.balanceOf(address(this)), 200 ether);
        assertEq(art("COIN", manager.urns(cdp)), mul(200 ether, RAY) / (1.05 * 10 ** 27) + 1);
    }

    function testWipeAllAfterDrip() public {
        this.file(address(jug), bytes32("COIN"), bytes32("duty"), uint(1.05 * 10 ** 27));
        hevm.warp(now + 1);
        jug.drip("COIN");
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoin.value(2 ether)(address(manager), address(coinJoin), cdp);
        this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 300 ether);
        this.wipe(address(manager), address(stblJoin), cdp, 300 ether);
        assertEq(art("COIN", manager.urns(cdp)), 0);
    }

    function testWipeAllAfterDrip2() public {
        this.file(address(jug), bytes32("COIN"), bytes32("duty"), uint(1.05 * 10 ** 27));
        hevm.warp(now + 1);
        jug.drip("COIN"); // This is actually not necessary as `draw` will also call drip
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        uint times = 30;
        this.lockCoin.value(2 ether * times)(address(manager), address(coinJoin), cdp);
        for (uint i = 0; i < times; i++) {
            this.draw(address(manager), address(jug), address(stblJoin), cdp, 300 ether);
        }
        stbl.approve(address(proxy), 300 ether * times);
        this.wipe(address(manager), address(stblJoin), cdp, 300 ether * times);
        assertEq(art("COIN", manager.urns(cdp)), 0);
    }

    function testLockCoinAndDraw() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        uint initialBalance = address(this).balance;
        assertEq(ink("COIN", manager.urns(cdp)), 0);
        assertEq(stbl.balanceOf(address(this)), 0);
        this.lockCoinAndDraw.value(2 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 300 ether);
        assertEq(ink("COIN", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 300 ether);
        assertEq(address(this).balance, initialBalance - 2 ether);
    }

    function testOpenLockCoinAndDraw() public {
        uint initialBalance = address(this).balance;
        assertEq(stbl.balanceOf(address(this)), 0);
        uint cdp = this.openLockCoinAndDraw.value(2 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), "COIN", 300 ether);
        assertEq(ink("COIN", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 300 ether);
        assertEq(address(this).balance, initialBalance - 2 ether);
    }

    function testLockGemAndDraw() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 2 ether);
        assertEq(ink("COL", manager.urns(cdp)), 0);
        assertEq(stbl.balanceOf(address(this)), 0);
        this.lockGemAndDraw(address(manager), address(jug), address(colJoin), address(stblJoin), cdp, 2 ether, 10 ether, true);
        assertEq(ink("COL", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 10 ether);
        assertEq(col.balanceOf(address(this)), 3 ether);
    }

    function testLockGemDGDAndDraw() public {
        uint cdp = this.open(address(manager), "DGD", address(proxy));
        dgd.approve(address(proxy), 3 * 10 ** 9);
        assertEq(ink("DGD", manager.urns(cdp)), 0);
        uint prevBalance = dgd.balanceOf(address(this));
        this.lockGemAndDraw(address(manager), address(jug), address(dgdJoin), address(stblJoin), cdp, 3 * 10 ** 9, 50 ether, true);
        assertEq(ink("DGD", manager.urns(cdp)), 3 ether);
        assertEq(stbl.balanceOf(address(this)), 50 ether);
        assertEq(dgd.balanceOf(address(this)), prevBalance - 3 * 10 ** 9);
    }

    function testLockGemGNTAndDraw() public {
        uint cdp = this.open(address(manager), "GNT", address(proxy));
        assertEq(ink("GNT", manager.urns(cdp)), 0);
        uint prevBalance = gnt.balanceOf(address(this));
        address bag = this.makeGemBag(address(gntJoin));
        gnt.transfer(bag, 3 ether);
        this.lockGemAndDraw(address(manager), address(jug), address(gntJoin), address(stblJoin), cdp, 3 ether, 50 ether, false);
        assertEq(ink("GNT", manager.urns(cdp)), 3 ether);
        assertEq(stbl.balanceOf(address(this)), 50 ether);
        assertEq(gnt.balanceOf(address(this)), prevBalance - 3 ether);
    }

    function testOpenLockGemAndDraw() public {
        col.mint(5 ether);
        col.approve(address(proxy), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 0);
        uint cdp = this.openLockGemAndDraw(address(manager), address(jug), address(colJoin), address(stblJoin), "COL", 2 ether, 10 ether, true);
        assertEq(ink("COL", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 10 ether);
        assertEq(col.balanceOf(address(this)), 3 ether);
    }

    function testOpenLockGemGNTAndDraw() public {
        assertEq(stbl.balanceOf(address(this)), 0);
        address bag = this.makeGemBag(address(gntJoin));
        assertEq(address(bag), gntJoin.bags(address(proxy)));
        gnt.transfer(bag, 2 ether);
        uint cdp = this.openLockGemAndDraw(address(manager), address(jug), address(gntJoin), address(stblJoin), "GNT", 2 ether, 10 ether, false);
        assertEq(ink("GNT", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 10 ether);
    }

    function testOpenLockGemGNTAndDrawSafe() public {
        assertEq(stbl.balanceOf(address(this)), 0);
        gnt.transfer(address(proxy), 2 ether);
        (address bag, uint cdp) = this.openLockGNTAndDraw(address(manager), address(jug), address(gntJoin), address(stblJoin), "GNT", 2 ether, 10 ether);
        assertEq(address(bag), gntJoin.bags(address(proxy)));
        assertEq(ink("GNT", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 10 ether);
    }

    function testOpenLockGemGNTAndDrawSafeTwice() public {
        assertEq(stbl.balanceOf(address(this)), 0);
        gnt.transfer(address(proxy), 4 ether);
        (address bag, uint cdp) = this.openLockGNTAndDraw(address(manager), address(jug), address(gntJoin), address(stblJoin), "GNT", 2 ether, 10 ether);
        (address bag2, uint cdp2) = this.openLockGNTAndDraw(address(manager), address(jug), address(gntJoin), address(stblJoin), "GNT", 2 ether, 10 ether);
        assertEq(address(bag), gntJoin.bags(address(proxy)));
        assertEq(address(bag), address(bag2));
        assertEq(ink("GNT", manager.urns(cdp)), 2 ether);
        assertEq(ink("GNT", manager.urns(cdp2)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 20 ether);
    }

    function testWipeAndFreeCoin() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        uint initialBalance = address(this).balance;
        this.lockCoinAndDraw.value(2 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 250 ether);
        this.wipeAndFreeCoin(address(manager), address(coinJoin), address(stblJoin), cdp, 1.5 ether, 250 ether);
        assertEq(ink("COIN", manager.urns(cdp)), 0.5 ether);
        assertEq(art("COIN", manager.urns(cdp)), 50 ether);
        assertEq(stbl.balanceOf(address(this)), 50 ether);
        assertEq(address(this).balance, initialBalance - 0.5 ether);
    }

    function testWipeAllAndFreeCoin() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        uint initialBalance = address(this).balance;
        this.lockCoinAndDraw.value(2 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 300 ether);
        stbl.approve(address(proxy), 300 ether);
        this.wipeAllAndFreeCoin(address(manager), address(coinJoin), address(stblJoin), cdp, 1.5 ether);
        assertEq(ink("COIN", manager.urns(cdp)), 0.5 ether);
        assertEq(art("COIN", manager.urns(cdp)), 0);
        assertEq(stbl.balanceOf(address(this)), 0);
        assertEq(address(this).balance, initialBalance - 0.5 ether);
    }

    function testWipeAndFreeGem() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 2 ether);
        this.lockGemAndDraw(address(manager), address(jug), address(colJoin), address(stblJoin), cdp, 2 ether, 10 ether, true);
        stbl.approve(address(proxy), 8 ether);
        this.wipeAndFreeGem(address(manager), address(colJoin), address(stblJoin), cdp, 1.5 ether, 8 ether);
        assertEq(ink("COL", manager.urns(cdp)), 0.5 ether);
        assertEq(art("COL", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 2 ether);
        assertEq(col.balanceOf(address(this)), 4.5 ether);
    }

    function testWipeAllAndFreeGem() public {
        col.mint(5 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 2 ether);
        this.lockGemAndDraw(address(manager), address(jug), address(colJoin), address(stblJoin), cdp, 2 ether, 10 ether, true);
        stbl.approve(address(proxy), 10 ether);
        this.wipeAllAndFreeGem(address(manager), address(colJoin), address(stblJoin), cdp, 1.5 ether);
        assertEq(ink("COL", manager.urns(cdp)), 0.5 ether);
        assertEq(art("COL", manager.urns(cdp)), 0);
        assertEq(stbl.balanceOf(address(this)), 0);
        assertEq(col.balanceOf(address(this)), 4.5 ether);
    }

    function testWipeAndFreeGemDGDAndDraw() public {
        uint cdp = this.open(address(manager), "DGD", address(proxy));
        dgd.approve(address(proxy), 3 * 10 ** 9);
        assertEq(ink("DGD", manager.urns(cdp)), 0);
        uint prevBalance = dgd.balanceOf(address(this));
        this.lockGemAndDraw(address(manager), address(jug), address(dgdJoin), address(stblJoin), cdp, 3 * 10 ** 9, 50 ether, true);
        stbl.approve(address(proxy), 25 ether);
        this.wipeAndFreeGem(address(manager), address(dgdJoin), address(stblJoin), cdp, 1 * 10 ** 9, 25 ether);
        assertEq(ink("DGD", manager.urns(cdp)), 2 ether);
        assertEq(stbl.balanceOf(address(this)), 25 ether);
        assertEq(dgd.balanceOf(address(this)), prevBalance - 2 * 10 ** 9);
    }

    function testPreventHigherStblOnWipe() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(2 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 300 ether);

        realWcoin.deposit.value(2 ether)();
        realWcoin.approve(address(coinJoin), 2 ether);
        coinJoin.join(address(this), 2 ether);
        vat.frob("COIN", address(this), address(this), address(this), 1 ether, 150 ether);
        vat.move(address(this), manager.urns(cdp), 150 ether);

        stbl.approve(address(proxy), 300 ether);
        this.wipe(address(manager), address(stblJoin), cdp, 300 ether);
    }

    function testHopeNope() public {
        assertEq(vat.can(address(proxy), address(123)), 0);
        this.hope(address(vat), address(123));
        assertEq(vat.can(address(proxy), address(123)), 1);
        this.nope(address(vat), address(123));
        assertEq(vat.can(address(proxy), address(123)), 0);
    }

    function testQuit() public {
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 50 ether);

        assertEq(ink("COIN", manager.urns(cdp)), 1 ether);
        assertEq(art("COIN", manager.urns(cdp)), 50 ether);
        assertEq(ink("COIN", address(proxy)), 0);
        assertEq(art("COIN", address(proxy)), 0);

        this.hope(address(vat), address(manager));
        this.quit(address(manager), cdp, address(proxy));

        assertEq(ink("COIN", manager.urns(cdp)), 0);
        assertEq(art("COIN", manager.urns(cdp)), 0);
        assertEq(ink("COIN", address(proxy)), 1 ether);
        assertEq(art("COIN", address(proxy)), 50 ether);
    }

    function testEnter() public {
        realWcoin.deposit.value(1 ether)();
        realWcoin.approve(address(coinJoin), 1 ether);
        coinJoin.join(address(this), 1 ether);
        vat.frob("COIN", address(this), address(this), address(this), 1 ether, 50 ether);
        uint cdp = this.open(address(manager), "COIN", address(proxy));

        assertEq(ink("COIN", manager.urns(cdp)), 0);
        assertEq(art("COIN", manager.urns(cdp)), 0);
        assertEq(ink("COIN", address(this)), 1 ether);
        assertEq(art("COIN", address(this)), 50 ether);

        vat.hope(address(manager));
        manager.urnAllow(address(proxy), 1);
        this.enter(address(manager), address(this), cdp);

        assertEq(ink("COIN", manager.urns(cdp)), 1 ether);
        assertEq(art("COIN", manager.urns(cdp)), 50 ether);
        assertEq(ink("COIN", address(this)), 0);
        assertEq(art("COIN", address(this)), 0);
    }

    function testShift() public {
        uint cdpSrc = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdpSrc, 50 ether);

        uint cdpDst = this.open(address(manager), "COIN", address(proxy));

        assertEq(ink("COIN", manager.urns(cdpSrc)), 1 ether);
        assertEq(art("COIN", manager.urns(cdpSrc)), 50 ether);
        assertEq(ink("COIN", manager.urns(cdpDst)), 0);
        assertEq(art("COIN", manager.urns(cdpDst)), 0);

        this.shift(address(manager), cdpSrc, cdpDst);

        assertEq(ink("COIN", manager.urns(cdpSrc)), 0);
        assertEq(art("COIN", manager.urns(cdpSrc)), 0);
        assertEq(ink("COIN", manager.urns(cdpDst)), 1 ether);
        assertEq(art("COIN", manager.urns(cdpDst)), 50 ether);
    }

    function _flipCoin() internal returns (uint cdp) {
        this.file(address(cat), "COIN", "dunk", rad(200 ether)); // 200 units of STBL per batch
        this.file(address(cat), "box", rad(1000 ether)); // 1000 units of STBL max
        this.file(address(cat), "COIN", "chop", WAD);

        cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 200 ether); // Maximun STBL generated
        pipCOIN.poke(bytes32(uint(300 * 10 ** 18 - 1))); // Force liquidation
        spotter.poke("COIN");
        uint batchId = cat.bite("COIN", manager.urns(cdp));

        realWcoin.deposit.value(10 ether)();
        realWcoin.transfer(address(user1), 10 ether);
        user1.doWcoinJoin(address(realWcoin), address(coinJoin), address(user1), 10 ether);
        user1.doFrob(address(vat), "COIN", address(user1), address(user1), address(user1), 10 ether, 1000 ether);

        realWcoin.deposit.value(10 ether)();
        realWcoin.transfer(address(user2), 10 ether);
        user2.doWcoinJoin(address(realWcoin), address(coinJoin), address(user2), 10 ether);
        user2.doFrob(address(vat), "COIN", address(user2), address(user2), address(user2), 10 ether, 1000 ether);

        user1.doHope(address(vat), address(coinFlip));
        user2.doHope(address(vat), address(coinFlip));

        user1.doTend(address(coinFlip), batchId, 1 ether, rad(200 ether));

        user2.doDent(address(coinFlip), batchId, 0.7 ether, rad(200 ether));
    }

    function testExitCoinAfterFlip() public {
        uint cdp = _flipCoin();
        assertEq(vat.gem("COIN", manager.urns(cdp)), 0.3 ether);
        uint prevBalance = address(this).balance;
        this.exitCoin(address(manager), address(coinJoin), cdp, 0.3 ether);
        assertEq(vat.gem("COIN", manager.urns(cdp)), 0);
        assertEq(address(this).balance, prevBalance + 0.3 ether);
    }

    function testExitGemAfterFlip() public {
        this.file(address(cat), "COL", "dunk", rad(40 ether)); // 100 units of STBL per batch
        this.file(address(cat), "box", rad(1000 ether)); // 1000 units of STBL max
        this.file(address(cat), "COL", "chop", WAD);

        col.mint(1 ether);
        uint cdp = this.open(address(manager), "COL", address(proxy));
        col.approve(address(proxy), 1 ether);
        this.lockGemAndDraw(address(manager), address(jug), address(colJoin), address(stblJoin), cdp, 1 ether, 40 ether, true);

        pipCOL.poke(bytes32(uint(40 * 10 ** 18))); // Force liquidation
        spotter.poke("COL");
        uint batchId = cat.bite("COL", manager.urns(cdp));

        realWcoin.deposit.value(10 ether)();
        realWcoin.transfer(address(user1), 10 ether);
        user1.doWcoinJoin(address(realWcoin), address(coinJoin), address(user1), 10 ether);
        user1.doFrob(address(vat), "COIN", address(user1), address(user1), address(user1), 10 ether, 1000 ether);

        realWcoin.deposit.value(10 ether)();
        realWcoin.transfer(address(user2), 10 ether);
        user2.doWcoinJoin(address(realWcoin), address(coinJoin), address(user2), 10 ether);
        user2.doFrob(address(vat), "COIN", address(user2), address(user2), address(user2), 10 ether, 1000 ether);

        user1.doHope(address(vat), address(colFlip));
        user2.doHope(address(vat), address(colFlip));

        user1.doTend(address(colFlip), batchId, 1 ether, rad(40 ether));

        user2.doDent(address(colFlip), batchId, 0.7 ether, rad(40 ether));
        assertEq(vat.gem("COL", manager.urns(cdp)), 0.3 ether);
        assertEq(col.balanceOf(address(this)), 0);
        this.exitGem(address(manager), address(colJoin), cdp, 0.3 ether);
        assertEq(vat.gem("COL", manager.urns(cdp)), 0);
        assertEq(col.balanceOf(address(this)), 0.3 ether);
    }

    function testExitDGDAfterFlip() public {
        this.file(address(cat), "DGD", "dunk", rad(30 ether)); // 30 units of STBL per batch
        this.file(address(cat), "box", rad(1000 ether)); // 1000 units of STBL max
        this.file(address(cat), "DGD", "chop", WAD);

        uint cdp = this.open(address(manager), "DGD", address(proxy));
        dgd.approve(address(proxy), 1 * 10 ** 9);
        this.lockGemAndDraw(address(manager), address(jug), address(dgdJoin), address(stblJoin), cdp, 1 * 10 ** 9, 30 ether, true);

        pipDGD.poke(bytes32(uint(40 * 10 ** 18))); // Force liquidation
        spotter.poke("DGD");
        uint batchId = cat.bite("DGD", manager.urns(cdp));

        realWcoin.deposit.value(10 ether)();
        realWcoin.transfer(address(user1), 10 ether);
        user1.doWcoinJoin(address(realWcoin), address(coinJoin), address(user1), 10 ether);
        user1.doFrob(address(vat), "COIN", address(user1), address(user1), address(user1), 10 ether, 1000 ether);

        realWcoin.deposit.value(10 ether)();
        realWcoin.transfer(address(user2), 10 ether);
        user2.doWcoinJoin(address(realWcoin), address(coinJoin), address(user2), 10 ether);
        user2.doFrob(address(vat), "COIN", address(user2), address(user2), address(user2), 10 ether, 1000 ether);

        user1.doHope(address(vat), address(dgdFlip));
        user2.doHope(address(vat), address(dgdFlip));

        user1.doTend(address(dgdFlip), batchId, 1 ether, rad(30 ether));

        user2.doDent(address(dgdFlip), batchId, 0.7 ether, rad(30 ether));
        assertEq(vat.gem("DGD", manager.urns(cdp)), 0.3 ether);
        uint prevBalance = dgd.balanceOf(address(this));
        this.exitGem(address(manager), address(dgdJoin), cdp, 0.3 * 10 ** 9);
        assertEq(vat.gem("DGD", manager.urns(cdp)), 0);
        assertEq(dgd.balanceOf(address(this)), prevBalance + 0.3 * 10 ** 9);
    }

    function testLockBackAfterFlip() public {
        uint cdp = _flipCoin();
        (uint inkV,) = vat.urns("COIN", manager.urns(cdp));
        assertEq(inkV, 0);
        assertEq(vat.gem("COIN", manager.urns(cdp)), 0.3 ether);
        this.frob(address(manager), cdp, 0.3 ether, 0);
        (inkV,) = vat.urns("COIN", manager.urns(cdp));
        assertEq(inkV, 0.3 ether);
        assertEq(vat.gem("COIN", manager.urns(cdp)), 0);
    }

    function testEnd() public {
        uint cdp = this.openLockCoinAndDraw.value(2 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), "COIN", 300 ether);
        col.mint(1 ether);
        col.approve(address(proxy), 1 ether);
        uint cdp2 = this.openLockGemAndDraw(address(manager), address(jug), address(colJoin), address(stblJoin), "COL", 1 ether, 5 ether, true);
        dgd.approve(address(proxy), 1 * 10 ** 9);
        uint cdp3 = this.openLockGemAndDraw(address(manager), address(jug), address(dgdJoin), address(stblJoin), "DGD", 1 * 10 ** 9, 5 ether, true);

        this.cage(address(end));
        end.cage("COIN");
        end.cage("COL");
        end.cage("DGD");

        (uint inkV, uint artV) = vat.urns("COIN", manager.urns(cdp));
        assertEq(inkV, 2 ether);
        assertEq(artV, 300 ether);

        (inkV, artV) = vat.urns("COL", manager.urns(cdp2));
        assertEq(inkV, 1 ether);
        assertEq(artV, 5 ether);

        (inkV, artV) = vat.urns("DGD", manager.urns(cdp3));
        assertEq(inkV, 1 ether);
        assertEq(artV, 5 ether);

        uint prevBalanceCoin = address(this).balance;
        this.end_freeCoin(address(manager), address(coinJoin), address(end), cdp);
        (inkV, artV) = vat.urns("COIN", manager.urns(cdp));
        assertEq(inkV, 0);
        assertEq(artV, 0);
        uint remainInkVal = 2 ether - 300 * end.tag("COIN") / 10 ** 9; // 2 COIN (deposited) - 300 STBL debt * COIN cage price
        assertEq(address(this).balance, prevBalanceCoin + remainInkVal);

        uint prevBalanceCol = col.balanceOf(address(this));
        this.end_freeGem(address(manager), address(colJoin), address(end), cdp2);
        (inkV, artV) = vat.urns("COL", manager.urns(cdp2));
        assertEq(inkV, 0);
        assertEq(artV, 0);
        remainInkVal = 1 ether - 5 * end.tag("COL") / 10 ** 9; // 1 COL (deposited) - 5 STBL debt * COL cage price
        assertEq(col.balanceOf(address(this)), prevBalanceCol + remainInkVal);

        uint prevBalanceDGD = dgd.balanceOf(address(this));
        this.end_freeGem(address(manager), address(dgdJoin), address(end), cdp3);
        (inkV, artV) = vat.urns("DGD", manager.urns(cdp3));
        assertEq(inkV, 0);
        assertEq(artV, 0);
        remainInkVal = (1 ether - 5 * end.tag("DGD") / 10 ** 9) / 10 ** 9; // 1 DGD (deposited) - 5 STBL debt * DGD cage price
        assertEq(dgd.balanceOf(address(this)), prevBalanceDGD + remainInkVal);

        end.thaw();

        end.flow("COIN");
        end.flow("COL");
        end.flow("DGD");

        stbl.approve(address(proxy), 310 ether);
        this.end_pack(address(stblJoin), address(end), 310 ether);

        this.end_cashCoin(address(coinJoin), address(end), "COIN", 310 ether);
        this.end_cashGem(address(colJoin), address(end), "COL", 310 ether);
        this.end_cashGem(address(dgdJoin), address(end), "DGD", 310 ether);

        assertEq(address(this).balance, prevBalanceCoin + 2 ether - 1); // (-1 rounding)
        assertEq(col.balanceOf(address(this)), prevBalanceCol + 1 ether - 1); // (-1 rounding)
        assertEq(dgd.balanceOf(address(this)), prevBalanceDGD + 1 * 10 ** 9 - 1); // (-1 rounding)
    }

    function testDSRSimpleCase() public {
        this.file(address(pot), "dsr", uint(1.05 * 10 ** 27)); // 5% per second
        uint initialTime = 0; // Initial time set to 0 to avoid any intial rounding
        hevm.warp(initialTime);
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 50 ether);
        stbl.approve(address(proxy), 50 ether);
        assertEq(stbl.balanceOf(address(this)), 50 ether);
        assertEq(pot.pie(address(this)), 0 ether);
        this.nope(address(vat), address(stblJoin)); // Remove vat permission for stblJoin to test it is correctly re-activate in exit
        this.dsr_join(address(stblJoin), address(pot), 50 ether);
        assertEq(stbl.balanceOf(address(this)), 0 ether);
        assertEq(pot.pie(address(proxy)) * pot.chi(), 50 ether * RAY);
        hevm.warp(initialTime + 1); // Moved 1 second
        pot.drip();
        assertEq(pot.pie(address(proxy)) * pot.chi(), 52.5 ether * RAY); // Now the equivalent STBL amount is 2.5 STBL extra
        this.dsr_exit(address(stblJoin), address(pot), 52.5 ether);
        assertEq(stbl.balanceOf(address(this)), 52.5 ether);
        assertEq(pot.pie(address(proxy)), 0);
    }

    function testDSRRounding() public {
        this.file(address(pot), "dsr", uint(1.05 * 10 ** 27));
        uint initialTime = 1; // Initial time set to 1 this way some the pie will not be the same than the initial STBL wad amount
        hevm.warp(initialTime);
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 50 ether);
        stbl.approve(address(proxy), 50 ether);
        assertEq(stbl.balanceOf(address(this)), 50 ether);
        assertEq(pot.pie(address(this)), 0 ether);
        this.nope(address(vat), address(stblJoin)); // Remove vat permission for stblJoin to test it is correctly re-activate in exit
        this.dsr_join(address(stblJoin), address(pot), 50 ether);
        assertEq(stbl.balanceOf(address(this)), 0 ether);
        // Due rounding the STBL equivalent is not the same than initial wad amount
        assertEq(pot.pie(address(proxy)) * pot.chi(), 49999999999999999999350000000000000000000000000);
        hevm.warp(initialTime + 1);
        pot.drip(); // Just necessary to check in this test the updated value of chi
        assertEq(pot.pie(address(proxy)) * pot.chi(), 52499999999999999999317500000000000000000000000);
        this.dsr_exit(address(stblJoin), address(pot), 52.5 ether);
        assertEq(stbl.balanceOf(address(this)), 52499999999999999999);
        assertEq(pot.pie(address(proxy)), 0);
    }

    function testDSRRounding2() public {
        this.file(address(pot), "dsr", uint(1.03434234324 * 10 ** 27));
        uint initialTime = 1;
        hevm.warp(initialTime);
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 50 ether);
        stbl.approve(address(proxy), 50 ether);
        assertEq(stbl.balanceOf(address(this)), 50 ether);
        assertEq(pot.pie(address(this)), 0 ether);
        this.nope(address(vat), address(stblJoin)); // Remove vat permission for stblJoin to test it is correctly re-activate in exit
        this.dsr_join(address(stblJoin), address(pot), 50 ether);
        assertEq(pot.pie(address(proxy)) * pot.chi(), 49999999999999999999993075745400000000000000000);
        assertEq(vat.stbl(address(proxy)), mul(50 ether, RAY) - 49999999999999999999993075745400000000000000000);
        this.dsr_exit(address(stblJoin), address(pot), 50 ether);
        // In this case we get the full 50 STBL back as we also use (for the exit) the dust that remained in the proxy STBL balance in the vat
        // The proxy function tries to return the wad amount if there is enough balance to do it
        assertEq(stbl.balanceOf(address(this)), 50 ether);
    }

    function testDSRExitAll() public {
        this.file(address(pot), "dsr", uint(1.03434234324 * 10 ** 27));
        uint initialTime = 1;
        hevm.warp(initialTime);
        uint cdp = this.open(address(manager), "COIN", address(proxy));
        this.lockCoinAndDraw.value(1 ether)(address(manager), address(jug), address(coinJoin), address(stblJoin), cdp, 50 ether);
        this.nope(address(vat), address(stblJoin)); // Remove vat permission for stblJoin to test it is correctly re-activate in exitAll
        stbl.approve(address(proxy), 50 ether);
        this.dsr_join(address(stblJoin), address(pot), 50 ether);
        this.dsr_exitAll(address(stblJoin), address(pot));
        // In this case we get 49.999 STBL back as the returned amount is based purely in the pie amount
        assertEq(stbl.balanceOf(address(this)), 49999999999999999999);
    }

    function () external payable {}
}
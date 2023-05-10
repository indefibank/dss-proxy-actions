# dss-proxy-actions
![Build Status](https://github.com/indefibank/dss-proxy-actions/actions/workflows/.github/workflows/tests.yaml/badge.svg?branch=master)

Proxy functions to be used via ds-proxy. These functions are based on `dss-cdp-manager` as CDP registry.

https://github.com/indefibank/dss-proxy-actions

## DssProxyActions

`open(address manager, bytes32 ilk, address usr)`: creates an `UrnHandler` (`cdp`) for the address `usr` (for a specific `ilk`) and allows to manage it via the internal registry of the `manager`.

`give(address manager, uint cdp, address usr)`: transfers the ownership of `cdp` to `usr` address in the `manager` registry.

`giveToProxy(address proxyRegistry, address manager, uint cdp, address usr)`: transfers the ownership of `cdp` to the proxy of `usr` address (via `proxyRegistry`) in the `manager` registry.

`cdpAllow(address manager, uint cdp, address usr, uint ok)`: allows/denies `usr` address to manage the `cdp`.

`urnAllow(address manager, address usr, uint ok)`: allows/denies `usr` address to manage the `msg.sender` address as `dst` for `quit`.

`flux(address manager, uint cdp, address dst, uint wad)`: moves `wad` amount of collateral from `cdp` address to `dst` address.

`move(address manager, uint cdp, address dst, uint rad)`: moves `rad` amount of STBL from `cdp` address to `dst` address.

`frob(address manager, uint cdp, int dink, int dart)`: executes `frob` to `cdp` address assigning the collateral freed and/or STBL drawn to the same address.

`quit(address manager, uint cdp, address dst)`: moves `cdp` collateral balance and debt to `dst` address.

`enter(address manager, address src, uint cdp)`: moves `src` collateral balance and debt to `cdp`.

`shift(address manager, uint cdpSrc, uint cdpDst)`: moves `cdpSrc` collateral balance and debt to `cdpDst`.

`lockCoin(address manager, address coinJoin, uint cdp)`: deposits `msg.value` amount of COIN in `coinJoin` adapter and executes `frob` to `cdp` increasing the locked value.

`safeLockCoin(address manager, address coinJoin, uint cdp, address owner)`: same than `lockCoin` but requiring `owner == cdp owner`.

`lockGem(address manager, address gemJoin, uint cdp, uint wad, bool transferFrom)`: deposits `wad` amount of collateral in `gemJoin` adapter and executes `frob` to `cdp` increasing the locked value. Gets funds from `msg.sender` if `transferFrom == true`.

`safeLockGem(address manager, address gemJoin, uint cdp, uint wad, bool transferFrom, address owner)`: same than `lockGem` but requiring `owner == cdp owner`.

`freeCoin(address manager, address coinJoin, uint cdp, uint wad)`: executes `frob` to `cdp` decreasing locked collateral and withdraws `wad` amount of COIN from `coinJoin` adapter.

`freeGem(address manager, address gemJoin, uint cdp, uint wad)`: executes `frob` to `cdp` decreasing locked collateral and withdraws `wad` amount of collateral from `gemJoin` adapter.

`draw(address manager, address jug, address stblJoin, uint cdp, uint wad)`: updates collateral fee rate, executes `frob` to `cdp` increasing debt and exits `wad` amount of STBL token (minting it) from `stblJoin` adapter.

`wipe(address manager, address stblJoin, uint cdp, uint wad)`: joins `wad` amount of STBL token to `stblJoin` adapter (burning it) and executes `frob` to `cdp` for decreasing debt.

`safeWipe(address manager, address stblJoin, uint cdp, uint wad, address owner)`: same than `wipe` but requiring `owner == cdp owner`.

`wipeAll(address manager, address stblJoin, uint cdp)`: joins all the necessary amount of STBL token to `stblJoin` adapter (burning it) and executes `frob` to `cdp` setting the debt to zero.

`safeWipeAll(address manager, address stblJoin, uint cdp, address owner)`: same than `wipeAll` but requiring `owner == cdp owner`.

`lockCoinAndDraw(address manager, address jug, address coinJoin, address stblJoin, uint cdp, uint wadD)`: combines `lockCoin` and `draw`.

`openLockCoinAndDraw(address manager, address jug, address coinJoin, address stblJoin, bytes32 ilk, uint wadD)`: combines `open`, `lockCoin` and `draw`.

`lockGemAndDraw(address manager, address jug, address gemJoin, address stblJoin, uint cdp, uint wadC, uint wadD, bool transferFrom)`: combines `lockGem` and `draw`.

`openLockGemAndDraw(address manager, address jug, address gemJoin, address stblJoin, bytes32 ilk, uint wadC, uint wadD, bool transferFrom)`: combines `open`, `lockGem` and `draw`.

`wipeAndFreeCoin(address manager, address coinJoin, address stblJoin, uint cdp, uint wadC, uint wadD)`: combines `wipe` and `freeCoin`.

`wipeAllAndFreeCoin(address manager, address coinJoin, address stblJoin, uint cdp, uint wadC)`: combines `wipeAll` and `freeCoin`.

`wipeAndFreeGem(address manager, address gemJoin, address stblJoin, uint cdp, uint wadC, uint wadD)`: combines `wipe` and `freeGem`.

`wipeAllAndFreeGem(address manager, address gemJoin, address stblJoin, uint cdp, uint wadC)`: combines `wipeAll` and `freeGem`.

`openLockGNTAndDraw(address manager, address jug, address gntJoin, address stblJoin, bytes32 ilk, uint wadC, uint wadD)`: like `openLockGemAndDraw` but specially for GNT token.

## DssProxyActionsFlip

`exitCoin(address manager, address coinJoin, uint cdp, uint wad)`: exits `wad` amount of COIN from `coinJoin` adapter (received in the `cdp` urn after the liquidation auction is over).

`exitGem(address manager, address gemJoin, uint cdp, uint wad)`: exits `wad` amount of collateral from `gemJoin` adapter (received in the `cdp` urn after the liquidation auction is over).

## DssProxyActionsEnd

`freeCoin(address manager, address coinJoin, address end, uint cdp)`: after system is caged, recovers remaining COIN from `cdp` (pays remaining debt if exists).

`freeGem(address manager, address gemJoin, address end, uint cdp)`: after system is caged, recovers remaining token from `cdp` (pays remaining debt if exists).

`pack(address stblJoin, address end, uint wad)`: after system is caged, packs `wad` amount of STBL to be ready for cashing.

`cashCoin(address coinJoin, address end, bytes32 ilk, uint wad)`: after system is caged, cashes `wad` amount of previously packed STBL and returns the equivalent in COIN.

`cashGem(address gemJoin, address end, bytes32 ilk, uint wad)`: after system is caged, cashes `wad` amount of previously packed STBL and returns the equivalent in token.

## DssProxyActionsDsr

`join(address stblJoin, address pot, uint wad)`: joins `wad` amount of STBL token to `stblJoin` adapter (burning it) and moves balance to `pot` for STBL Saving Rates.

`exit(address stblJoin, address pot, uint wad)`: retrieves `wad` amount of STBL from `pot` and exits STBL token from `stblJoin` adapter (minting it).

`exitAll(address stblJoin, address pot)`: same than `exit` but all the available amount.

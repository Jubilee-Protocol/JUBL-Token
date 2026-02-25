# 🏛️ JUBL Token

> The governance and utility token of the Jubilee Protocol — designed to align incentives and empower stakeholders with **Financial Power and Governance Rights**.

**Token**: `$JUBL` — ERC-20 on Base  
**Supply**: 1,000,000,000 (1B) fixed, non-inflationary  
**Contract**: [`0x89122fBaEE012AD26D521c11AB5DF9595582E28c`](https://basescan.org/address/0x89122fBaEE012AD26D521c11AB5DF9595582E28c)  
**Vesting**: [`0x3560B663e5618E5842c9C7C1435c429da4DDeC4d`](https://basescan.org/address/0x3560B663e5618E5842c9C7C1435c429da4DDeC4d)  
**Status**: 🟢 **LIVE on Base Mainnet** — Deployed Feb 25, 2026  
**Whitepaper**: [Jubilee Protocol v3](https://github.com/Jubilee-Protocol/whitepaper)

---

## Tokenomics

### Supply Split: 750M + 250M

The 1B fixed supply is divided into two distinct pools:

| Pool | Amount | Status | Mechanism |
|------|--------|--------|-----------|
| **Treasury Pool** | 750,000,000 (75%) | Minted at deployment | Held in multisig for distribution |
| **Staking Rewards** | 250,000,000 (25%) | Unminted (reserved) | Minted over 5 years via JUBLEmissions |

**Why this split?** The 750M is minted immediately to the Safe multisig treasury because these tokens serve operational purposes — team vesting, ecosystem grants, liquidity, and investor allocations all need to be distributed from day one. The 250M staking rewards are **not minted at deployment** — they are programmatically minted over 5 years by the `JUBLEmissions` contract on a logarithmic decay schedule. This ensures:

1. **No inflation risk** — tokens can only be minted by `JUBLEmissions`, and only up to the 250M cap
2. **Early adopter reward** — Year 1 emits ~125M, Year 2 ~62.5M, halving each year
3. **Deployer safety** — the deployer's `MINTER_ROLE` is **renounced** at deployment. No one can mint arbitrarily.

### Token Allocation (from Whitepaper §5.2)

| Category | % | Tokens | Vesting | Rationale |
|----------|---|--------|---------|-----------|
| **Community & Ecosystem** | 40% | 400M | 4-5 years linear | Liquidity, yield farming, Hundredfold Grant Program |
| **Staking Rewards** | 25% | 250M | 5+ years logarithmic | Governance participation, LTV boost rewards |
| **Foundation & Core Team** | 20% | 200M | 1-year cliff, 3-year linear | Long-term team alignment via JUBLVesting |
| **Private Investors** | 10% | 100M | 1-year cliff, 2-year linear | Development, audits, legal |
| **Public Liquidity** | 5% | 50M | 100% unlocked at TGE | DEX liquidity on launch |

### Emission Schedule (JUBLEmissions)

The 250M staking reward pool is distributed on a **logarithmic halving schedule**:

```
Year 1:  ~125,000,000 JUBL  (50% of allocation)
Year 2:   ~62,500,000 JUBL  (25%)
Year 3:   ~31,250,000 JUBL  (12.5%)
Year 4:   ~15,625,000 JUBL  (6.25%)
Year 5:   ~15,625,000 JUBL  (remaining)
```

Rewards are distributed **per-second** to JUBL stakers via JUBLBoost. The `JUBLEmissions` contract calls `JUBL.mint()` on each claim, creating tokens only when earned. The `MINTER_ROLE` will be granted to `JUBLEmissions` when Jubilee Lending launches on mainnet.

---

## Revenue Model (from Whitepaper §5.1)

### Fee Structure

| Fee Type | Rate | Description |
|----------|------|-------------|
| Index Management Fee | 0.5-1.0% | Annual fee on AUM in vault products |
| Performance Fee | 10-20% | Fee on Rebalancing Engine arbitrage profits |
| Lending Origination Fee | 0.5% | One-time fee on new loans |
| Liquidation Fee | 2.0% | Portion of 5% liquidation penalty to treasury |

### Value Flow

```
Protocol Revenue
├── 10% → First Fruits Fund (charitable tithe)
└── 90% → Choice Yield (staker revenue share)
         └── Claimable in jBTCi, jETHs, or proportional mix
```

> **The First Fruits Tithe** — Before any revenue reaches token holders, 10% of all gross protocol revenue is automatically tithed to the First Fruits Fund, an on-chain treasury governed by the Jubilee Council supporting whitelisted charitable organizations and faith-based initiatives.

---

## Core Utilities (from Whitepaper §5.4)

| Utility | Description |
|---------|-------------|
| **Lending Credits** | Staking $JUBL increases LTV in Jubilee Lending (up to +20%) |
| **Governance Rights** | Required stake to join the Jubilee Council |
| **Revenue Share** | Pro-rata share of 90% of protocol revenue via Choice Yield |
| **Gas Abstraction** | $JUBL can be used to pay for gas on the application layer |

---

## Contracts

| Contract | Description |
|----------|-------------|
| **JUBL.sol** | ERC-20 with AccessControl, burnable, 1B hard cap |
| **JUBLVesting.sol** | Cliff + linear vesting for team/advisors |
| **JUBLEmissions.sol** | Logarithmic decay staking reward distribution |
| **JUBLBoost.sol** | Stake JUBL → boost LTV (7-day minimum lock) |
| **ChoiceYield.sol** | Revenue sharing for JUBL stakers |
| **FeeCollector.sol** | 90/10 split: ChoiceYield / First Fruits |
| **FirstFruitsFund.sol** | 10% tithe to whitelisted charities |

## Security

- **Internal audit**: 8 findings fixed (2 High, 3 Medium, 3 Low)
- **Red team audit**: 6 exploits found and fixed (2 Critical, 2 High, 2 Medium)
- **External audit**: Scheduled with Sherlock
- See [AUDIT_REPORT.md](docs/AUDIT_REPORT.md) for details

## Development

```bash
npm install
npx hardhat compile
npx hardhat test
```

## License

MIT

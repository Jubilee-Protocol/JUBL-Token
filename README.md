# 🏛️ JUBL Token

> The governance and utility token of the Jubilee Protocol.

**Token**: `$JUBL` — ERC-20 on Base  
**Supply**: 1,000,000,000 (1B) fixed  
**Contract**: [`0xEB70EFca1B973A06699B019677af0ed20B1Dd9F1`](https://sepolia.basescan.org/address/0xEB70EFca1B973A06699B019677af0ed20B1Dd9F1)  
**Status**: 🟢 **LIVE on Base Sepolia**

---

## Token Allocation

| Allocation | Percentage | Mechanism |
|------------|-----------|-----------|
| Staking Rewards | 25% | Via JUBLEmissions (logarithmic decay) |
| Community & Ecosystem | 20% | Treasury distribution |
| Team & Advisors | 15% | Via JUBLVesting (4-year cliff + linear) |
| Treasury | 15% | Protocol reserves |
| Liquidity | 10% | DEX pools |
| Early Supporters | 10% | Direct allocation |
| First Fruits Fund | 5% | Charitable giving |

## Contracts

| Contract | Description |
|----------|-------------|
| **JUBL.sol** | ERC-20 token with AccessControl, burnable, 1B cap |
| **JUBLVesting.sol** | Cliff + linear vesting for team/advisors |
| **JUBLEmissions.sol** | Staking reward distribution (halving schedule) |
| **JUBLBoost.sol** | Stake JUBL → boost LTV on Jubilee Lending |
| **ChoiceYield.sol** | Revenue sharing for JUBL stakers |
| **FeeCollector.sol** | 90/10 split: ChoiceYield / First Fruits |
| **FirstFruitsFund.sol** | 10% tithe to whitelisted charities |

## Security

- **Internal audit**: 8 findings fixed (2 High, 3 Medium, 3 Low)
- **Red team audit**: 6 exploits found and fixed (2 Critical, 2 High, 2 Medium)
- See [AUDIT_REPORT.md](docs/AUDIT_REPORT.md) for details

## Development

```bash
npm install
npx hardhat compile
npx hardhat test
```

## License

MIT

# libcompound

Call a cToken's `balanceOfUnderlying()` function without mutating state.

## Gas Benchmarks

### LibCompound

#### balanceOfUnderlying

| Test        | Gas    |
| ----------- | ------ |
| Direct Call | 76,474 |
| LibCompound | 51,102 |

#### exchangeRateCurrent

| Test        | Gas    |
| ----------- | ------ |
| Direct Call | 73,072 |
| LibCompound | 39,220 |

### LibFuse

#### balanceOfUnderlying

| Test        | Gas    |
| ----------- | ------ |
| Direct Call | 67,113 |
| LibCompound | 66,890 |

#### exchangeRateCurrent

| Test        | Gas    |
| ----------- | ------ |
| Direct Call | 63,904 |
| LibCompound | 63,119 |

## Getting Started

```sh
git clone https://github.com/transmissions11/libcompound.git
cd libcompound
make
```

# libcompound

Get up to date cToken data without mutating state.

## Gas Benchmarks

### LibCompound

Benchmarks taken from a recent run of the [test suite](src/test) on a mainnet fork.

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 76,474                  | 73,072                  |
| LibCompound | 51,102                  | 39,220                  |

### LibFuse

Benchmarks taken from a recent run of the [test suite](src/test) on a mainnet fork.

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 67,113                  | 63,904                  |
| LibFuse     | 66,890                  | 63,119                  |

## Getting Started

```sh
git clone https://github.com/transmissions11/libcompound.git
cd libcompound
make
```

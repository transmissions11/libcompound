# libcompound

Get up to date cToken data without mutating state.

## Gas Benchmarks

### LibCompound

Benchmarks taken from a recent run of the [test suite](src/test) on a mainnet fork.

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 70,638                  | 67,236                  |
| LibCompound | 51,163                  | 39,281                  |

### LibFuse

Benchmarks taken from a recent run of the [test suite](src/test) on a mainnet fork.

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 81,177                  | 77,968                  |
| LibFuse     | 66,954                  | 63,183                  |

## Getting Started

```sh
git clone https://github.com/transmissions11/libcompound.git
cd libcompound
make
```

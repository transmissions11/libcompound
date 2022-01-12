# libcompound

Get up to date cToken data using 20% less gas without mutating state.

## Gas Benchmarks

Benchmarks taken from a recent run of the [test suite](src/test) on a mainnet fork.

### LibCompound

| Method      | balanceOfUnderlying Gas | exchangeRateCurrent Gas |
| ----------- | ----------------------- | ----------------------- |
| Direct Call | 70,638                  | 67,236                  |
| LibCompound | 51,163                  | 39,281                  |

### LibFuse

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

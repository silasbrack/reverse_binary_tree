import gleam/float
import gleam/int
import gleam/io
import gleam/list
import gleam_community/maths/elementary

pub fn main() {
  let root = [4, 7, 2, 1, 3, 6, 9, 5, 4, 2, 1, 8, 7, 6, 9]
  let inverted = outer(root)
  io.debug(inverted)
}

pub fn outer(root: List(a)) -> List(a) {
  let indices = list.range(0, list.length(root) - 1)
  let assert Ok(zipped) = list.strict_zip(root, indices)
  let values =
    zipped
    |> list.chunk(fn(x) {
      let assert Ok(val) = elementary.logarithm_2(int.to_float(x.1 + 1))
      val |> float.floor |> float.round
    })
    |> list.map(fn(x) { x |> list.map(fn(y) { y.0 }) })
  values |> list.map(swap_block) |> list.concat
}

fn swap_block(l: List(val)) -> List(val) {
  case l {
    [] -> {
      panic
    }
    [first] -> {
      [first]
    }
    [first, second] -> {
      [second, first]
    }
    [_first, _second, ..] -> {
      let size = list.length(l)
      let mid = size / 2
      let #(first, second) = l |> list.split(mid)
      list.append(swap_block(second), swap_block(first))
    }
  }
}

import gleeunit
import gleeunit/should
import reverse_binary_tree

pub fn main() {
  gleeunit.main()
}

pub fn outer_test() {
  [4, 7, 2, 1, 3, 6, 9, 5, 4, 2, 1, 8, 7, 6, 9]
  |> reverse_binary_tree.outer
  |> should.equal([4, 2, 7, 9, 6, 3, 1, 9, 6, 7, 8, 1, 2, 4, 5])

  [4, 7, 2, 1, 3, 6, 9]
  |> reverse_binary_tree.outer
  |> should.equal([4, 2, 7, 9, 6, 3, 1])
}

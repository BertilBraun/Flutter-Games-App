class Piece {
  final List<List<bool>> occupations;

  const Piece._(this.occupations);

  static const List<Piece> pieces = [
    // Extras
    const Piece._(const [
      [true],
    ]),
    const Piece._(const [
      [false, true],
      [true, true],
    ]),
    const Piece._(const [
      [true, false],
      [true, true],
    ]),
    const Piece._(const [
      [true, true],
      [true, false],
    ]),
    const Piece._(const [
      [true, true],
      [false, true],
    ]),
    const Piece._(const [
      [true, true],
    ]),
    const Piece._(const [
      [true],
      [true],
    ]),
    // end Extras

    // Z shape
    const Piece._(const [
      [true, true, false],
      [false, true, true],
    ]),
    const Piece._(const [
      [false, true],
      [true, true],
      [true, false],
    ]),
    // end Z Shape

    // S shape
    const Piece._(const [
      [false, true, true],
      [true, true, false],
    ]),
    const Piece._(const [
      [true, false],
      [true, true],
      [false, true],
    ]),
    // end S Shape

    // L shape
    const Piece._(const [
      [true, true],
      [false, true],
      [false, true],
    ]),
    const Piece._(const [
      [true, false],
      [true, false],
      [true, true],
    ]),
    const Piece._(const [
      [true, true, true],
      [true, false, false],
    ]),
    const Piece._(const [
      [false, false, true],
      [true, true, true],
    ]),
    // end L Shape

    // J shape
    const Piece._(const [
      [true, true],
      [true, false],
      [true, false],
    ]),
    const Piece._(const [
      [false, true],
      [false, true],
      [true, true],
    ]),
    const Piece._(const [
      [true, false, false],
      [true, true, true],
    ]),
    const Piece._(const [
      [true, true, true],
      [false, false, true],
    ]),
    // end J Shape

    // I shape
    const Piece._(const [
      [true],
      [true],
      [true],
      [true],
    ]),
    const Piece._(const [
      [true, true, true, true],
    ]),
    // end I Shape

    // O shape
    const Piece._(const [
      [true, true],
      [true, true],
    ]),
    // end O Shape

    // T shape
    const Piece._(const [
      [true, false],
      [true, true],
      [true, false],
    ]),
    const Piece._(const [
      [false, true],
      [true, true],
      [false, true],
    ]),
    const Piece._(const [
      [false, true, false],
      [true, true, true],
    ]),
    const Piece._(const [
      [true, true, true],
      [false, true, false],
    ])
    // end T Shape
  ];
}

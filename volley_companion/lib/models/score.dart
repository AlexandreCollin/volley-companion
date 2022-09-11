class Score {
  int team1;
  int team2;

  void reset() {
    team1 = 0;
    team2 = 0;
  }

  Score clone() {
    return Score(team1: team1, team2: team2);
  }

  Score({
    this.team1 = 0,
    this.team2 = 0,
  });
}

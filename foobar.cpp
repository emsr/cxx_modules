
export module foobar;

class Thing
{
public:
  static int max;
  int ii;
  int jj;
};

// No public members..
class Hidden
{
  double x;
  int ll;
  int mm;
};

int lim;

struct foo
{
  double x;
  double square() const;
};

struct bar
{
  double y;
  double cube() const;
};

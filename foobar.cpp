
export module foobar;

export
class Thing
{
public:
  static int max;
  int ii;
  int jj;
};

// Not exported?
class Hidden
{
  double x;
  int ll;
  int mm;
};

int lim;

export
struct foo
{
  double x;
  double square() const;
};

export
struct bar
{
  double y;
  double cube() const;
};

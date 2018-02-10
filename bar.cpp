
module foobar;

struct _barhelper
{
  double _y;
};

double
bar::cube() const
{ return y * y * y; }

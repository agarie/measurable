#include <ruby.h>
#include <math.h>

#ifndef RUBY_19
#ifndef RARRAY_LEN
#define RARRAY_LEN(v) (RARRAY(v)->len)
#endif
#ifndef RARRAY_PTR
#define RARRAY_PTR(v) (RARRAY(v)->ptr)
#endif
#endif

/*
** def euclidean_distance(other)
**   sum = 0.0
**   self.each_index do |i|
**     sum += (self[i] - other[i])**2
**   end
**   Math.sqrt(sum)
** end
*/

static VALUE rb_euclidean(VALUE self, VALUE other_array) {
  double value = 0.0;

  /* TODO: check they're the same size. */
  long vector_length = (RARRAY_LEN(self) - 1);
  int index;

  for (index = 0; index <= vector_length; index++) {
    double x, y;

    x = NUM2DBL(RARRAY_PTR(self)[index]);
    y = NUM2DBL(RARRAY_PTR(other_array)[index]);

    value += pow(x - y, 2);
  }

  return rb_float_new(sqrt(value));
}

/* Prototypes */
long c_array_size(VALUE array);

/*
** def dot_product(other)
**   sum = 0.0
**   self.each_with_index do |n, index|
**     sum += n * other[index]
**   end
** 
**   sum
** end
*/

static VALUE rb_dot_product(VALUE self, VALUE other_array) {
  double sum = 0;

  /* TODO check they're the same size. */
  long array_size = c_array_size(self);
  int index;

  for(index = 0; index <= array_size; index++) {
    double x, y;

    x = NUM2DBL(RARRAY_PTR(self)[index]);
    y = NUM2DBL(RARRAY_PTR(other_array)[index]);

    sum += x * y;
  }

  return rb_float_new(sum);
}

/*
** def sum_of_squares
**   inject(0) {|sum, n| sum + n ** 2}
** end
*/
	
static VALUE rb_sum_of_squares(VALUE self) {
  double sum = 0;
  long array_size = c_array_size(self);
  int index;

  for(index = 0; index <= array_size; index++) {
    double x;

    x = NUM2DBL(RARRAY_PTR(self)[index]);

    sum += pow(x, 2);
  }

  return rb_float_new(sum);
}

/*
** def euclidean_normalize
**   sum = 0.0
**   self.each do |n|
**     sum += n ** 2
**   end
** 
**   Math.sqrt(sum)
** end
*/

static VALUE rb_euclidean_normalize(VALUE self) {
  double sum = 0;
  long array_size = c_array_size(self);
  int index;

  for(index = 0; index <= array_size; index++) {
    double x;

    x = NUM2DBL(RARRAY_PTR(self)[index]);

    sum += pow(x, 2);
  }

  return rb_float_new(sqrt(sum));
}

/*
** def binary_union_with(other)
**   unions = []
**   self.each_with_index do |n, index|
**     if n == 1 || other[index] == 1
**       unions << 1
**     else
**       unions << 0
**     end
**   end
** 
**   unions
** end
*/

static VALUE rb_binary_union_with(VALUE self, VALUE other_array) {
  //TODO: check arrays are same size
  long array_size = c_array_size(self);
  int index;
  VALUE results = rb_ary_new();

  for(index = 0; index <= array_size; index++) {
    int self_attribute = NUM2INT(RARRAY_PTR(self)[index]);
    int other_array_attribute = NUM2INT(RARRAY_PTR(other_array)[index]);

    if(self_attribute == 1 || other_array_attribute == 1) {
      rb_ary_push(results, rb_int_new(1));
    } else {
      rb_ary_push(results, rb_int_new(0));
    }
  }

  return results;
}

/*
** def binary_intersection_with(other)
**   intersects = []
**   self.each_with_index do |n, index|
**     if n == 1 && other[index] == 1
**       intersects << 1
**     else
**       intersects << 0
**     end
**   end
** 
**   intersects
** end
*/

static VALUE rb_binary_intersection_with(VALUE self, VALUE other_array) {
  /* TODO check arrays are same size */
  long array_size = c_array_size(self);
  int index;
  VALUE results = rb_ary_new();

  for(index = 0; index <= array_size; index++) {
    int self_attribute = NUM2INT(RARRAY_PTR(self)[index]);
    int other_array_attribute = NUM2INT(RARRAY_PTR(other_array)[index]);

    if(self_attribute == 1 && other_array_attribute == 1) {
      rb_ary_push(results, rb_int_new(1));
    } else {
      rb_ary_push(results, rb_int_new(0));
    }
  }

  return results;
}

/* return the size of a Ruby array - 1 */
long c_array_size(VALUE array) {
  return (RARRAY_LEN(array) - 1);
}

void
Init_measurable()
{
  VALUE rb_measurable = rb_define_module("Measurable");
	rb_define_method(rb_measurable, "euclidean", rb_euclidean, 1);
  rb_define_method(rb_measurable, "dot_product", rb_dot_product, 1);
  rb_define_method(rb_measurable, "sum_of_squares", rb_sum_of_squares, 0);
  rb_define_method(rb_measurable, "euclidean_normalize", rb_euclidean_normalize, 0);
  rb_define_method(rb_measurable, "binary_union_with", rb_binary_union_with, 1);
  rb_define_method(rb_measurable, "binary_intersection_with", rb_binary_intersection_with, 1);
}
context("Discrete color scale")

test_that("position must be set", {
  expect_error(scale_color_focus())
})

test_that("argument must be positive integer", {
  err_msg <- "palette position must be a positive integer"
  expect_error(scale_color_focus("one"), err_msg)
  expect_error(scale_color_focus(c("one", "two")), err_msg)
  expect_error(scale_color_focus(TRUE), err_msg)
  expect_error(scale_color_focus(list(1)), err_msg)
  expect_error(scale_color_focus(0), err_msg)
  expect_error(scale_color_focus(-1), err_msg)
})

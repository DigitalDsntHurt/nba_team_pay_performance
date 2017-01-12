require 'test_helper'

class OtherControllerTest < ActionDispatch::IntegrationTest
  test "should get bar" do
    get other_bar_url
    assert_response :success
  end

  test "should get line" do
    get other_line_url
    assert_response :success
  end

  test "should get scatter" do
    get other_scatter_url
    assert_response :success
  end

  test "should get arc" do
    get other_arc_url
    assert_response :success
  end

  test "should get tree" do
    get other_tree_url
    assert_response :success
  end

  test "should get cluster" do
    get other_cluster_url
    assert_response :success
  end

  test "should get pack" do
    get other_pack_url
    assert_response :success
  end

  test "should get bubble" do
    get other_bubble_url
    assert_response :success
  end

  test "should get histogram" do
    get other_histogram_url
    assert_response :success
  end

  test "should get treemap" do
    get other_treemap_url
    assert_response :success
  end

  test "should get map" do
    get other_map_url
    assert_response :success
  end

end

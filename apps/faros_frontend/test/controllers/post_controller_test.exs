defmodule FarosFrontend.PostControllerTest do
  use FarosFrontend.ConnCase


  test "GET /post shows landing page for posts", %{conn: conn} do
    conn = get conn, "/post"
    assert html_response(conn, 200) =~ "Add Post"
    assert html_response(conn, 200) =~ "All Posts"
  end

  test "POST /post redirects", %{conn: conn} do
    conn = post conn, "/post", url: "a-post-url", description: "a-description"
    assert conn.status == 302
  end

  test "GET /all_posts displays all posts", %{conn: conn} do
    conn = get conn, "/all_posts"
    assert html_response(conn, 200) =~ "Here are all the posts"
  end
end

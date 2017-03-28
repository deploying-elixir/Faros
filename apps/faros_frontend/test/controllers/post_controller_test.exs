defmodule FarosFrontend.PostControllerTest do
  use FarosFrontend.ConnCase

  test "GET /post shows landing page for posts", %{conn: conn} do
    conn = get conn, "/post"
    assert html_response(conn, 200) =~ "Add Post"
  end

  test "POST /post redirects", %{conn: conn} do
    conn = post conn, "/post", url: "a-post-url", description: "a-description"
    assert conn.status == 302
  end

  test "GET /post displays all posts", %{conn: conn} do
    post conn, "/post", url: "another-post-url", description: "another-description"
    conn = get conn, "/post"

    assert html_response(conn, 200) =~ "Link:</strong> another-post-url"
  end
end

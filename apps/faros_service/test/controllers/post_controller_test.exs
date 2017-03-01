defmodule FarosService.PostControllerTest do
  use FarosService.ConnCase

  test "GET /post", %{conn: conn} do
    conn = get conn, "/post"
    assert html_response(conn, 200) =~ "Add Post"
  end

  test "POST /post redirects", %{conn: conn} do
    conn = post conn, "/post", url: "a-post-url"
    assert conn.status == 302
  end
end

defmodule FarosService.SearchControllerTest do
  use FarosFrontend.ConnCase

  test "POST /search redirects to search home page", %{conn: conn} do
    conn = post conn, "/search", topic: "a-topic", amount: "amount"
    assert conn.status == 302
  end

  test "GET /search displays search results", %{conn: conn} do
   search_result = %Result{title: "a-topic", description: "a-description", link: "a-link", source: :guardian}
   MemoryDb.store("a-topic", [search_result])


   conn = get conn, "/search"

   assert html_response(conn, 200) =~ "a-topic"
  end
end

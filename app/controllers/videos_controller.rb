class VideosController < ApplicationController
  def index
    @videos = [
      {
        "標題": "Day1 - 你適合觀看本系列教學影片嗎？",
        "影片網址": "https://www.youtube.com/watch?v=45BYBlfkSEo",
        "縮圖網址": "https://img.youtube.com/vi/45BYBlfkSEo/0.jpg",
      },
      {
        "標題": "Day2 - 建立 LINE 官方帳號並完成基本設定",
        "影片網址": "https://www.youtube.com/watch?v=fz8T9Y4fqGY",
        "縮圖網址": "https://img.youtube.com/vi/fz8T9Y4fqGY/0.jpg",
      },
      {
        "標題": "Day3 - LINE 官方帳號聊天模式",
        "影片網址": "https://www.youtube.com/watch?v=tb_r8edPy-E",
        "縮圖網址": "https://img.youtube.com/vi/tb_r8edPy-E/0.jpg",
      },
      {
        "標題": "Day4 - LINE 官方帳號自動回應",
        "影片網址": "https://www.youtube.com/watch?v=7EGBX3QsmhA",
        "縮圖網址": "https://img.youtube.com/vi/7EGBX3QsmhA/0.jpg",
      },
      {
        "標題": "Day5 - LINE 官方帳號圖文選單",
        "影片網址": "https://www.youtube.com/watch?v=oc7yNStIeFs",
        "縮圖網址": "https://img.youtube.com/vi/oc7yNStIeFs/0.jpg",
      },
      {
        "標題": "Day6 - LINE 官方帳號聊天機器人模式",
        "影片網址": "https://www.youtube.com/watch?v=f-hHiu70ftE",
        "縮圖網址": "https://img.youtube.com/vi/f-hHiu70ftE/0.jpg",
      },
      {
        "標題": "Day7 - 使用 Heroku 建立一個網站",
        "影片網址": "https://www.youtube.com/watch?v=cxEVUHwXn18",
        "縮圖網址": "https://img.youtube.com/vi/cxEVUHwXn18/0.jpg",
      },
      {
        "標題": "Day8 - 布署 GitHub 程式與串接聊天機器人 LINE Messaging API",
        "影片網址": "https://www.youtube.com/watch?v=B_7npWSovR8",
        "縮圖網址": "https://img.youtube.com/vi/B_7npWSovR8/0.jpg",
      },
      {
        "標題": "Day9 - 串接 LINE Login 與 LIFF",
        "影片網址": "https://www.youtube.com/watch?v=EIzqCKirxU8",
        "縮圖網址": "https://img.youtube.com/vi/EIzqCKirxU8/0.jpg",
      },
      {
        "標題": "Day10 - 使用 GitHub 修改程式碼",
        "影片網址": "https://www.youtube.com/watch?v=MJdyqPiK5hg",
        "縮圖網址": "https://img.youtube.com/vi/MJdyqPiK5hg/0.jpg",
      },
      {
        "標題": "Day11 - 使用 Rails Routes 識別用戶輸入",
        "影片網址": "https://www.youtube.com/watch?v=2to23KXRr_4",
        "縮圖網址": "https://img.youtube.com/vi/2to23KXRr_4/0.jpg",
      },
      {
        "標題": "Day12 - 修改 Rails Routes 實作關鍵字回覆",
        "影片網址": "https://www.youtube.com/watch?v=xni-kOcZOUM",
        "縮圖網址": "https://img.youtube.com/vi/xni-kOcZOUM/0.jpg",
      },
      {
        "標題": "Day13 - 使用 Kamigo 取得事件資訊",
        "影片網址": "https://www.youtube.com/watch?v=shVjo00ADgg",
        "縮圖網址": "https://img.youtube.com/vi/shVjo00ADgg/0.jpg",
      },
      {
        "標題": "Day14 - 使用 Kamigo 進行權限控管",
        "影片網址": "https://www.youtube.com/watch?v=g_RvSZUXMNE",
        "縮圖網址": "https://img.youtube.com/vi/g_RvSZUXMNE/0.jpg",
      },
      {
        "標題": "Day15 - Ruby 字串處理入門",
        "影片網址": "https://www.youtube.com/watch?v=ETnG9Bdoq6w",
        "縮圖網址": "https://img.youtube.com/vi/ETnG9Bdoq6w/0.jpg",
      },
      {
        "標題": "Day16 - 用簡單的字串替換實作價值上億的機器人",
        "影片網址": "https://www.youtube.com/watch?v=z3c81rQuoao",
        "縮圖網址": "https://img.youtube.com/vi/z3c81rQuoao/0.jpg",
      },
      {
        "標題": "Day17 - Ruby 的陣列處理入門",
        "影片網址": "https://www.youtube.com/watch?v=a9cx1oRl0Mg",
        "縮圖網址": "https://img.youtube.com/vi/a9cx1oRl0Mg/0.jpg",
      },
      {
        "標題": "Day18 - 使用陣列實作隨機回覆",
        "影片網址": "https://www.youtube.com/watch?v=y34Jzly2i_8",
        "縮圖網址": "https://img.youtube.com/vi/y34Jzly2i_8/0.jpg",
      },
      {
        "標題": "Day19 - Ruby 雜湊處理入門",
        "影片網址": "https://www.youtube.com/watch?v=55iOBDf4aqw",
        "縮圖網址": "https://img.youtube.com/vi/55iOBDf4aqw/0.jpg",
      },
    ]

    @keyword = params[:keyword]

    if @keyword.present?
      @videos.filter! do |video|
        video[:標題].include? @keyword
      end
    end

    @videos = @videos.first(12)
  end
end
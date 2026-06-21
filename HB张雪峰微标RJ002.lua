local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/yuihghghg/RJ/refs/heads/main/ui.lua"))()

-- ==================== 自定义三角洲行动风格主题（精确覆盖所有文字） ====================
local techGreen = Color3.fromRGB(0, 255, 65) -- 科技绿
local black = Color3.fromRGB(0, 0, 0)
local lightGray = Color3.fromRGB(200, 200, 210)

-- 创建新主题，明确指定每个文字属性
WindUI:AddTheme({
  Name = "DeltaForce",
  -- 大标题（窗口标题、作者、标签页标题）
  WindowTopbarTitle = techGreen,
  WindowTopbarAuthor = techGreen,
  TabTitle = techGreen,
  -- 小标题（控件标题、按钮文字、弹窗标题）
  ElementTitle = black,
  ButtonText = black,
  PopupTitle = black,
  DialogTitle = black,
  -- 描述文字（black）
  ElementDesc = black,
  PopupContent = black,
  DialogContent = black,
  -- 占位符（科技绿，保持风格）
  PlaceholderText = techGreen,
  -- 图标（科技绿）
  Icon = techGreen,
  -- 其他（可选）
  TooltipText = black,
  TooltipSecondaryText = black,
})
WindUI:SetTheme("DeltaForce")

-- 获取服务
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 创建主窗口
local Window = WindUI:CreateWindow({
  Title = "HB微标",
  Author = "User",
  Folder = "MyHub",
  Transparent = true,
  Theme = "DeltaForce",
  SideBarWidth = 130,
  HideSearchBar = true,
  ScrollBarEnabled = true,
  Background = "https://i.postimg.cc/xTs1LQKy/1000029657.jpg",
  BackgroundImageTransparency = 0.3,
  User = { Enabled = false },
  ToggleKey = Enum.KeyCode.F,
})

-- 输出确认
print("✅ 窗口已创建，主题 DeltaForce 已应用")
print("窗口标题应为绿色，控件标题应为黑色")

local sjzIcon = "https://i.postimg.cc/fbMW23kR/1000038387.jpg"

-- 创建所有标签页
local Tabs = {
  zho = Window:Tab({ Title = "通用", Icon = sjzIcon }),
  Lemon = Window:Tab({ Title = "柠檬脚本", Icon = sjzIcon }),
  Lucky = Window:Tab({ Title = "踢幸运方块", Icon = sjzIcon }),
  MiniWar = Window:Tab({ Title = "迷你战争", Icon = sjzIcon }),
  doors = Window:Tab({ Title = "doors", Icon = sjzIcon }),
  dao = Window:Tab({ Title = "刀刃球", Icon = sjzIcon }),
  shen99 = Window:Tab({ Title = "森林中的99夜", Icon = sjzIcon }),
  mosha = Window:Tab({ Title = "谋杀悬疑2", Icon = "sjzIcon"})
}

-- ========== 新增3个标签页 ==========
Tabs.JiSuChuanQi = Window:Tab({ Title = "极速传奇", Icon = sjzIcon })
Tabs.QiCheYingXiao = Window:Tab({ Title = "汽车营销大亨", Icon = sjzIcon })
Tabs.ChengWeiQiGai = Window:Tab({ Title = "成为乞丐", Icon = sjzIcon })
Tabs.ZaiChaoShi = Window:Tab({ Title = "在超市生活一周", Icon = sjzIcon })
Tabs.YuanSuLiLiang = Window:Tab({ Title = "元素力量大亨", Icon = sjzIcon })
Tabs.JianZaoJiDi = Window:Tab({ Title = "建造你的基地", Icon = sjzIcon })
Tabs.ZhengZaiXunQiu = Window:Tab({ Title = "正在寻求", Icon = sjzIcon })
Tabs.ZhongZhiHuaYuan = Window:Tab({ Title = "种植花园", Icon = sjzIcon })
Tabs.ZiRanZaiHai = Window:Tab({ Title = "自然灾害", Icon = sjzIcon })
Tabs.ZuiQiangZhanChang = Window:Tab({ Title = "最强战场", Icon = sjzIcon })
Tabs.tp = Window:Tab({ Title = " 躲避", Icon = sjzIcon })

-- 工具函数
local function getCharacter()
  if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
    return LocalPlayer.Character
  end
  return nil
end

-- ==================== 无限跳（JumpRequest 事件） ====================
local isInfiniteJumpEnabled = false

UserInputService.JumpRequest:Connect(function()
  if isInfiniteJumpEnabled then
    local character = getCharacter()
    if character then
      local humanoid = character:FindFirstChildOfClass("Humanoid")
      if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
    end
  end
end)

-- ==================== 通用标签页 ====================
local zhoSection = Tabs.zho:Section({ Title = "通用" })
zhoSection:Paragraph({
  Title = "通用:",
  Desc = "",
  Image = "https://i.postimg.cc/d1sH5qJN/1781878127576.png",
  ImageSize = 20,
  ThumbnailSize = 120
})

-- 行走速度滑块
zhoSection:Slider({
  Title = "行走速度（默认16）",
  Desc = "调整角色的行走速度",
  Value = { Min = 1, Max = 400, Default = 16 },
  Step = 1,
  IsTextbox = true,
  Callback = function(value)
    local char = getCharacter()
    if char then char.Humanoid.WalkSpeed = value end
  end
})

-- 跳跃高度滑块
zhoSection:Slider({
  Title = "跳跃高度（默认50）",
  Desc = "调整角色的跳跃高度",
  Value = { Min = 0, Max = 400, Default = 50 },
  Step = 1,
  IsTextbox = true,
  Callback = function(value)
    local char = getCharacter()
    if char then char.Humanoid.JumpPower = value end
  end
})

-- 无限跳开关
zhoSection:Toggle({
  Title = "无限跳",
  Desc = "开启后可在空中连续跳跃",
  Value = false,
  Callback = function(state)
    isInfiniteJumpEnabled = state
  end
})

-- 原有通用按钮
zhoSection:Button({
  Title = "随机传送",
  Callback = function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
  end
})
zhoSection:Button({
  Title = "飞行fly",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rodan-demirali/RobloxUI/refs/heads/main/flyUIscript"))()
  end
})
zhoSection:Button({
  Title = "esp",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/wa0101/Roblox-ESP/refs/heads/main/esp.lua"))()
  end
})
zhoSection:Button({
  Title = "穿墙",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sandakovandrej23-art/ROBLOXNOCLIPGUI/refs/heads/main/Noclipgui.lua"))()
  end
})
zhoSection:Button({
  Title = "修改移速",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tiger-v1/RobloxSpeedJump.GUI/refs/heads/main/SpeedJumpGUI.lua"))()
  end
})

-- ==================== 柠檬脚本 ====================
local lemonSection = Tabs.Lemon:Section({ Title = "柠檬脚本" })
lemonSection:Paragraph({
  Title = "柠檬脚本:",
  Desc = "备注",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
lemonSection:Button({
  Title = "卖柠檬1",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"))()
  end
})
lemonSection:Button({
  Title = "卖柠檬2",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Sell-Lemons/refs/heads/main/Sell%20Lemons"))()
  end
})
lemonSection:Button({
  Title = "卖柠檬3",
  Callback = function()
    loadstring(game:HttpGet("https://rblxscripts.net/raw/axonic-hub-best-script-76ab7a48"))()
  end
})

-- ==================== 踢幸运方块 ====================
local luckySection = Tabs.Lucky:Section({ Title = "踢一个幸运的方块" })
luckySection:Paragraph({
  Title = "踢一个幸运的方块:",
  Desc = "",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
luckySection:Button({
  Title = "踢幸运方块1",
  Callback = function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/d130dee84ed1d9ccecfd6a91fc49665b.lua"))()
  end
})
luckySection:Button({
  Title = "踢幸运方块2",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/KickaLuckyBlock"))()
  end
})

-- ==================== 迷你战争 ====================
local miniSection = Tabs.MiniWar:Section({ Title = "迷你战争" })
miniSection:Paragraph({
  Title = "迷你战争:",
  Desc = "自动收集选定物品，按自定义市场价格条件出售，升级技能，根据优先级攻击敌人，并领取任务奖励。它还包括突袭追踪、可调节延迟、过滤销售、传送选项、商店工具、服务器功能、杂项工具以及可配置的设置标签页",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
miniSection:Button({
  Title = "迷你战争1",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LynX99-9/komtolmmek2script/refs/heads/main/CyraaHub.lua", true))()
  end
})

-- ==================== doors ====================
local doorsSection = Tabs.doors:Section({ Title = "doors" })
doorsSection:Paragraph({
  Title = "doors:",
  Desc = "功能较多",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
doorsSection:Button({
  Title = "doors1",
  Callback = function()
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/ef9b5a30ec84e201b585c3ef1850d264b216441eab77257f0e9184de826cc47e/download"))()
  end
})
doorsSection:Button({
  Title = "doors2",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ROSHANDVS2/ROSHAN-HUB-SCRIPTS/refs/heads/main/ROSHAN-DOORS-PAGUE-HUB.lua"))()
  end
})

-- ==================== 刀刃球 ====================
local daoSection = Tabs.dao:Section({ Title = "刀刃球" })
daoSection:Paragraph({
  Title = "刀刃球:",
  Desc = "备注",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
daoSection:Button({
  Title = "刀刃球1",
  Callback = function()
    loadstring(game:HttpGet('https://levi-hub-x.vercel.app/Loader.lua'))()
  end
})
daoSection:Button({
  Title = "刀刃球2",
  Callback = function()
    loadstring(game:HttpGet('https://levi-hub-x.vercel.app/Loader.lua'))()
  end
})

-- ==================== shen99 ====================
local shen99Section = Tabs.shen99:Section({ Title = "森林中的99夜" })
shen99Section:Paragraph({
  Title = "99:",
  Desc = "🌲 树光环重做，⚔️ 杀戮光环滑块变化，📦 Bring Items 重做，🧭 传送清理，🎥 免费摄像头修复，🏃 玩家模组修复，🛰️ ESP清理，🌲 树光环重做",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
shen99Section:Button({
  Title = "99-1",
  Callback = function()
    loadstring(game:HttpGet("https://rblxscripts.net/raw/99-nights-in-the-forest-foxname-bring-items-god-mode-auto-gr-f4e6400e"))()
  end
})
shen99Section:Button({
  Title = "99-2",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/loader.lua", true))()
  end
})
shen99Section:Button({
  Title = "99-3",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/99-Nights-in-the-Forest/refs/heads/main/99%20Nights%20in%20the%20Forest"))()
  end
})

---谋杀
local moshaSection = Tabs.mosha:Section({ Title = "谋杀悬疑2" })
moshaSection:Paragraph({
  Title = "谋杀悬疑2:",
  Desc = "",
  Image = "https://play-lh.googleusercontent.com/7cIIPlWm4m7AGqVpEsIfyL-HW4cQla4ucXnfalMft1TMIYQIlf2vqgmthlZgbNAQoaQ",
  ImageSize = 20,
  ThumbnailSize = 120
})
moshaSection:Button({
  Title = "谋杀悬疑1",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ultimatep568/Spark-Hub/refs/heads/main/SparkHub_Loader.lua"))()
  end
})
moshaSection:Button({
  Title = "谋杀悬疑2",
  Callback = function()
    loadstring(game:HttpGet('https://raw.smokingscripts.org/vertex.lua'))()
  end
})
moshaSection:Button({
  Title = "谋杀悬疑3",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ultimatep568/Spark-Hub/refs/heads/main/SparkHub_Loader.lua"))()
  end
})
moshaSection:Button({
  Title = "谋杀悬疑4",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/MurderMystery2/main.lua", true))()
  end
})

-- ============================================================
-- ==================== 新增：极速传奇标签页 ====================
-- ============================================================
local JS = {} -- 命名空间，防止变量冲突

local jsSection1 = Tabs.JiSuChuanQi:Section({ Title = "自动刷功能" })
local jsSection2 = Tabs.JiSuChuanQi:Section({ Title = "传送功能" })
local jsSection3 = Tabs.JiSuChuanQi:Section({ Title = "自动功能" })

-- 自动刷经验
JS.autoXP = false
jsSection1:Toggle({
  Title = "自动刷经验 150",
  Desc = "城市内使用",
  Value = false,
  Callback = function(state)
    JS.autoXP = state
    if state then
      task.spawn(function()
        while JS.autoXP do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 18 do
              orbEvent:FireServer("collectOrb", "Orange Orb", "City")
            end
          end
          task.wait(0.1)
        end
      end)
    end
  end
})

-- 城市刷速度
JS.cssdkq = false
jsSection1:Toggle({
  Title = "自动刷速度(城市)",
  Desc = "城市内使用",
  Value = false,
  Callback = function(state)
    JS.cssdkq = state
    if state then
      task.spawn(function()
        while JS.cssdkq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 18 do
              orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷速度(城市)" or "已关闭自动刷速度(城市)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- 白雪城市刷速度
JS.bxsdkq = false
jsSection1:Toggle({
  Title = "自动刷速度(白雪城市)",
  Desc = "白雪城市内使用",
  Value = false,
  Callback = function(state)
    JS.bxsdkq = state
    if state then
      task.spawn(function()
        while JS.bxsdkq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 18 do
              orbEvent:FireServer("collectOrb", "Red Orb", "Snow City")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB: ",
      Content = state and "已开启自动刷速度(白雪城市)" or "已关闭自动刷速度(白雪城市)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- 岩浆城市刷速度
JS.dysdkq = false
jsSection1:Toggle({
  Title = "自动刷速度(岩浆城市)",
  Desc = "岩浆城市内使用",
  Value = false,
  Callback = function(state)
    JS.dysdkq = state
    if state then
      task.spawn(function()
        while JS.dysdkq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 16 do
              orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷速度(岩浆城市)" or "已关闭自动刷速度(岩浆城市)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- 传奇公路刷速度
JS.cqsdkq = false
jsSection1:Toggle({
  Title = "自动刷速度(传奇公路)",
  Desc = "传奇公路内使用",
  Value = false,
  Callback = function(state)
    JS.cqsdkq = state
    if state then
      task.spawn(function()
        while JS.cqsdkq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 16 do
              orbEvent:FireServer("collectOrb", "Red Orb", "Legends Highway")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷速度(传奇公路)" or "已关闭自动刷速度(传奇公路)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

jsSection1:Divider()

-- 自动重生
JS.cskq = false
jsSection1:Toggle({
  Title = "自动重生",
  Desc = "可重生时将自动重生",
  Value = false,
  Callback = function(state)
    JS.cskq = state
    if state then
      task.spawn(function()
        while JS.cskq do
          local rebirthEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("rebirthEvent")
          if rebirthEvent then
            rebirthEvent:FireServer("rebirthRequest")
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动重生" or "已关闭自动重生",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

jsSection1:Divider()

-- 城市刷钻石
JS.cszskq = false
jsSection1:Toggle({
  Title = "自动刷钻石(城市)",
  Desc = "城市内使用",
  Value = false,
  Callback = function(state)
    JS.cszskq = state
    if state then
      task.spawn(function()
        while JS.cszskq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 20 do
              orbEvent:FireServer("collectOrb", "Gem", "City")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷钻石(城市)" or "已关闭自动刷钻石(城市)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- 白雪城市刷钻石
JS.bxzskq = false
jsSection1:Toggle({
  Title = "自动刷钻石(白雪城市)",
  Desc = "白雪城市内使用",
  Value = false,
  Callback = function(state)
    JS.bxzskq = state
    if state then
      task.spawn(function()
        while JS.bxzskq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 20 do
              orbEvent:FireServer("collectOrb", "Gem", "Snow City")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷钻石(白雪城市)" or "已关闭自动刷钻石(白雪城市)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- 岩浆城市刷钻石
JS.yjzskq = false
jsSection1:Toggle({
  Title = "自动刷钻石(岩浆城市)",
  Desc = "岩浆城市内使用",
  Value = false,
  Callback = function(state)
    JS.yjzskq = state
    if state then
      task.spawn(function()
        while JS.yjzskq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 20 do
              orbEvent:FireServer("collectOrb", "Gem", "Magma City")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷钻石(岩浆城市)" or "已关闭自动刷钻石(岩浆城市)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- 传奇公路刷钻石
JS.cqzskq = false
jsSection1:Toggle({
  Title = "自动刷钻石(传奇公路)",
  Desc = "传奇公路内使用",
  Value = false,
  Callback = function(state)
    JS.cqzskq = state
    if state then
      task.spawn(function()
        while JS.cqzskq do
          local orbEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("orbEvent")
          if orbEvent then
            for _ = 1, 20 do
              orbEvent:FireServer("collectOrb", "Gem", "Legends Highway")
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷钻石(传奇公路)" or "已关闭自动刷钻石(传奇公路)",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- ========== 传送功能 ==========
local qPoints = {
  CFrame.new(-278.8976135253906, 66.09315490722656, -10946.564453125),
  CFrame.new(3980.05029296875, 159.91925048828125, 5589.21533203125),
  CFrame.new(137.6853485107422, 75.40111541748047, -5972.4873046875),
  CFrame.new(-15376.439453125, 412.2984619140625, 4475.322265625),
  CFrame.new(-489.440673828125, 98.277099609375, 2502.03564453125),
  CFrame.new(-15167.5068359375, 382.1965026855469, 4888.2900390625),
  CFrame.new(2094.217041015625, 251.98931884765625, 12877.951171875),
  CFrame.new(-1645.1728515625, 69.02545928955078, 5337.923828125),
  CFrame.new(-13254.447265625, 222.44158935546875, 4891.56005859375),
  CFrame.new(-533.439208984375, 58.4377326965332, 209.794921875),
  CFrame.new(473.2319641113281, 66.08084106445312, -10867.8388671875),
  CFrame.new(2333.369873046875, 161.6602325439453, 13369.1240234375),
  CFrame.new(5392.5322265625, 297.8348388671875, 5885.2138671875),
  CFrame.new(3806.247802734375, 299.41748046875, 7225.6806640625),
  CFrame.new(1664.3343505859375, 80.900390625, 12589.7109375),
  CFrame.new(1769.7236328125, 80.90105438232422, 12879.7958984375),
  CFrame.new(-11097.05859375, 200.84193420410156, 4465.34375),
  CFrame.new(-13140.974609375, 200.84193420410156, 4465.39599609375),
  CFrame.new(-536.3781127929688, 58.43798065185547, -133.1399688720703),
  CFrame.new(2485.461181640625, 135.55299377441406, 12384.6455078125),
  CFrame.new(1173.287109375, 92.03070831298828, -6024.24365234375),
  CFrame.new(-85.52466583251953, 115.9759750366211, -107.73560333251953),
  CFrame.new(1805.7076416015625, 90.94168853759766, 4617.30712890625),
  CFrame.new(-350.6163330078125, 66.06715393066406, -8732.2490234375),
  CFrame.new(5666.32861328125, 326.5240478515625, 6494.826171875),
  CFrame.new(4516.66845703125, 221.20545959472656, 7181.7421875),
  CFrame.new(-1746.5504150390625, 150.5835418701172, 5372.54248046875),
  CFrame.new(5361.96826171875, 297.8207092285156, 7025.44482421875),
  CFrame.new(4650.1669921875, 221.213134765625, 5608.54345703125),
  CFrame.new(-12993.1826171875, 200.82785034179688, 5222.71337890625),
  CFrame.new(355.5094299316406, 111.75679779052734, -10924.6923828125),
  CFrame.new(1942.0057373046875, 93.18344116210938, -2047.2164306640625),
  CFrame.new(-15156.52734375, 355.08978271484375, 4141.91357421875),
  CFrame.new(2062.114990234375, 159.88404846191406, 4374.28076171875),
  CFrame.new(230.04505920410156, 94.17676544189453, 80.71623229980469),
}

JS.sqkq = false
jsSection2:Toggle({
  Title = "自动刷圈",
  Desc = "传奇公路内使用",
  Value = false,
  Callback = function(state)
    JS.sqkq = state
    if state then
      task.spawn(function()
        while JS.sqkq do
          for _, zdsq in ipairs(qPoints) do
            local char = getCharacter()
            if char and char:FindFirstChild("HumanoidRootPart") then
              char.HumanoidRootPart.CFrame = zdsq
            end
            task.wait(0.0001)
          end
          task.wait(0.0001)
        end
      end)
     else
      local char = getCharacter()
      if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.CFrame = CFrame.new(-568.6292114257812, 3.1723721027374268, 412.86492919921875)
      end
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷圈" or "已关闭自动刷圈",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

local function teleportTo(cframe)
  local char = getCharacter()
  if char and char:FindFirstChild("HumanoidRootPart") then
    char.HumanoidRootPart.CFrame = cframe
  end
  WindUI:Notify({
    Title = "HB：",
    Content = "传送成功",
    Icon = "bell",
    Duration = 3
  })
end

jsSection2:Button({
  Title = "传送至城市（出生点）",
  Callback = function()
    teleportTo(CFrame.new(-568.6292114257812, 3.1723721027374268, 412.86492919921875))
  end
})

jsSection2:Button({
  Title = "传送至神秘洞穴",
  Callback = function()
    teleportTo(CFrame.new(-9683.048828125, 58.352359771728516, 3136.626953125))
  end
})

jsSection2:Button({
  Title = "传送至白雪城市",
  Callback = function()
    teleportTo(CFrame.new(-866.3868408203125, 3.222372055053711, 2165.70654296875))
  end
})

jsSection2:Button({
  Title = "传送至地狱洞穴",
  Callback = function()
    teleportTo(CFrame.new(-11041.357421875, 58.352359771728516, 4111.8251953125))
  end
})

jsSection2:Button({
  Title = "传送至熔岩城市",
  Callback = function()
    teleportTo(CFrame.new(1616.8270263671875, 3.2723801136016846, 4330.65234375))
  end
})

jsSection2:Button({
  Title = "传送至水手路线",
  Callback = function()
    teleportTo(CFrame.new(-1618.4071044921875, 8.759234428405762, 4892.44091796875))
  end
})

jsSection2:Button({
  Title = "传送至电光洞穴",
  Callback = function()
    teleportTo(CFrame.new(-13107.9892578125, 58.352359771728516, 4099.099609375))
  end
})

jsSection2:Button({
  Title = "传送至传奇公路",
  Callback = function()
    teleportTo(CFrame.new(3673.601318359375, 70.75231170654297, 5588.7958984375))
  end
})

jsSection2:Button({
  Title = "传送至丛林洞穴",
  Callback = function()
    teleportTo(CFrame.new(-15266.7880859375, 239.7072296142578, 3769.77490234375))
  end
})

-- ========== 自动功能 ==========
JS.zdbskq = false
jsSection3:Toggle({
  Title = "自动比赛",
  Desc = "当有比赛时自动参加比赛",
  Value = false,
  Callback = function(state)
    JS.zdbskq = state
    if state then
      task.spawn(function()
        while JS.zdbskq do
          local raceEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("raceEvent")
          if raceEvent then
            raceEvent:FireServer("joinRace")
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动比赛" or "已关闭自动比赛",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

JS.zdsdkq = false
jsSection3:Toggle({
  Title = "自动刷速度V2",
  Desc = "可在任意地方使用（不稳定）",
  Value = false,
  Callback = function(state)
    JS.zdsdkq = state
    if state then
      task.spawn(function()
        while JS.zdsdkq do
          local questsEvent = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("questsEvent")
          if questsEvent then
            for _ = 1, 20 do
              questsEvent:FireServer("collectQuest", Instance.new("Folder", nil))
            end
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动刷速度V2" or "已关闭自动刷速度V2",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

JS.mcwkq = false
jsSection3:Toggle({
  Title = "自动买宠物",
  Desc = "快速获得宠物，消耗钻石",
  Value = false,
  Callback = function(state)
    JS.mcwkq = state
    if state then
      task.spawn(function()
        while JS.mcwkq do
          local openCrystalRemote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("openCrystalRemote")
          if openCrystalRemote then
            openCrystalRemote:InvokeServer("openCrystal", "Jungle Crystal")
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动买宠物" or "已关闭自动买宠物",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

JS.mwjkq = false
jsSection3:Toggle({
  Title = "自动买尾迹",
  Desc = "快速获得尾迹，消耗钻石",
  Value = false,
  Callback = function(state)
    JS.mwjkq = state
    if state then
      task.spawn(function()
        while JS.mwjkq do
          local openCrystalRemote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("openCrystalRemote")
          if openCrystalRemote then
            openCrystalRemote:InvokeServer("openCrystal", "Inferno Crystal")
          end
          task.wait(0.0001)
        end
      end)
    end
    WindUI:Notify({
      Title = "HB：",
      Content = state and "已开启自动买尾迹" or "已关闭自动买尾迹",
      Icon = state and "check" or "x",
      Duration = 2
    })
  end
})

-- ============================================================
-- ==================== 新增：汽车营销大亨标签页 ====================
-- ============================================================
local QC = {}

local qcSection1 = Tabs.QiCheYingXiao:Section({ Title = "自动功能" })
local qcSection2 = Tabs.QiCheYingXiao:Section({ Title = "比赛功能" })

-- 自动刷钱
QC.Auto = false
qcSection1:Toggle({
  Title = "自动刷钱",
  Desc = "创建平台并自动刷钱",
  Value = false,
  Callback = function(state)
    QC.Auto = state
    if state then
      task.spawn(function()
        -- 创建平台
        local part = Instance.new("Part")
        part.Position = Vector3.new(0, 60, 0)
        part.Size = Vector3.new(1000, 5, 1000)
        part.Anchored = true
        part.Name = "Keaths Platform"
        part.CollisionGroupId = 5
        part.Parent = Workspace

        local part2 = Instance.new("Part")
        part2.Position = Vector3.new(0, 10, 0)
        part2.Size = Vector3.new(1000, 5, 1000)
        part2.Anchored = true
        part2.Name = "Keaths Platform"
        part2.CollisionGroupId = 5
        part2.Parent = Workspace

        local part3 = Instance.new("Part")
        part3.Position = Vector3.new(0, 99, 0)
        part3.Size = Vector3.new(1000, 5, 1000)
        part3.Anchored = true
        part3.Name = "Keaths Platform"
        part3.CollisionGroupId = 5
        part3.Parent = Workspace

        while QC.Auto do
          task.wait(0.1)
          local chr = LocalPlayer.Character
          if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
            local car = chr.Humanoid.SeatPart.Parent.Parent
            pcall(function()
              car:PivotTo(CFrame.new(0, 0, 0))
              task.wait(0.81)
              car:PivotTo(part.CFrame)
              task.wait(1)
              car:PivotTo(part2.CFrame)
              task.wait(1)
              car:PivotTo(part3.CFrame)
            end)
          end
        end
      end)
    end
  end
})

-- 自动建造
QC.buyer = false
qcSection1:Toggle({
  Title = "自动建造",
  Desc = "自动购买建筑升级",
  Value = false,
  Callback = function(state)
    QC.buyer = state
    if state then
      task.spawn(function()
        while QC.buyer do
          task.wait()
          local function plot()
            for i, v in pairs(Workspace.Tycoons:GetDescendants()) do
              if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == LocalPlayer.Name then
                return v.Parent
              end
            end
            return nil
          end
          pcall(function()
            local tycoon = plot()
            if tycoon and tycoon:FindFirstChild("Dealership") and tycoon.Dealership:FindFirstChild("Purchases") then
              for i, v in pairs(tycoon.Dealership.Purchases:GetChildren()) do
                if QC.buyer and v:FindFirstChild("TycoonButton") and v.TycoonButton:FindFirstChild("Button") and v.TycoonButton.Button.Transparency == 0 then
                  ReplicatedStorage.Remotes.Build:FireServer("BuyItem", v.Name)
                  task.wait(0.3)
                end
              end
            end
          end)
        end
      end)
    end
  end
})

-- ========== 比赛功能 ==========
QC.season = false
qcSection2:Toggle({
  Title = "自动完成赛季11比赛",
  Desc = "自动完成赛季11比赛",
  Value = false,
  Callback = function(state)
    QC.season = state
    if state then
      task.spawn(function()
        while QC.season do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Season") and Workspace.Races.Season:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "20" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.oval = false
qcSection2:Toggle({
  Title = "自动完成圆形赛",
  Desc = "自动完成圆形赛",
  Value = false,
  Callback = function(state)
    QC.oval = state
    if state then
      task.spawn(function()
        while QC.oval do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Race") and Workspace.Races.Race:FindFirstChild("Oval") and Workspace.Races.Race.Oval:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "4" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.gokart = false
qcSection2:Toggle({
  Title = "自动完成卡丁车赛",
  Desc = "自动完成卡丁车赛",
  Value = false,
  Callback = function(state)
    QC.gokart = state
    if state then
      task.spawn(function()
        while QC.gokart do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Race") and Workspace.Races.Race:FindFirstChild("Gokart") and Workspace.Races.Race.Gokart:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "9" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.circuit = false
qcSection2:Toggle({
  Title = "自动完成转圈赛",
  Desc = "自动完成转圈赛",
  Value = false,
  Callback = function(state)
    QC.circuit = state
    if state then
      task.spawn(function()
        while QC.circuit do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Race") and Workspace.Races.Race:FindFirstChild("Circuit") and Workspace.Races.Race.Circuit:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "13" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.racetest3 = false
qcSection2:Toggle({
  Title = "自动完成漂移赛",
  Desc = "自动完成漂移赛",
  Value = false,
  Callback = function(state)
    QC.racetest3 = state
    if not state then
      local distance = math.huge
      local partvelo = nil
      for a, b in pairs(Workspace.DriftTrack:GetDescendants()) do
        if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
          local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
          if Dist < distance then
            distance = Dist
            partvelo = b
          end
        end
      end
      if partvelo then
        partvelo.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 0
      end
    end
    if state then
      task.spawn(function()
        local partvelo = nil
        while QC.racetest3 do
          task.wait()
          if LocalPlayer.PlayerGui:FindFirstChild("Menu") and LocalPlayer.PlayerGui.Menu:FindFirstChild("Race") and LocalPlayer.PlayerGui.Menu.Race.Visible == false then
            local chr = LocalPlayer.Character
            if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
              local car = chr.Humanoid.SeatPart.Parent.Parent
              pcall(function()
                car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
                car.Engine.Velocity = Vector3.new(0, 0, 0)
                chr.Head.Anchored = true
                car.Engine.Velocity = Vector3.new(0, 0, 0)
                task.wait(1)
                car.Engine.Velocity = Vector3.new(0, 0, 0)
                chr.Head.Anchored = false
                car.Engine.Velocity = Vector3.new(0, 0, 0)
                task.wait(1)
                local raceHandler = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("RaceHandler")
                if raceHandler and raceHandler:FindFirstChild("StartLobby") then
                  raceHandler.StartLobby:FireServer("Drift")
                end
                partvelo = nil
                repeat
                  task.wait()
                  if LocalPlayer:DistanceFromCharacter(Vector3.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125)) > 10 then
                    car:PivotTo(CFrame.new(-2502.25146484375, 601.9251708984375, 2013.3966064453125))
                    car.Engine.Velocity = Vector3.new(0, 0, 0)
                    task.wait(0.1)
                    if raceHandler and raceHandler:FindFirstChild("StartLobby") then
                      raceHandler.StartLobby:FireServer("Drift")
                    end
                  end
                until LocalPlayer.PlayerGui:FindFirstChild("Menu") and LocalPlayer.PlayerGui.Menu:FindFirstChild("Race") and LocalPlayer.PlayerGui.Menu.Race.Visible == true or QC.racetest3 == false
              end)
            end
           elseif LocalPlayer.PlayerGui:FindFirstChild("Menu") and LocalPlayer.PlayerGui.Menu:FindFirstChild("Race") and LocalPlayer.PlayerGui.Menu.Race.Visible == true then
            if partvelo == nil then
              local distance = math.huge
              for a, b in pairs(Workspace.DriftTrack:GetDescendants()) do
                if b.Name == "DriftAsphalt" and b.Parent.Name == "Model" then
                  local Dist = (Vector3.new(-2567.529296875, 601.9335327148438, 2018.6964111328125) - b.Position).magnitude
                  if Dist < distance then
                    distance = Dist
                    partvelo = b
                  end
                end
              end
              if partvelo then
                partvelo.Velocity = LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 1000
              end
            end
            if partvelo and LocalPlayer:DistanceFromCharacter(partvelo.Position) > 10 then
              local chr = LocalPlayer.Character
              if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                local car = chr.Humanoid.SeatPart.Parent.Parent
                pcall(function()
                  car:PivotTo(partvelo.CFrame)
                end)
              end
            end
            task.wait()
          end
        end
      end)
    end
  end
})

QC.police = false
qcSection2:Toggle({
  Title = "自动完成警察抓小偷赛",
  Desc = "自动完成警察抓小偷赛",
  Value = false,
  Callback = function(state)
    QC.police = state
    if state then
      task.spawn(function()
        while QC.police do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Police") and Workspace.Races.Police:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "18" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.city = false
qcSection2:Toggle({
  Title = "自动完成城市赛",
  Desc = "自动完成城市赛",
  Value = false,
  Callback = function(state)
    QC.city = state
    if state then
      task.spawn(function()
        while QC.city do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("City") and Workspace.Races.City:FindFirstChild("City") and Workspace.Races.City.City:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "17" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.highway = false
qcSection2:Toggle({
  Title = "自动完成公路赛",
  Desc = "自动完成公路赛",
  Value = false,
  Callback = function(state)
    QC.highway = state
    if state then
      task.spawn(function()
        while QC.highway do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("City") and Workspace.Races.City:FindFirstChild("Highway") and Workspace.Races.City.Highway:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "23" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.mountain = false
qcSection2:Toggle({
  Title = "自动完成山脉赛",
  Desc = "自动完成山脉赛",
  Value = false,
  Callback = function(state)
    QC.mountain = state
    if state then
      task.spawn(function()
        while QC.mountain do
          local checkpoints = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("Mountain") and Workspace.Races.Mountain:FindFirstChild("Checkpoints")
          if checkpoints then
            for i, v in pairs(checkpoints:GetDescendants()) do
              if v.Name == "IsActive" and v.Value == true then
                local chr = LocalPlayer.Character
                if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
                  local car = chr.Humanoid.SeatPart.Parent.Parent
                  pcall(function()
                    if v.Parent.Name ~= "26" then
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                     else
                      car:PivotTo(CFrame.new(v.Parent.Checkpoint.Position))
                      task.wait(0.2)
                      car:PivotTo(CFrame.new(v.Parent.Parent.Parent.GoalPart.Position))
                    end
                  end)
                end
                task.wait(0.2)
              end
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

QC.Sponge = false
qcSection2:Toggle({
  Title = "自动完成海绵赛",
  Desc = "自动完成海绵宝宝赛",
  Value = false,
  Callback = function(state)
    QC.Sponge = state
    if state then
      task.spawn(function()
        while QC.Sponge do
          local chr = LocalPlayer.Character
          if chr and chr:FindFirstChild("Humanoid") and chr.Humanoid.SeatPart then
            local car = chr.Humanoid.SeatPart.Parent.Parent
            local spongeRace = Workspace:FindFirstChild("Races") and Workspace.Races:FindFirstChild("SpongeBobRace")
            if spongeRace and spongeRace:FindFirstChild("Checkpoints") then
              pcall(function()
                car:PivotTo(spongeRace.Checkpoints["1"].Checkpoint.CFrame)
                task.wait(1)
                car:PivotTo(spongeRace.Checkpoints["2"].Checkpoint.CFrame)
                task.wait(0.1)
                car:PivotTo(spongeRace.Checkpoints["3"].Checkpoint.CFrame)
                task.wait(1)
                car:PivotTo(spongeRace.Checkpoints["4"].Checkpoint.CFrame)
                task.wait(0.1)
                car:PivotTo(spongeRace.Checkpoints["5"].Checkpoint.CFrame)
                task.wait(1)
                car:PivotTo(spongeRace.Checkpoints["6"].Checkpoint.CFrame)
                task.wait(0.1)
                car:PivotTo(spongeRace.Checkpoints["7"].Checkpoint.CFrame)
                task.wait(1)
                car:PivotTo(spongeRace.Checkpoints["8"].Checkpoint.CFrame)
                car:PivotTo(spongeRace.Checkpoints["9"].Checkpoint.CFrame)
                task.wait(1)
                car:PivotTo(spongeRace.Checkpoints["10"].Checkpoint.CFrame)
                task.wait(0.2)
              end)
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

-- ============================================================
-- ==================== 新增：成为乞丐标签页 ====================
-- ============================================================
local BG = {}

-- 语言翻译系统
BG.currentLanguage = "Chinese"
BG.languageChanged = false

local Translations = {
  ["功能"] = "Features",
  ["语言设置"] = "Language Settings",
  ["自动乞讨"] = "Auto Beg",
  ["自动购买员工"] = "Auto Buy Employees",
  ["自动升级"] = "Auto Upgrade",
  ["金钱光环"] = "Money Aura",
  ["当前语言"] = "Current Language",
  ["中文"] = "Chinese",
  ["英文"] = "English",
  ["应用语言"] = "Apply Language",
  ["语言更改"] = "Language Change",
  ["成功"] = "Success",
  ["语言"] = "Language",
  ["当前语言已经是"] = "Current language is already",
  ["请重启脚本以使更改生效"] = "Please restart the script for changes to take effect"
}

local function translateText(text)
  if not text or type(text) ~= "string" then return text end
  if BG.currentLanguage == "English" then
    return Translations[text] or text
   else
    for cn, en in pairs(Translations) do
      if text == en then
        return cn
      end
    end
    return text
  end
end

local function translateGUI(gui)
  if (gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox")) then
    pcall(function()
      local text = gui.Text
      if text and text ~= "" then
        local translatedText = translateText(text)
        if translatedText ~= text then
          gui.Text = translatedText
        end
      end
    end)
  end
end

local function scanAndTranslate()
  for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
    translateGUI(gui)
  end
  if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
    for _, gui in ipairs(LocalPlayer.PlayerGui:GetDescendants()) do
      translateGUI(gui)
    end
  end
end

local function setupDescendantListener(parent)
  parent.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
      task.wait(0.1)
      translateGUI(descendant)
    end
  end)
end

local function setupTranslationEngine()
  pcall(setupDescendantListener, game:GetService("CoreGui"))
  if LocalPlayer and LocalPlayer:FindFirstChild("PlayerGui") then
    pcall(setupDescendantListener, LocalPlayer.PlayerGui)
  end
  scanAndTranslate()
  while true do
    scanAndTranslate()
    task.wait(3)
  end
end

task.spawn(function()
  task.wait(2)
  setupTranslationEngine()
end)

-- 语言设置分区
local bgLangSection = Tabs.ChengWeiQiGai:Section({ Title = "语言设置" })
bgLangSection:Dropdown({
  Title = "当前语言",
  Values = {"中文", "English"},
  Value = "中文",
  Callback = function(option)
    if option == "English" then
      BG.currentLanguage = "English"
     else
      BG.currentLanguage = "Chinese"
    end
    BG.languageChanged = true
  end
})

bgLangSection:Button({
  Title = "应用语言",
  Callback = function()
    if BG.languageChanged then
      WindUI:Notify({
        Title = "语言更改",
        Content = "请重启脚本以使更改生效",
        Duration = 5,
        Icon = "info"
      })
      BG.languageChanged = false
     else
      WindUI:Notify({
        Title = "语言",
        Content = "当前语言已经是 " .. BG.currentLanguage,
        Duration = 3,
        Icon = "info"
      })
    end
  end
})

-- 功能分区
local bgFeatureSection = Tabs.ChengWeiQiGai:Section({ Title = "功能" })

BG.AutoFastMoney = false
bgFeatureSection:Toggle({
  Title = "自动乞讨",
  Desc = "自动乞讨获取金钱",
  Value = false,
  Callback = function(state)
    BG.AutoFastMoney = state
    if state then
      task.spawn(function()
        local bases = Workspace:FindFirstChild("Bases")
        local rs = ReplicatedStorage
        if not bases or not rs then return end
        local ev = rs:FindFirstChild("Remotes") and rs.Remotes:FindFirstChild("MinigameEvent")
        if not ev then return end

        local function findBase()
          for _, b in pairs(bases:GetChildren()) do
            local o = b:FindFirstChild("Owner")
            if o then
              local v = o.Value
              if v == LocalPlayer or tostring(v) == LocalPlayer.Name or tonumber(v) == LocalPlayer.UserId then
                return b
              end
            end
          end
          return nil
        end

        local b = findBase()
        if b then
          local beg = b:FindFirstChild("BegPrompt")
          if beg then
            local prompt = beg:FindFirstChild("ProximityPrompt")
            if prompt then
              local char = getCharacter()
              if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = beg.CFrame + Vector3.new(0, 3, 0)
                fireproximityprompt(prompt)
              end
              while BG.AutoFastMoney do
                RunService.RenderStepped:Wait()
                ev:FireServer(true)
              end
            end
          end
        end
      end)
    end
  end
})

BG.AutoBuyEmployees = false
bgFeatureSection:Toggle({
  Title = "自动购买员工",
  Desc = "自动购买所有员工",
  Value = false,
  Callback = function(state)
    BG.AutoBuyEmployees = state
    if state then
      task.spawn(function()
        local BuyEmployee = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("BuyEmployee")
        if not BuyEmployee then return end
        while BG.AutoBuyEmployees do
          for i = 1, 75 do
            if i ~= 13 and i ~= 14 then
              BuyEmployee:FireServer(i)
              task.wait(0.3)
            end
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

BG.AutoBuyUpgrades = false
bgFeatureSection:Toggle({
  Title = "自动升级",
  Desc = "自动升级所有项目",
  Value = false,
  Callback = function(state)
    BG.AutoBuyUpgrades = state
    if state then
      task.spawn(function()
        local Upgrade = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Upgrade")
        if not Upgrade then return end
        while BG.AutoBuyUpgrades do
          task.wait(0.1)
          Upgrade:FireServer("Beg Power")
          Upgrade:FireServer("Income")
          Upgrade:FireServer("Box Tier")
          Upgrade:FireServer("Alley Tier")
        end
      end)
    end
  end
})

BG.MoneyAura = false
bgFeatureSection:Toggle({
  Title = "金钱光环",
  Desc = "自动收集金钱",
  Value = false,
  Callback = function(state)
    BG.MoneyAura = state
    if state then
      task.spawn(function()
        local Money = Workspace:FindFirstChild("Money")
        if not Money then return end
        while BG.MoneyAura do
          local char = getCharacter()
          if char and char:FindFirstChild("HumanoidRootPart") then
            local HRP = char.HumanoidRootPart
            local OldCFrame = HRP.CFrame
            for _, v in pairs(Money:GetDescendants()) do
              if v:IsA("ProximityPrompt") and v.Parent and v.Parent:IsA("BasePart") then
                HRP.CFrame = v.Parent.CFrame + Vector3.new(0, 3, 0)
                fireproximityprompt(v, 0, true)
              end
            end
            HRP.CFrame = OldCFrame
          end
          task.wait(0.5)
        end
      end)
    end
  end
})

-- ============================================================
-- ==================== 4. 在超市生活一周 ====================
-- ============================================================
local CS = {}
local csSection = Tabs.ZaiChaoShi:Section({ Title = "自动收集功能" })

CS.collectFood = false
csSection:Toggle({
  Title = "自动收集食物",
  Value = false,
  Callback = function(state)
    CS.collectFood = state
    if state then
      task.spawn(function()
        while CS.collectFood do
          for _, v in next, Workspace.Map.Util.Items:GetChildren() do
            if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Food" then
              ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.collectFlashlight = false
csSection:Toggle({
  Title = "自动收集手电筒",
  Value = false,
  Callback = function(state)
    CS.collectFlashlight = state
    if state then
      task.spawn(function()
        while CS.collectFlashlight do
          for _, v in next, Workspace.Map.Util.Items:GetChildren() do
            if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Flashlight" then
              ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.collectMelee = false
csSection:Toggle({
  Title = "自动收集近战武器",
  Value = false,
  Callback = function(state)
    CS.collectMelee = state
    if state then
      task.spawn(function()
        while CS.collectMelee do
          for _, v in next, Workspace.Map.Util.Items:GetChildren() do
            if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Melee" then
              ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.collectGun = false
csSection:Toggle({
  Title = "自动收集枪",
  Value = false,
  Callback = function(state)
    CS.collectGun = state
    if state then
      task.spawn(function()
        while CS.collectGun do
          for _, v in next, Workspace.Map.Util.Items:GetChildren() do
            if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Gun" then
              ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.collectHealth = false
csSection:Toggle({
  Title = "自动收集药品",
  Value = false,
  Callback = function(state)
    CS.collectHealth = state
    if state then
      task.spawn(function()
        while CS.collectHealth do
          for _, v in next, Workspace.Map.Util.Items:GetChildren() do
            if v.ToolStats and v.ToolStats.ItemType and v.ToolStats.ItemType.Value == "Health" then
              ReplicatedStorage.Remotes.RequestPickupItem:FireServer(v)
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.autoReload = false
csSection:Toggle({
  Title = "自动装弹",
  Value = false,
  Callback = function(state)
    CS.autoReload = state
    if state then
      task.spawn(function()
        while CS.autoReload do
          ReplicatedStorage.Remotes.Weapon.GunReloaded:FireServer(nil, 1)
          task.wait()
        end
      end)
    end
  end
})

CS.autoShoot = false
csSection:Toggle({
  Title = "自动开枪",
  Value = false,
  Callback = function(state)
    CS.autoShoot = state
    if state then
      task.spawn(function()
        while CS.autoShoot do
          for _, v in next, LocalPlayer.Backpack:GetChildren() do
            if v:FindFirstChild("ToolStats") and v.ToolStats:FindFirstChild("Ammo") then
              for _, e in next, Workspace.Enemies:GetChildren() do
                if e and e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                  local BulletsPerShot = v.ToolStats.BulletsPerShot.Value
                  local DirectionTbl = {}
                  for i = 1, BulletsPerShot do
                    table.insert(DirectionTbl, Vector3.new(e.Head.Position.X, e.Head.Position.Y, e.Head.Position.Z).Unit)
                  end
                  local args = {
                    [1] = {
                      ["FiringPlayer"] = LocalPlayer,
                      ["FiredTime"] = os.time(),
                      ["FiringPlayerUserId"] = LocalPlayer.UserId,
                      ["Origin"] = Vector3.new(LocalPlayer.Character:GetPivot().Position),
                      ["UID"] = LocalPlayer.UserId .. "_1",
                      ["WeaponInstance"] = v,
                      ["ThisBulletProperties"] = {
                        ["BulletSpread"] = v.ToolStats.BulletSpread.Value,
                        ["BulletsPerShot"] = v.ToolStats.BulletsPerShot.Value,
                        ["BulletPenetration"] = v.ToolStats.BulletPenetration.Value,
                        ["BulletSpeed"] = v.ToolStats.BulletSpeed.Value,
                        ["FireSound"] = v.ToolStats.FireSound.Value,
                        ["BulletSize"] = v.ToolStats.BulletSize.Value
                      },
                      ["DirectionTbl"] = DirectionTbl
                    }
                  }
                  ReplicatedStorage.Remotes.Weapon.GunFired:FireServer(unpack(args))
                end
              end
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.superGun = false
csSection:Toggle({
  Title = "修改超级枪",
  Value = false,
  Callback = function(state)
    CS.superGun = state
    if state then
      task.spawn(function()
        while CS.superGun do
          for _, v in next, LocalPlayer.Backpack:GetChildren() do
            if v.ToolStats and v.ToolStats:FindFirstChild("Ammo") then
              v.ToolStats.ReloadTime.Value = 0
              v.ToolStats.FireDelay.Value = 0
              v.ToolStats.Ammo.Value = math.huge
              v.ToolStats.Damage.Value = math.huge
            end
          end
          task.wait()
        end
      end)
    end
  end
})

CS.infiniteStats = false
csSection:Toggle({
  Title = "无限体力和饥饿度",
  Value = false,
  Callback = function(state)
    CS.infiniteStats = state
    if state then
      task.spawn(function()
        while CS.infiniteStats do
          local char = getCharacter()
          if char and char:FindFirstChild("CharacterData") then
            char.CharacterData.MaxStamina.Value = math.huge
            char.CharacterData.MaxEnergy.Value = math.huge
            char.CharacterData.Energy.Value = char.CharacterData.MaxEnergy.Value
            char.CharacterData.Stamina.Value = char.CharacterData.MaxStamina.Value
          end
          task.wait()
        end
      end)
    end
  end
})

CS.nightHide = false
csSection:Toggle({
  Title = "夜晚自动躲避",
  Value = false,
  Callback = function(state)
    CS.nightHide = state
    if state then
      task.spawn(function()
        local oldpos = nil
        while CS.nightHide do
          if ReplicatedStorage.GameInfo.TimeOfDay.Value == "Night" then
            oldpos = LocalPlayer.Character:GetPivot().Position
            repeat
              task.wait()
              LocalPlayer.Character:PivotTo(CFrame.new(306.18927001953125, 36.67450714111328, -519.2435913085938))
              if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.Anchored = true
              end
            until ReplicatedStorage.GameInfo.TimeOfDay.Value ~= "Night"
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
              LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end
            if oldpos then
              LocalPlayer.Character:PivotTo(CFrame.new(oldpos))
            end
           else
            task.wait()
          end
        end
      end)
    end
  end
})

-- ============================================================
-- ==================== 5. 元素力量大亨 ====================
-- ============================================================
local YS = {}
local ysSection = Tabs.YuanSuLiLiang:Section({ Title = "自动功能" })

YS.autobuild = false
ysSection:Toggle({
  Title = "自动建造",
  Value = false,
  Callback = function(state)
    YS.autobuild = state
    if state then
      task.spawn(function()
        while YS.autobuild do
          for _, v in next, Workspace.Tycoons:GetChildren() do
            if v.Name == LocalPlayer.Name then
              for _, a in next, v.Buttons:GetChildren() do
                if a.Button and a.Button.Color == Color3.fromRGB(0, 127, 0) then
                  local char = getCharacter()
                  if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = a.Button.CFrame
                  end
                end
              end
            end
          end
          task.wait()
        end
      end)
    end
  end
})

YS.autocollect = false
ysSection:Toggle({
  Title = "自动收集钱",
  Value = false,
  Callback = function(state)
    YS.autocollect = state
    if state then
      task.spawn(function()
        while YS.autocollect do
          for _, v in next, Workspace.Tycoons:GetChildren() do
            if v.Name == LocalPlayer.Name then
              local char = getCharacter()
              if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = v.Auxiliary.Collector.Collect.CFrame
              end
            end
          end
          task.wait(5)
        end
      end)
    end
  end
})

YS.autocollectcrate = false
ysSection:Toggle({
  Title = "自动收集钱箱",
  Value = false,
  Callback = function(state)
    YS.autocollectcrate = state
    if state then
      task.spawn(function()
        while YS.autocollectcrate do
          for _, v in next, Workspace:GetChildren() do
            if v.Name == "BalloonCrate" and v:FindFirstChild("Crate") and v.Crate:FindFirstChild("ProximityPrompt") then
              local char = getCharacter()
              if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = v.Crate.CFrame
                fireproximityprompt(v.Crate.ProximityPrompt)
              end
            end
          end
          task.wait()
        end
      end)
    end
  end
})

YS.autocollectdollar = false
ysSection:Toggle({
  Title = "自动收集boss掉的钱",
  Value = false,
  Callback = function(state)
    YS.autocollectdollar = state
    if state then
      task.spawn(function()
        while YS.autocollectdollar do
          for _, v in next, Workspace:GetChildren() do
            if v.Name == "Dollar" then
              local char = getCharacter()
              if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = v.CFrame
              end
            end
          end
          task.wait()
        end
      end)
    end
  end
})

YS.autocollectchest = false
ysSection:Toggle({
  Title = "自动收集宝箱",
  Value = false,
  Callback = function(state)
    YS.autocollectchest = state
    if state then
      task.spawn(function()
        while YS.autocollectchest do
          for _, v in pairs(Workspace.Treasure.Chests:GetChildren()) do
            if v.Name == "Chest" and v:FindFirstChild("ProximityPrompt") then
              local char = getCharacter()
              if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = v.CFrame
                fireproximityprompt(v.ProximityPrompt)
              end
            end
          end
          task.wait()
        end
      end)
    end
  end
})

ysSection:Button({
  Title = "传送一次中心",
  Callback = function()
    local char = getCharacter()
    if char and char:FindFirstChild("HumanoidRootPart") then
      local oldpos = char.HumanoidRootPart.CFrame
      task.wait(0.5)
      char.HumanoidRootPart.CFrame = Workspace.Map.Center.CFrame
      task.wait(0.3)
      char.HumanoidRootPart.CFrame = oldpos
    end
  end
})

-- ============================================================
-- ==================== 6. 建造你的基地 ====================
-- ============================================================
local JD = {}
local jdSection = Tabs.JianZaoJiDi:Section({ Title = "战斗功能" })

JD.autoPunch = false
jdSection:Toggle({
  Title = "自动挥舞拳头",
  Value = false,
  Callback = function(state)
    JD.autoPunch = state
    if state then
      task.spawn(function()
        while JD.autoPunch do
          local args = {
            [1] = true,
            [2] = Vector3.new(0, 0, 0),
            [3] = 50,
            [4] = Enum.Material.Water,
            [5] = "RangeAttack"
          }
          ReplicatedStorage.Remotes.Events.ToolState:FireServer(unpack(args))
          task.wait()
        end
      end)
    end
  end
})

JD.rangeAttack = false
jdSection:Toggle({
  Title = "范围攻击",
  Value = false,
  Callback = function(state)
    JD.rangeAttack = state
    if state then
      task.spawn(function()
        while JD.rangeAttack do
          for _, enemy in next, Workspace.Characters:GetChildren() do
            if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
              if enemy ~= LocalPlayer.Character and enemy.Humanoid.Health > 0 then
                local char = getCharacter()
                if char and char:FindFirstChild("HumanoidRootPart") then
                  local distance = (char.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).Magnitude
                  if distance <= 999 then
                    local args = {
                      [1] = true,
                      [2] = enemy.HumanoidRootPart.Position,
                      [3] = 50,
                      [4] = Enum.Material.Water,
                      [5] = "RangeAttack"
                    }
                    pcall(function()
                      ReplicatedStorage.Remotes.Events.ToolState:FireServer(unpack(args))
                    end)
                  end
                end
              end
            end
          end
          task.wait()
        end
      end)
    end
  end
})

-- ============================================================
-- ==================== 7. 正在寻求 ====================
-- ============================================================
local ZQ = {}
local SCRIPT_URL = "https://raw.githubusercontent.com/YunLua/Lua/refs/heads/main/ATM.lua"
local AUTO_FOLDER = "HB脚本"
local AUTO_RELOAD_FILE = AUTO_FOLDER .. "/auto_reload.txt"
local STATE_FILE = AUTO_FOLDER .. "/atm_state.txt"

if not isfolder(AUTO_FOLDER) then
  makefolder(AUTO_FOLDER)
end

ZQ.ATTACK_REGISTER = true
ZQ.ATTACK_ATM = true
ZQ.RUN = false

if isfile(STATE_FILE) then
  ZQ.RUN = readfile(STATE_FILE) == "1"
end

local function saveState()
  writefile(STATE_FILE, ZQ.RUN and "1" or "0")
end

local zqSection = Tabs.ZhengZaiXunQiu:Section({ Title = "主要功能" })

zqSection:Toggle({
  Title = "打击目标收银机",
  Value = ZQ.ATTACK_REGISTER,
  Callback = function(state)
    ZQ.ATTACK_REGISTER = state
  end
})

zqSection:Toggle({
  Title = "打击目标ATM",
  Value = ZQ.ATTACK_ATM,
  Callback = function(state)
    ZQ.ATTACK_ATM = state
  end
})

zqSection:Toggle({
  Title = "自动打击",
  Desc = "自动寻找目标并打击，未找到自动换服后自动重载",
  Value = ZQ.RUN,
  Callback = function(state)
    ZQ.RUN = state
    saveState()
    if state then
      task.spawn(function()
        local VIM = game:GetService("VirtualInputManager")
        local TeleportService = game:GetService("TeleportService")
        local HttpService = game:GetService("HttpService")
        local GizmosFolder = Workspace.Local.Gizmos.White
        local NO_ATM_TIME = 0
        local SERVER_HOP_TIME = 25
        local RANDOM_POS = {
          Vector3.new(-1137, 78, -1953),
          Vector3.new(-44, 63, -2083),
          Vector3.new(194, 60, -2884),
          Vector3.new(-412, 106, -1301),
          Vector3.new(-377, 410, -741),
          Vector3.new(-985, 380, -1145),
          Vector3.new(-854, 406, -1505)
        }

        local function getPart(obj)
          if obj:IsA("BasePart") then return obj end
          for _, v in ipairs(obj:GetDescendants()) do
            if v:IsA("BasePart") then
              return v
            end
          end
        end

        local function isATM(obj)
          local t = obj:GetAttribute("gizmoType")
          if t == "ATM" and ZQ.ATTACK_ATM then
            return true
           elseif t == "Register" and ZQ.ATTACK_REGISTER then
            return true
          end
          return false
        end

        local function getNearestATM()
          local nearest, dist = nil, math.huge
          for _, gizmo in ipairs(GizmosFolder:GetChildren()) do
            if isATM(gizmo) then
              local part = getPart(gizmo)
              if part then
                local char = getCharacter()
                if char and char:FindFirstChild("HumanoidRootPart") then
                  local d = (char.HumanoidRootPart.Position - part.Position).Magnitude
                  if d < dist then
                    nearest, dist = part, d
                  end
                end
              end
            end
          end
          return nearest
        end

        local function teleportTo(target)
          local char = getCharacter()
          if char and char:FindFirstChild("HumanoidRootPart") then
            if typeof(target) == "Vector3" then
              char.HumanoidRootPart.CFrame = CFrame.new(target)
             elseif typeof(target) == "Instance" then
              char.HumanoidRootPart.CFrame = target.CFrame * CFrame.new(0, 5, 0)
            end
          end
        end

        local function pressE(time)
          local start = tick()
          while tick() - start < time do
            VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            task.wait(0.05)
          end
        end

        local function collectATM(atm)
          local start = tick()
          while tick() - start < 3 and atm.Parent and not atm:GetAttribute("Collected") do
            task.wait(0.1)
          end
          pressE(1.5)
        end

        local function serverHop()
          writefile(AUTO_RELOAD_FILE, "1")
          saveState()
          local placeId = game.PlaceId
          local ok, data = pcall(function()
            local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(placeId)
            return HttpService:JSONDecode(game:HttpGet(url)).data
          end)
          if not ok then return end
          local servers = {}
          for _, s in pairs(data) do
            if s.playing < s.maxPlayers and s.id ~= game.JobId then
              table.insert(servers, s.id)
            end
          end
          if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(placeId, servers[math.random(#servers)], LocalPlayer)
          end
        end

        while ZQ.RUN do
          local atm = getNearestATM()
          if atm then
            teleportTo(atm)
            task.wait(0.3)
            pressE(1.5)
            collectATM(atm)
            NO_ATM_TIME = 0
           else
            NO_ATM_TIME = NO_ATM_TIME + 0.7
            teleportTo(RANDOM_POS[math.random(#RANDOM_POS)])
            if NO_ATM_TIME >= SERVER_HOP_TIME then
              warn("25秒未找到目标，正在换服")
              task.wait(1)
              ZQ.RUN = false
              saveState()
              queue_on_teleport([[
                                loadstring(game:HttpGet("https://raw.githubusercontent.com/YunLua/Lua/refs/heads/main/ATM.lua"))()
                            ]])
              wait()
              serverHop()
              break
            end
          end
          task.wait(0.7)
        end
      end)
    end
  end
})

-- ============================================================
-- ==================== 8. 种植花园 ====================
-- ============================================================
local ZZ = {}
local zzSection = Tabs.ZhongZhiHuaYuan:Section({ Title = "功能" })

ZZ.MaxFruits = 10
zzSection:Slider({
  Title = "售卖要求最低背包数量",
  Desc = "背包数量超过此值才会售卖",
  Value = { Min = 0, Max = 100, Default = 10 },
  Step = 1,
  IsTextbox = true,
  Callback = function(value)
    ZZ.MaxFruits = value
  end
})

ZZ.AutoCollectAndSell = false
zzSection:Toggle({
  Title = "自动收集加售卖",
  Value = false,
  Callback = function(state)
    ZZ.AutoCollectAndSell = state
    if state then
      task.spawn(function()
        while ZZ.AutoCollectAndSell do
          pcall(function()
            local char = getCharacter()
            if char and char:FindFirstChild("HumanoidRootPart") then
              if #LocalPlayer.Backpack:GetChildren() > ZZ.MaxFruits then
                local oldpos = char.HumanoidRootPart.CFrame
                char.HumanoidRootPart.CFrame = Workspace.NPCS["Sell Stands"]["Shop Stand"].CFrame * CFrame.new(0, 0, 3)
                task.wait(0.5)
                ReplicatedStorage.GameEvents.Sell_Inventory:FireServer()
                task.wait(1)
                char.HumanoidRootPart.CFrame = oldpos
              end
              for _, plot in pairs(Workspace.Farm:GetChildren()) do
                local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
                if important and important:FindFirstChild("Data") and important.Data:FindFirstChild("Owner") then
                  if important.Data.Owner.Value == LocalPlayer.Name then
                    for _, prompt in ipairs(important.Plants_Physical:GetDescendants()) do
                      if prompt:IsA("ProximityPrompt") then
                        prompt.MaxActivationDistance = math.huge
                        fireproximityprompt(prompt)
                      end
                    end
                    break
                  end
                end
              end
            end
          end)
          task.wait(1)
        end
      end)
    end
  end
})

ZZ.AutoCollect = false
zzSection:Toggle({
  Title = "自动收集",
  Value = false,
  Callback = function(state)
    ZZ.AutoCollect = state
    if state then
      task.spawn(function()
        while ZZ.AutoCollect do
          pcall(function()
            local char = getCharacter()
            if char and char:FindFirstChild("HumanoidRootPart") then
              for _, plot in pairs(Workspace.Farm:GetChildren()) do
                local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
                if important and important:FindFirstChild("Data") and important.Data:FindFirstChild("Owner") then
                  if important.Data.Owner.Value == LocalPlayer.Name then
                    for _, prompt in ipairs(important.Plants_Physical:GetDescendants()) do
                      if prompt:IsA("ProximityPrompt") then
                        prompt.MaxActivationDistance = math.huge
                        fireproximityprompt(prompt)
                      end
                    end
                    break
                  end
                end
              end
            end
          end)
          task.wait(1)
        end
      end)
    end
  end
})

ZZ.AutoCollect2 = false
zzSection:Toggle({
  Title = "自动收集2.0",
  Value = false,
  Callback = function(state)
    ZZ.AutoCollect2 = state
    if state then
      task.spawn(function()
        while ZZ.AutoCollect2 do
          pcall(function()
            local char = getCharacter()
            if char and char:FindFirstChild("Humanoid") then
              for _, plot in pairs(Workspace.Farm:GetChildren()) do
                local important = plot:FindFirstChild("Important") or plot:FindFirstChild("Importanert")
                if important and important:FindFirstChild("Data") and important.Data:FindFirstChild("Owner") then
                  if important.Data.Owner.Value == LocalPlayer.Name then
                    for _, prompt in ipairs(important.Plants_Physical:GetDescendants()) do
                      if prompt:IsA("ProximityPrompt") then
                        char.Humanoid:MoveTo(prompt.Parent.Position)
                        prompt.MaxActivationDistance = math.huge
                        fireproximityprompt(prompt)
                      end
                    end
                    break
                  end
                end
              end
            end
          end)
          task.wait(1)
        end
      end)
    end
  end
})

ZZ.AutoSell = false
zzSection:Toggle({
  Title = "自动售卖",
  Value = false,
  Callback = function(state)
    ZZ.AutoSell = state
    if state then
      task.spawn(function()
        while ZZ.AutoSell do
          pcall(function()
            local char = getCharacter()
            if char and char:FindFirstChild("HumanoidRootPart") then
              if #LocalPlayer.Backpack:GetChildren() > ZZ.MaxFruits then
                local oldpos = char.HumanoidRootPart.CFrame
                char.HumanoidRootPart.CFrame = Workspace.NPCS["Sell Stands"]["Shop Stand"].CFrame * CFrame.new(0, 0, 3)
                task.wait(0.5)
                ReplicatedStorage.GameEvents.Sell_Item:FireServer()
                ReplicatedStorage.GameEvents.Sell_Inventory:FireServer()
                task.wait(1)
                char.HumanoidRootPart.CFrame = oldpos
              end
            end
          end)
          task.wait(1)
        end
      end)
    end
  end
})

ZZ.AutoPlant = false
zzSection:Toggle({
  Title = "自动种植",
  Value = false,
  Callback = function(state)
    ZZ.AutoPlant = state
    if state then
      task.spawn(function()
        while ZZ.AutoPlant do
          pcall(function()
            local char = getCharacter()
            if char and char:FindFirstChild("HumanoidRootPart") then
              local tool = nil
              local seedType = nil
              for _, item in ipairs(char:GetChildren()) do
                if item:IsA("Tool") and item.Name:find("Seed") then
                  seedType = item.Name:match("^(.-) Seed")
                  tool = item
                  break
                end
              end
              if not tool then
                for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
                  if item:IsA("Tool") and item.Name:find("Seed") then
                    seedType = item.Name:match("^(.-) Seed")
                    tool = item
                    break
                  end
                end
              end
              if tool and seedType then
                if tool.Parent == LocalPlayer.Backpack then
                  char.Humanoid:EquipTool(tool)
                  repeat task.wait() until tool.Parent == char
                end
                ReplicatedStorage.GameEvents.Plant_RE:FireServer(
                Vector3.new(math.floor(char.HumanoidRootPart.Position.X), 0.1, math.floor(char.HumanoidRootPart.Position.Z)),
                seedType
                )
              end
            end
          end)
          task.wait(1)
        end
      end)
    end
  end
})

ZZ.showSeedTimer = false
local seedTimerActive = false
zzSection:Toggle({
  Title = "显示种子刷新时间",
  Value = false,
  Callback = function(state)
    ZZ.showSeedTimer = state
    if state then
      if not seedTimerActive then
        seedTimerActive = true
        local TimeGui = Instance.new("ScreenGui")
        TimeGui.Name = "TimeGui"
        TimeGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        TimeGui.Parent = game:GetService("CoreGui")

        local TimeLabel = Instance.new("TextLabel")
        TimeLabel.Name = "TimeLabel"
        TimeLabel.BackgroundTransparency = 1
        TimeLabel.BorderColor3 = Color3.new(0, 0, 0)
        TimeLabel.Position = UDim2.new(0.80, 0, 0.00090, 0)
        TimeLabel.Size = UDim2.new(0, 135, 0, 50)
        TimeLabel.Font = Enum.Font.GothamSemibold
        TimeLabel.Text = "种子下次更新时间: "
        TimeLabel.TextColor3 = Color3.new(1, 1, 1)
        TimeLabel.TextScaled = true
        TimeLabel.TextSize = 14
        TimeLabel.TextWrapped = true
        TimeLabel.Parent = TimeGui

        local UIGradient = Instance.new("UIGradient")
        UIGradient.Color = ColorSequence.new{
          ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
          ColorSequenceKeypoint.new(0.10, Color3.fromRGB(255, 127, 0)),
          ColorSequenceKeypoint.new(0.20, Color3.fromRGB(255, 255, 0)),
          ColorSequenceKeypoint.new(0.30, Color3.fromRGB(0, 255, 0)),
          ColorSequenceKeypoint.new(0.40, Color3.fromRGB(0, 255, 255)),
          ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 0, 255)),
          ColorSequenceKeypoint.new(0.60, Color3.fromRGB(139, 0, 255)),
          ColorSequenceKeypoint.new(0.70, Color3.fromRGB(255, 0, 0)),
          ColorSequenceKeypoint.new(0.80, Color3.fromRGB(255, 127, 0)),
          ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 255, 0)),
          ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 0))
        }
        UIGradient.Rotation = 360
        UIGradient.Parent = TimeLabel

        local TweenService = game:GetService("TweenService")
        local tweeninfo = TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1)
        local tween = TweenService:Create(UIGradient, tweeninfo, {Rotation = 360})
        tween:Play()

        task.spawn(function()
          while ZZ.showSeedTimer do
            task.wait()
            pcall(function()
              if LocalPlayer.PlayerGui and LocalPlayer.PlayerGui.Seed_Shop and LocalPlayer.PlayerGui.Seed_Shop.Frame and LocalPlayer.PlayerGui.Seed_Shop.Frame.Frame and LocalPlayer.PlayerGui.Seed_Shop.Frame.Frame.Timer then
                TimeLabel.Text = "时间: " .. LocalPlayer.PlayerGui.Seed_Shop.Frame.Frame.Timer.Text
              end
            end)
          end
          TimeGui:Destroy()
          seedTimerActive = false
        end)
      end
     else
      seedTimerActive = false
    end
  end
})

ZZ.selectedSeed = "Carrot"
zzSection:Dropdown({
  Title = "选择种子",
  Values = {"Carrot", "Strawberry", "Blueberry", "Orange Tulip", "Tomato", "Corn", "Daffodil", "Watermelon", "Pumpkin", "Apple", "Bamboo", "Coconut", "Cactus", "Dragon Fruit", "Mango", "Grape"},
  Value = "Carrot",
  Callback = function(value)
    ZZ.selectedSeed = value
  end
})

ZZ.AutoBuySeeds = false
zzSection:Toggle({
  Title = "自动购买种子",
  Value = false,
  Callback = function(state)
    ZZ.AutoBuySeeds = state
    if state then
      task.spawn(function()
        while ZZ.AutoBuySeeds do
          pcall(function()
            ReplicatedStorage.GameEvents.BuySeedStock:FireServer(ZZ.selectedSeed)
          end)
          task.wait(0.2)
        end
      end)
    end
  end
})

zzSection:Button({
  Title = "购买种子",
  Callback = function()
    ReplicatedStorage.GameEvents.BuySeedStock:FireServer(ZZ.selectedSeed)
  end
})

ZZ.AutoBuyWateringCan = false
zzSection:Toggle({
  Title = "自动购买水壶",
  Value = false,
  Callback = function(state)
    ZZ.AutoBuyWateringCan = state
    if state then
      task.spawn(function()
        while ZZ.AutoBuyWateringCan do
          pcall(function()
            ReplicatedStorage.GameEvents.BuyGearStock:FireServer("Watering Can")
          end)
          task.wait(1)
        end
      end)
    end
  end
})

-- ============================================================
-- ==================== 9. 自然灾害 ====================
-- ============================================================
local ZR = {}
local zrSection = Tabs.ZiRanZaiHai:Section({ Title = "功能" })

zrSection:Button({
  Title = "指南针",
  Desc = "要使用的话就必须买指南针",
  Callback = function()
    local p = LocalPlayer
    local r = ReplicatedStorage.Remotes.Compass
    local c = p.Backpack:FindFirstChild("Compass")
    local h = p.Character:FindFirstChild("Humanoid")
    if c and h then
      h:EquipTool(c)
      task.wait()
      r:FireServer("Vote Map", 3)
      r:FireServer("Vote Map", 4)
      task.wait()
      h:UnequipTools()
      WindUI:Notify({
        Title = "通知",
        Content = "加载成功",
        Duration = 1,
        Icon = "check",
      })
    end
  end
})

zrSection:Button({
  Title = "黑洞",
  Desc = "点击加载",
  Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Super-ring-Parts-V6-28581"))()
    WindUI:Notify({
      Title = "通知",
      Content = "加载成功",
      Duration = 3,
      Icon = "check",
    })
  end
})

zrSection:Button({
  Title = "物理磁铁",
  Desc = "可以把下面的东西吸上来可以踩",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/6669178/main/%E5%8D%95%E4%B8%80%E7%89%A9%E4%BD%93%E9%A3%9E%E8%A1%8C%E8%BD%BD%E8%87%AA%E5%B7%B1%E6%9C%80%E7%BB%88%E4%BC%98%E5%8C%96%E7%89%88"))()
    WindUI:Notify({
      Title = "通知",
      Content = "加载成功",
      Duration = 1,
      Icon = "check",
    })
  end
})

zrSection:Button({
  Title = "无敌少侠",
  Desc = "用了它，你就会变成城市超人",
  Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invinicible-Flight-R15-45414"))()
    WindUI:Notify({
      Title = "通知",
      Content = "加载成功",
      Duration = 1,
      Icon = "check",
    })
  end
})

zrSection:Button({
  Title = "防止摔跤伤害",
  Desc = "就算掉下去了，也毫发无伤，掉到水里面也会死的",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cytj777i/Fall-injury/main/%E9%98%B2%E6%AD%A2%E6%91%94%E8%90%BD%E4%BC%A4%E5%AE%B3"))()
    WindUI:Notify({
      Title = "通知",
      Content = "加载成功",
      Duration = 1,
      Icon = "check",
    })
  end
})

-- ============================================================
-- ==================== 10. 最强战场 ====================
-- ============================================================
local ZC = {}
local zcSection = Tabs.ZuiQiangZhanChang:Section({ Title = "战斗功能" })

zcSection:Button({
  Title = "执行连招(Flowing Water + Lethal Whirlwind Stream)",
  Desc = "点击后执行一套连招",
  Callback = function()
    local player = LocalPlayer
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local TweenService = game:GetService("TweenService")

    -- Flowing Water
    local args1 = {
      [1] = {
        ["Tool"] = player.Backpack:FindFirstChild("Flowing Water"),
        ["Goal"] = "Console Move"
      }
    }
    char.Communicate:FireServer(unpack(args1))

    task.wait(2.15)

    local forward = hrp.CFrame.LookVector.Unit
    local distance = 20
    local duration = 0.1
    local goalPos = hrp.Position + forward * distance
    local tween = TweenService:Create(hrp, TweenInfo.new(duration), {
      CFrame = CFrame.new(goalPos, goalPos + forward)
    })
    tween:Play()
    tween.Completed:Wait()

    hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(180), 0)

    -- Lethal Whirlwind Stream
    local args2 = {
      [1] = {
        ["Tool"] = player.Backpack:FindFirstChild("Lethal Whirlwind Stream"),
        ["Goal"] = "Console Move"
      }
    }
    char.Communicate:FireServer(unpack(args2))

    WindUI:Notify({
      Title = "通知",
      Content = "连招执行成功",
      Duration = 2,
      Icon = "check",
    })
  end
})

-------tp------
local tp = {}
local tp = Tabs.tp:Section({ Title = "躲避" })

tp:Toggle({
  Title = "自动获胜",
  Default = false,
  Callback = function(state)
    ActiveAutoWin = state
    if ActiveAutoWin then
      WindUI:Notify({
        Title = "提示提示",
        Content = "自动获胜已开启",
        Duration = 4
      })

      spawn(function()
        while ActiveAutoWin do
          local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
          local rootPart = character:FindFirstChild("HumanoidRootPart")

          if character and rootPart then
            if character:GetAttribute("Downed") then
              ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true)
              task.wait(0.5)
            end

            if not character:GetAttribute("Downed") then
              local securityPart = Instance.new("Part")
              securityPart.Name = "SecurityPartTemp"
              securityPart.Size = Vector3.new(10, 1, 10)
              securityPart.Position = Vector3.new(0, 500, 0)
              securityPart.Anchored = true
              securityPart.Transparency = 1
              securityPart.CanCollide = true
              securityPart.Parent = Workspace

              rootPart.CFrame = securityPart.CFrame + Vector3.new(0, 3, 0)
              task.wait(0.5)
              securityPart:Destroy()
            end
          end
          task.wait(0.1)
        end
      end)
     else
      WindUI:Notify({
        Title = "提示提示",
        Content = "自动获胜已关闭",
        Duration = 4
      })
    end
  end
})
tp:Toggle({
  Title = "自动刷钱",
  Default = false,
  Callback = function(state)
    ActiveAutoFarmMoney = state
    if ActiveAutoFarmMoney then
      WindUI:Notify({
        Title = "提示提示",
        Content = "自动刷钱已开启",
        Duration = 4
      })

      spawn(function()
        while ActiveAutoFarmMoney do
          local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
          local rootPart = character and character:FindFirstChild("HumanoidRootPart")

          if character and rootPart then
            if character:GetAttribute("Downed") then
              ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true)
              task.wait(0.5)
            end

            local downedPlayerFound = false
            local playersInGame = Workspace:FindFirstChild("Game") and Workspace.Game:FindFirstChild("Players")
            if playersInGame then
              for _, v in pairs(playersInGame:GetChildren()) do
                if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v:GetAttribute("Downed") then
                  rootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                  ReplicatedStorage.Events.Character.Interact:FireServer("Revive", true, v)
                  task.wait(0.5)
                  downedPlayerFound = true
                  break
                end
              end
            end

            if not downedPlayerFound then

            end

            local securityPart = Instance.new("Part")
            securityPart.Name = "SecurityPartTemp"
            securityPart.Size = Vector3.new(10, 1, 10)
            securityPart.Position = Vector3.new(0, 500, 0)
            securityPart.Anchored = true
            securityPart.Transparency = 1
            securityPart.CanCollide = true
            securityPart.Parent = Workspace
            rootPart.CFrame = securityPart.CFrame + Vector3.new(0, 3, 0)

           else

          end
          task.wait(1)
        end
      end)
     else
      WindUI:Notify({
        Title = "提示提示",
        Content = "自动刷钱已关闭",
        Duration = 4
      })
    end
  end
})

-- ============================================================
-- ========== 统一替换所有标签页图标 ==========
-- ============================================================
task.spawn(function()
  task.wait(0.3)
  local mainFrame = Window.UIElements and Window.UIElements.Main
  if not mainFrame then
    mainFrame = game.CoreGui:FindFirstChild("WindUI") and game.CoreGui.WindUI:FindFirstChild("Window")
    if mainFrame then
      mainFrame = mainFrame:FindFirstChild("Main")
    end
  end
  if mainFrame then
    local side = mainFrame:FindFirstChild("Side")
    if side then
      local tabBtns = side:FindFirstChild("TabBtns")
      if tabBtns then
        for _, child in ipairs(tabBtns:GetChildren()) do
          if child:IsA("ImageLabel") and child:FindFirstChild("TabText") then
            child.Image = sjzIcon
            child.ImageRectSize = nil
            child.ImageRectOffset = nil
            child.ScaleType = Enum.ScaleType.Fit
            child.Size = UDim2.new(0, 24, 0, 24)
          end
        end
        print("✅ 所有标签页图标已替换为自定义图片")
      end
    end
  end
end)
Window:SelectTab(1)
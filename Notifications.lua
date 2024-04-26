--// Services

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")

--// Library Init

local NotificationLibrary = {}

--// Instances

local Overlay = Instance.new("ScreenGui", game.CoreGui) Overlay.Name = HttpService:GenerateGUID()
local NotificationList = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")

function NotificationLibrary:Notify(String, Time, TweenTime)
	
	--// Create Notification
	
	local Notification = Instance.new("TextLabel", NotificationList)
	
	Notification.BackgroundColor3 = Color3.new(1, 1, 1)
	Notification.BackgroundTransparency = 1
	Notification.TextTransparency = 1
	Notification.BorderColor3 = Color3.new(0, 0, 0)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(0.379972607, 0, 0.966648877, 0)
	Notification.Size = UDim2.new(0.922496259, 0, 0.0333511084, 0)
	Notification.Font = Enum.Font.RobotoMono
	Notification.TextColor3 = Color3.new(1, 1, 1)
	Notification.TextStrokeTransparency = 0.5
	Notification.TextSize = 14
	Notification.TextWrapped = true
	
	local Entrace = TweenService:Create( Notification, TweenInfo.new(tonumber(TweenTime)), { TextTransparency = 0 } )
	local Exit = TweenService:Create( Notification, TweenInfo.new(tonumber(TweenTime)), { TextTransparency = 1 } )
	
	Entrace:Play()
	
	Notification.Text = tostring(String)
	
	repeat
		task.wait()
	until Entrace.Completed
	
	task.wait(Time)
	
	Exit:Play()
	
	repeat
		task.wait()
	until Exit.Completed
	
	Notification:Destroy()

end

NotificationList.Name = "NotificationList"
NotificationList.Parent = Overlay
NotificationList.BackgroundColor3 = Color3.new(1, 1, 1)
NotificationList.BackgroundTransparency = 1
NotificationList.BorderColor3 = Color3.new(0, 0, 0)
NotificationList.BorderSizePixel = 0
NotificationList.Position = UDim2.new(0.397615701, 0, 0.0311720707, 0)
NotificationList.Size = UDim2.new(0.204488143, 0, 0.873067319, 0)

UIListLayout.Parent = NotificationList
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom

UIPadding.Parent = NotificationList
UIPadding.PaddingBottom = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 10)

return NotificationLibrary -- // :DD

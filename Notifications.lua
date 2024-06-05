--// Services

local TweenService = game:GetService("TweenService")

--// Instances

local Notifications = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local List = Instance.new("Frame", Notifications)
local UIListLayout = Instance.new("UIListLayout", List)
local UIPadding = Instance.new("UIPadding", List)

--// Tables

local Library = {}

--// Rest

do --// Logic
	
	do --// UI
		
		do --// Properties
			
			do --// List
				
				List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				List.BackgroundTransparency = 1.000
				List.BorderColor3 = Color3.fromRGB(0, 0, 0)
				List.BorderSizePixel = 0
				List.Position = UDim2.new(0.421, 0,-0, 0)
				List.Size = UDim2.new(0.157169074, 0, 1.00000012, 0)
				
			end

			do --// UIListLayout
				
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 5)
				
			end

			do --// Padding
				
				UIPadding.PaddingTop = UDim.new(0, 5)
				
			end
			
		end
		
	end
	
	do --// Functions
		
		function Library:Notify(Str, Time, Tween, Origin)
			
			local Notification = Instance.new("TextLabel", List)
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment[Origin]
			
			do --// Properties
				
				
				Notification.Parent = List
				Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Notification.BackgroundTransparency = 1.000
				Notification.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Notification.BorderSizePixel = 0
				Notification.Position = UDim2.new(0.0207064692, 0, -1.15877785e-09, 0)
				Notification.Size = UDim2.new(0.958586633, 0, 0.0360851437, 0)
				Notification.Font = Enum.Font.RobotoMono
				Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
				Notification.TextSize = 14.000
				Notification.TextStrokeTransparency = 0.000
				Notification.TextWrapped = true
				Notification.TextTransparency = 1
				Notification.Text = tostring(Str)
				
				do --// Tweening
					
					local FadeIn = TweenService:Create( Notification, TweenInfo.new(Tween), { TextTransparency = 0 } )
					local FadeOut = TweenService:Create( Notification, TweenInfo.new(Tween), { TextTransparency = 1 } )
					
					do --// Logic
						
						FadeIn:Play()
						
						do --// Connections

							FadeIn.Completed:Connect(function()

								task.wait(Time)
								FadeOut:Play()

							end)

							FadeOut.Completed:Connect(function()

								Notification:Destroy()

							end)

						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

return Library

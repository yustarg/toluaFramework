BaseUI = class("BaseUI")

function BaseUI:initialize(root, path)
	local go = root.transform:FindChild(path).gameObject
 	Util.AddLuaBehaviour(go, self)
end 

function BaseUI:GetButton(path)
	return self.transform:FindChild(path):GetComponent(typeof(Button))
end

function BaseUI:GetImage(path)
	return self.transform:FindChild(path):GetComponent(typeof(Image))
end

function BaseUI:GetText(path)
	return self.transform:FindChild(path):GetComponent(typeof(Text))
end
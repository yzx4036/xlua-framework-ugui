--[[
-- added by wsh @ 2017-11-30
-- 1、加载全局模块，所有全局性的东西都在这里加载，好集中管理
-- 2、模块定义时一律用local再return，模块是否是全局模块由本脚本决定，在本脚本加载的一律为全局模块
-- 3、对必要模块执行初始化
-- 注意：
-- 1、全局的模块和被全局模块持有的引用无法GC，除非显式设置为nil
-- 2、除了单例类、通用的工具类、逻辑上的静态类以外，所有逻辑模块不要暴露到全局命名空间
-- 3、Unity侧导出所有接口到CS命名空间，访问cs侧函数一律使用CS.xxx，命名空间再cs代码中给了，这里不需要处理
-- 4、这里的全局模块是相对与游戏框架或者逻辑而言，lua语言层次的全局模块放Common.Main中导出
--]]

-- 加载全局模块
require "Framework.Common.BaseClass"
require "Framework.Common.DataClass"
require "Framework.Common.ConstClass"

-- 创建全局模块
---@type Config
Config = require "Global.Config"
require "Global.UtilityCSCallLua"

---@type SingleGet
SingleGet = require "Global.SingleGet"
---@type Singleton
Singleton = require "Framework.Common.Singleton"
---@type Updatable
Updatable = require "Framework.Common.Updatable"
---@type UpdatableSingleton
UpdatableSingleton = require "Framework.Common.UpdatableSingleton"
SortingLayerNames = require "Global.SortingLayerNames"
---@type LoggerLua
Logger = require "Framework.Logger.Logger"
require "Framework.Updater.Coroutine"

-- game data
DataMessageNames = require "DataCenter.Config.DataMessageNames"
---@type DataManager
DataManager = require "DataCenter.DataManager"
---@type ClientData
ClientData = require "DataCenter.ClientData.ClientData"
---@type ServerData
ServerData = require "DataCenter.ServerData.ServerData"
---@type UserData
UserData = require "DataCenter.UserData.UserData"

-- game config
---@type LangUtil
LangUtil = require "Config.LangUtil"

-- ui base
UIUtil = require "Framework.UI.Util.UIUtil"
UIBaseModel = require "Framework.UI.Base.UIBaseModel"
UIBaseCtrl = require "Framework.UI.Base.UIBaseCtrl"
---@type UIBaseComponent
UIBaseComponent = require "Framework.UI.Base.UIBaseComponent"
---@type UIBaseContainer
UIBaseContainer = require "Framework.UI.Base.UIBaseContainer"
UIBaseView = require "Framework.UI.Base.UIBaseView"

-- ui component
UILayer = require "Framework.UI.Component.UILayer"
UICanvas = require "Framework.UI.Component.UICanvas"
UIText = require "Framework.UI.Component.UIText"
---@type UIImage
UIImage = require "Framework.UI.Component.UIImage"
---@type UISlider
UISlider = require "Framework.UI.Component.UISlider"
---@type UIInput
UIInput = require "Framework.UI.Component.UIInput"
---@type UIButton
UIButton = require "Framework.UI.Component.UIButton"
UIToggleButton = require "Framework.UI.Component.UIToggleButton"
---@type UIWrapComponent
UIWrapComponent = require "Framework.UI.Component.UIWrapComponent"
UITabGroup = require "Framework.UI.Component.UITabGroup"
UIButtonGroup = require "Framework.UI.Component.UIButtonGroup"
UIWrapGroup = require "Framework.UI.Component.UIWrapGroup"
UIEffect = require "Framework.UI.Component.UIEffect"

-- ui window
UILayers = require "Framework.UI.UILayers"
UIWindow = require "Framework.UI.UIWindow"
UIManager = require "Framework.UI.UIManager"
UIMessageNames = require "Framework.UI.Message.UIMessageNames"
UIWindowNames = require "UI.Config.UIWindowNames"
UIConfig = require "UI.Config.UIConfig"

-- res
---@type ResourcesManager
ResourcesManager = require "Framework.Resource.ResourcesManager"
---@type GameObjectPool
GameObjectPool = require "Framework.Resource.GameObjectPool"

-- update & time
---@type Timer
Timer = require "Framework.Updater.Timer"
---@type TimerManager
TimerManager = require "Framework.Updater.TimerManager"
---@type UpdateManager
UpdateManager = require "Framework.Updater.UpdateManager"
---@type LogicUpdater
LogicUpdater = require "GameLogic.Main.LogicUpdater"

-- scenes
---@type BaseScene
BaseScene = require "Framework.Scene.Base.BaseScene"
---@type BaseSceneCtrl
BaseSceneCtrl = require "Framework.Scene.Base.BaseSceneCtrl"
---@type SceneManager
SceneManager = require "Framework.Scene.SceneManager"
---@type SceneConfig
SceneConfig = require "Scenes.SceneConfig"

-- atlas
---@type AtlasConfig
AtlasConfig = require "Resource.Config.AtlasConfig"
---@type AtlasManager
AtlasManager = require "Framework.Resource.AtlasManager"

-- effect
---@type EffectConfig
EffectConfig = require "Resource.Config.EffectConfig"
---@type BaseEffect
BaseEffect = require "Framework.Resource.Effect.Base.BaseEffect"
---@type EffectManager
EffectManager = require "Framework.Resource.Effect.EffectManager"
---@type ConfigCfgManager
ConfigCfgManager = require "Config.ConfigCfgManager"
-- net
---@type HallConnector
HallConnector = require "Net.Connector.HallConnector"


ConstTouchLayer =
{
    None = -1,
    CityTower = 8000,
    TowerRange = 9000,
    Attacker = 10000,
    HeroSkillCast = 80000,
    PVPEdit = 88888,
    School = 88889,
    Camera = 90000,
    Explorer = 20000,
}
-- 单例类初始化
SingleGet.UIManager()
SingleGet.DataManager()
SingleGet.ResourcesManager()
SingleGet.UpdateManager()
SingleGet.SceneManager()
SingleGet.AtlasManager()
SingleGet.LogicUpdater()
SingleGet.ConfigCfgManager()
SingleGet.HallConnector()
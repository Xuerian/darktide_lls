---@meta

---@class CommandWindow
CommandWindow = {}
function CommandWindow.print(...)
end

function __print(...)
end


---@class DMFMod
---@field echo fun(self: DMFMod, message: string) Outputs message to game (Toast, chat)
---@field error fun(self: DMFMod, message: string) Outputs message to game as error (Toast,chat)
---@field dump fun(self: DMFMod, t: table, name: string?, depth: integer?) Outputs to dev console
---@field dump_to_file fun(self: DMFMod, t: table, name:string?, depth: integer?) Outputs to json
---@field dtf fun(self: DMFMod, dumped_object: table, object_name: string?, max_depth: integer?) Outputs to json
---@field io_dofile fun(self: DMFMod, path) Loads and executes lua file, returning result
---@field on_all_mods_loaded fun()|nil Event
---@field persistent_table fun(self: DMFMod, table_name: string, default_table: table?): table
---@field get fun(self: DMFMod, setting_id: string): any
---@field set fun(self: DMFMod, setting_id: string, setting_value: any, notify_mod: boolean?)
---@field hook fun(self: DMFMod, object: table, method: string, handler: function)
---@field hook_require fun(self: DMFMod, obj_str: string, callback_func: function)
---@field original_require fun(self: DMFMod, path, ...)
---@field add_require_path fun(self: DMFMod, path)
---@field localize fun(self: DMFMod, text_id, ...): string

---@param mod_name string
---@return DMFMod
function get_mod(mod_name) return {} end

function new_mod(name, t) end

---@class Vector3Box: userdata

---@param x number
---@param y number
---@param z number
---@return Vector3Box
function Vector3Box(x, y, z) return {} end

---@param t table
---@param v any
---@return boolean
function table.contains(t, v) end

---@param t table
---@return table<string|number>
function table.keys(t) end

---@param t table
---@param v any
---@return integer|string|nil
function table.find(t, v) end

-- function table.append(t, v) end

---@param t table
function table.set_readonly(t) end

---@param t table
---@param ... table
---@return table
function table.merge_recursive(t, ...) end

---@param t table
---@return table
function table.clone(t) end

---@param t table
function table.clear(t) end

--#region WeaponCustomizationMod
---@alias VariantID string
---@alias AttachmentID string
---@alias ModelPath string

---@alias AttachmentSlot
---| '"flashlight"'
---| '"handle"'
---| '"bayonet"'
---| '"muzzle"'
---| '"barrel"'
---| '"underbarrel"'
---| '"receiver"'
---| '"magazine"'
---| '"magazine2"'
---| '"bullet"'
---| '"ammo"'
---| '"ammo_used"'
---| '"rail"'
---| '"sight"'
---| '"sight_2"'
---| '"help_sight"'
---| '"grip"'
---| '"stock"'
---| '"stock_2"'
---| '"stock_3"'
---| '"body"'
---| '"pommel"'
---| '"hilt"'
---| '"head"'
---| '"blade"'
---| '"teeth"'
---| '"chain"'
---| '"connector"'
---| '"shaft"'
---| '"left"'
---| '"emblem_right"'
---| '"emblem_left"'
---| '"decal_right"'
---| '"decal_left"'
---| '"shaft_lower"'
---| '"shaft_upper"'
---| '"trinket_hook"'
---| '"slot_trinket_1"'
---| '"slot_trinket_2"'

---@alias WeaponID
---| '"autogun_p1"'
---| '"autopistol_p1"'
---| '"bolter_p1"'
---| '"chainaxe_p1"'
---| '"chainsword_2h_p1"'
---| '"chainsword_p1"'
---| '"combataxe_p1"'
---| '"combataxe_p2"'
---| '"combataxe_p3"'
---| '"combatknife_p1"'
---| '"combatsword_p1"'
---| '"combatsword_p2"'
---| '"combatsword_p3"'
---| '"flamer_p1"'
---| '"forcestaff_p1"'
---| '"lasgun_p1"'
---| '"lasgun_p2"'
---| '"lasgun_p3"'
---| '"laspistol_p1"'
---| '"ogryn_club_p1"'
---| '"ogryn_club_p2"'
---| '"ogryn_combatblade_p1"'
---| '"ogryn_gauntlet_p1"'
---| '"ogryn_heavystubber_p1"'
---| '"ogryn_powermaul_p1"'
---| '"ogryn_powermaul_slabshield_p1"'
---| '"ogryn_rippergun_p1"'
---| '"ogryn_thumper_p1"'
---| '"plasmagun_p1"'
---| '"powermaul_2h_p1"'
---| '"powersword_p1"'
---| '"shotgun_p1"'
---| '"stubrevolver_p1"'
---| '"thunderhammer_2h_p1"'

---@class CoreAttachment
---@field id AttachmentID
---@field name string
---@field no_randomize boolean?

---@class CoreModel
---@field model ModelPath
---@field type AttachmentSlot
---@field parent string?
---@field angle number? default: 0
---@field move Vector3Box? default: vector3_box(0, 0, 0)
---@field remove Vector3Box? default: vector3_box(0, 0, 0)
---@field mesh_move boolean? default: true
---@field hide_mesh table<integer,table<string|integer>>?
---@field automatic_equip string|table<AttachmentSlot,string>?
---@field no_support table<AttachmentSlot|string>?
---@field trigger_move AttachmentSlot[]?
---@field special_resolve fun(gear_id, item: AttachmentSlot, attachment: string)?

---@class CoreAnchorFixData
---@field offset boolean? default: false
---@field position Vector3Box?
---@field rotation Vector3Box?
---@field scale Vector3Box?

---@class CoreAnchors
---@field fixes CoreAnchorFix[]
---@field scope_offset table
---@field trinket_slot string
---@field [string] CoreAnchorFixData

---@alias AnchorDependencies string[]

---@class CoreAnchorFix
---@field dependencies AnchorDependencies
---@field [AttachmentSlot|"no_scope_offset"] CoreAnchorFixData

---@class WeaponCustomizationMod: DMFMod
---@field attachment table<VariantID,table<AttachmentSlot,table<integer,CoreAttachment>>>
---@field attachment_models table<VariantID,table<AttachmentID,CoreModel>>
---@field anchors table<VariantID,CoreAnchors>
---@field sights AttachmentID[]
---@field reflex_sights AttachmentID[]
---@field scopes AttachmentID[]
--#endregion

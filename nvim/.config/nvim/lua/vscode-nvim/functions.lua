function Trim_trailing_whitespace()
	VSCodeCall("editor.action.trimTrailingWhitespace")
end

function Save() VSCodeCall("workbench.action.files.save") end

function Save_no_format()
	VSCodeCall("workbench.action.files.saveWithoutFormatting")
end

function Trim__save__no_format()
	Trim_trailing_whitespace()
	Save_no_format()
end

function Trim__save()
	Trim_trailing_whitespace()
	Save()
end

function Format()
	VSCodeCall("editor.action.formatDocument")
	print("formatted!")
end

function Trim__save__format()
	Trim_trailing_whitespace()
	Format()
	Save()
end

function Reveal_definition_aside()
	VSCodeNotify("editor.action.revealDefinitionAside")
end

function Go_to_implementation()
	VSCodeNotify("editor.action.goToImplementation")
end

function Go_to_reference()
	VSCodeNotify("editor.action.goToReferences")
end

function Outdent()
	---@diagnostic disable-next-line: unused-local
	for i = 1, vim.v.count1 do
		VSCodeNotify("editor.action.outdentLines")
	end
end

function Indent()
	---@diagnostic disable-next-line: unused-local
	for i = 1, vim.v.count1 do
		VSCodeNotify("editor.action.indentLines")
	end
end

function Outdent_vis() VSCodeNotify("editor.action.outdentLines", false) end

function Indent_vis() VSCodeNotify("editor.action.indentLines", false) end

function Comment() VSCodeNotify("editor.action.commentLine") end

function Comment_vis() VSCodeNotify("editor.action.commentLine", false) end

function Convert_to_spaces() VSCodeNotify("editor.action.indentationToSpaces") end

function Convert_to_tabs() VSCodeNotify("editor.action.indentationToTabs") end

function Indent_with_spaces() VSCodeNotify("editor.action.indentUsingSpaces") end

function Indent_with_tabs() VSCodeNotify("editor.action.indentUsingTabs") end

function CloseEditor() VSCodeNotify("workbench.action.closeActiveEditor") end

function CloseOtherEditors() VSCodeNotify("workbench.action.closeOtherEditors") end

function UndoCloseEditor() VSCodeNotify("workbench.action.reopenClosedEditor") end

function Git_stage_file()
	Trim_trailing_whitespace()
	Save()
	VSCodeNotify("git.stage")
end

function Git_unstage_file()
	Save()
	VSCodeNotify("git.unstage")
end

function Git_revert_change()
	VSCodeNotify("git.revertSelectedRanges")
end

function Git_stage_change()
	VSCodeNotify("git.stageSelectedRanges")
end

function Git_unstage_change() VSCodeNotify("git.unstageSelectedRanges") end

function Git_open_changes() VSCodeNotify("git.openChange") end

function Git_open_all_changes() VSCodeNotify("git.openAllChanges") end

function Accept_merge_both() VSCodeNotify("merge-conflict.accept.both") end

function Accept_merge_all_both() VSCodeNotify("merge-conflict.accept.all-both") end

function Accept_merge_current() VSCodeNotify("merge-conflict.accept.current") end

function Accept_merge_all_current() VSCodeNotify("merge-conflict.accept.all-current") end

function Accept_merge_incoming() VSCodeNotify("merge-conflict.accept.incoming") end

function Accept_merge_all_incoming() VSCodeNotify("merge-conflict.accept.all-incoming") end

function Accept_merge_selection() VSCodeNotify("merge-conflict.accept.selection") end

function Toggle_breakpoint() VSCodeNotify("editor.debug.action.toggleBreakpoint") end

function Copy_path() VSCodeNotify("copyFilePath") end

function Copy_relative_path() VSCodeNotify("copyRelativeFilePath") end

function Open_next_editor() VSCodeNotify("workbench.action.nextEditor") end

function Open_previous_editor() VSCodeNotify("workbench.action.previousEditor") end

function Open_explorer() VSCodeNotify("workbench.view.explorer") end

function Navigate_down() VSCodeNotify("workbench.action.navigateUp") end

function Navigate_up() VSCodeNotify("workbench.action.navigateUp") end

function Navigate_left() VSCodeNotify("workbench.action.navigateLeft") end

function Navigate_right() VSCodeNotify("workbench.action.navigateRight") end

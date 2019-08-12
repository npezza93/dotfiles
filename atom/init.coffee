# atom.packages.onDidActivateInitialPackages =>
#   ruby_version = atom.config.get('core.RUBY_VERSION')
#   if ruby_version
#     process.env.RUBY_VERSION = ruby_version
#
#   gem_path = atom.config.get('core.GEM_PATH')
#   if gem_path
#     process.env.GEM_PATH = gem_path
# #
#   path = atom.config.get('core.PATH')
#   if path
#     process.env.PATH = path
# process.env.PATH = ["/usr/bin",
#                     "/usr/local/bin"
#                     ].join(":")
#
# #!/opt/local/bin/coffee
#
# console.log(process.env)
#
# ChildProcess = require 'child_process'
#
# # This command should generate a list of all exports from a login shell:
# exportsCommand = process.env.SHELL + " -lc export"
#
# # Run the command and update the local process environment:
# ChildProcess.exec exportsCommand, (error, stdout, stderr) ->
# 	for definition in stdout.trim().split('\n')
# 		[key, value] = definition.split('=', 2)
# 		process.env[key] = value

# require('electron').remote.getCurrentWindow().setVibrancy('ultra-dark')
#
# window.addEventListener 'blur', () ->
#   projectFind = document.querySelector(".project-find")
#   findReplace = document.querySelector(".find-and-replace")
#
#   shouldToggle =
#     (projectFind && projectFind.parentNode.style.display != "none") ||
#     (findReplace && findReplace.parentNode.style.display != "none")
#
#   if shouldToggle
#     console.log atom.workspace.getActivePaneItem()
#     console.log 'toggling'
#   # if findNode && findNode.parentNode.style.display != "none"
# #  atom.commands.dispatch(atom.workspace.getElement(), 'find-and-replace:toggle')
# , true
atom.commands.add 'body', 'toggle-footer', ->
  document.querySelector('.footer').classList.toggle('hide')

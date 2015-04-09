class Task
  constructor: (@name) ->
    @status = "incomplete"

  complete: ->
    if @parent? and @parent.status isnt 'completed'
      throw "Denpendent task '#{@parent.name}' is not completed."
    @status = 'complete'
    true

  dependsOn: (@parent) ->
    @parent.child = @
    @status = 'dependent'

class TaskList
  constructor: ->
    @tasks = []
    @length = 0

  add: (task) ->
    if typeof task is 'string'
      @tasks.push new Task task
    else
      @tasks.push task
    @length = @tasks.length

  remove: (task) ->
    i = @tasks.indexOf task
    @tasks = @tasks[0...i].concat @tasks[i+1..] if i > -1
    @length = @tasks.length

exports.Task = Task
exports.TaskList = TaskList

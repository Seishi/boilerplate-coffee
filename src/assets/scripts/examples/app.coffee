{Task, TaskList} = require "./task"

task = new Task "wash dashes"

taskList = new TaskList

taskList.add task

console.log taskList


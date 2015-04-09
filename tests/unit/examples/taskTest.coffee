chai = require "chai"
chai.should()

{Task, TaskList} = require "../../../src/assets/scripts/examples/task"

describe 'Task instance', ->
  task1 = task2 = null

  beforeEach ->
    task1 = new Task 'wash dishes'

  it 'should have a name', ->
    task1.name.should.equal 'wash dishes'

  it 'should be initially incomplete', ->
    task1.status.should.equal 'incomplete'

  it 'should be able to be completed', ->
    task1.complete().should.be.true
    task1.status.should.equal 'complete'

  it 'should be able to be dependent on another task', ->
    task2 = new Task 'dry dishes'

    task2.dependsOn task1

    task2.status.should.equal 'dependent'
    task2.parent.should.equal task1
    task1.child.should.equal task2

    (-> task2.complete()).should.throw "Denpendent task 'wash dishes' is not completed."

describe 'TaskList', ->
  taskList = null

  beforeEach ->
    taskList = new TaskList

  it 'should start with no tasks', ->
    taskList.tasks.length.should.equal 0
    taskList.length.should.equal 0

  it 'should accept new tasks as tasks and should remove it', ->
    # 添加任务
    task = new Task 'buy milk'
    taskList.add task
    taskList.tasks[0].name.should.equal 'buy milk'
    taskList.length.should.equal 1

    # 删除之
    i = taskList.length - 1
    taskList.remove taskList.tasks[i]
    taskList.length.should.equal 0

  it 'should accept new tasks as string', ->
    taskList.add 'take out garbage'
    taskList.tasks[0].name.should.equal 'take out garbage'
    taskList.length.should.equal 1


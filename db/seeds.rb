organizations = Organization.create([{ name: 'Oranage Org.' }, { name: 'Apple Inc.' }])
users = User.create([{ name: 'Shariful', email: 'shariful@example.com', password: 'abc123', organization_id: organizations.first.id },
                     { name: 'Nibir', email: 'nibir@example.com', password: 'abc123', organization_id: organizations.last.id }])

project = Project.create(name: 'Project A', organization_id: organizations.first.id)
project.users << users.first

board = Board.create(name: 'DevX', project_id: project.id)

cards = Card.create([{ title: 'Finance report', description: 'Generate finance report file', color: '#0000FF', board_id: board.id, user_id: users.first.id },
                     { title: 'Refactor report', description: 'Refactor finance report file', color: '#0000FF', board_id: board.id, user_id: users.first.id }])

task_list = TaskList.create(color: '#FF3333', card_id: cards.first.id, completed: false)

Task.create([{ state: 1, description: 'Generate report schema', task_list_id: task_list.id },
             { state: 0, description: 'Create excel file', task_list_id: task_list.id }])

cards.last.card_referrers << cards.first

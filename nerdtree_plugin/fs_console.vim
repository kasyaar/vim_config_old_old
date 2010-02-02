"adds new keymaps for add and delete nodes
let opts = {'key': 'a', 'quickhelpText': 'add new node', 'callback': 'NERDTreeAddNode'}
call NERDTreeAddKeyMap(opts)
let opts = {'key': 'd', 'quickhelpText': 'delete node', 'callback': 'NERDTreeDeleteNode'}
call NERDTreeAddKeyMap(opts)

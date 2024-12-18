return {
  --  See https://code.visualstudio.com/docs/editor/tasks
  s('task', {
    t {
      '  {',
      '     "label": "',
    },
    i(1, '<echo>'),
    t {
      '",',
      '      "type": "shell",',
      '      "command": "',
    },
    i(2, '<command>'),
    t {
      '",',
      '      "args":[],',
      '      "options": {',
      '      },',
      '      "group": "general",',
      '      "presentation": {',
      '        "reveal": "always",',
      '        "panel": "new"',
      '      }',
      '    }',
    },
  }),
  s('tasks', {
    t {
      '{',
      '  "version": "2.0.0",',
      '  "tasks": [',
      '  ]',
      '}',
    },
  }),
}

local get_eslint_rules = function()
  return {
    t '@typescript-eslint/no-unused-vars',
    t '@typescript-eslint/consistent-type-assertions',
  }
end
return {
  s('eld', {
    t '// eslint-disable ',
    c(1, get_eslint_rules()),
  }),
  s('eldn', {
    t '// eslint-disable-next-line ',
    c(1, get_eslint_rules()),
  }),
}

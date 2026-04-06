class School
  new: (list) =>
    @directory = {}
    @oks = [@add student for student in *list]

  add: (student) =>
    {name, grade} = student
    if @directory[name]
      false
    else
      @directory[name] = grade
      true

  statuses: => @oks

  grade: (desired) =>
    names = [name for name, grade in pairs @directory when grade == desired]
    table.sort names
    names

  roster: =>
    students = [{name, grade} for name, grade in pairs @directory]
    cmp = (a, b) -> a[2] < b[2] or (a[2] == b[2] and a[1] < b[1])
    table.sort students, cmp
    [student[1] for student in *students]


{
  roster: (list) -> School(list)\roster!

  add: (list) -> School(list)\statuses!

  grade: (list, grade) -> School(list)\grade grade
}

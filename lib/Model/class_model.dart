class ClassModel
{
  String id = '',
          name = '',
          section = '';

  String toSearchable() {
    return id + name + section;
  }
}
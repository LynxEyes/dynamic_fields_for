$ = jQuery

$(document).on 'click', 'a.add.dynamic_fields', ->
  record_list = $(@).siblings('ul')
  tmpl        = $(@).siblings("script[type='text/tmpl']").html()
  record_list.append tmpl.replace /\$\{idx\}/g, record_list.find("li").length
  record_list.find('li:last').hide().slideDown('fast')
  false

$(document).on 'click', 'a.destroy.dynamic_fields', ->
  li = $(@).closest("li")
  li.find("[name$='[_destroy]']").val(1)
  li.slideUp('fast')
  false

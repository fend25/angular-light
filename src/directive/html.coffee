
alight.d.al.html =
    priority: 100
    stopBinding: true
    link: (scope, cd, element, name, env) ->
        child = null
        setter = (html) ->
            if child
                child.$destroy()
                child = null
            if not html
                f$.html element, ''
                return
            f$.html element, html
            child = cd.new()
            alight.bind child, element,
                skip_attr: env.skippedAttr()

        cd.watch name, setter
        null

$("#data-editor").html("<%= escape_javascript(render partial: 'form', locals: { salons: @salons } ) %>");
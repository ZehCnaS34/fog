{
 "title" => "this is the title",
 "sub_title" => "this is the subtitle",
 "sections" => [{
                 "object_name" => "objct",
                 "title" => "section title",
                 "sub_title" => "section sub title",
                 "fields" => [{
                               "question" => "what is 2 + 2",
                               "helper" => "its literally that easy",
                               "required" => true,
                               "entries" => [
                                             {
                                              "type" => "text",
                                              "placeholder" => "something",
                                              "value" => "this is pretty cool",
                                              "name" => "bruh"
                                             },
                                             {
                                              "type" => "text",
                                              "placeholder" => "the fix",
                                              "name" => "dafix"
                                             },
                                            ]
                              },{
                                 "question" => "what is that good good",
                                 "helper" => "only real G's know",
                                 "required" => true,
                                 "entries" => [
                                               {
                                                "type" => "checkbox",
                                                "label" => "Kush",
                                                "name" => "kush"
                                               },
                                               {
                                                "type" => "checkbox",
                                                "label" => "Blue Dream",
                                                "name" => "bd"
                                               },
                                               {
                                                "type" => "select",
                                                "name" => "something",
                                                "choices" => {
                                                              "Display" => "d",
                                                              "Look" => "l"
                                                             }
                                               }
                                              ]
                                }]
                }]
}

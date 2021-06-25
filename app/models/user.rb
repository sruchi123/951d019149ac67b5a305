require 'autoinc'

class User
  include Mongoid::Document

  include Mongoid::Autoinc
  increments :id

  field :firstName, type: String
  field :lastName, type: String
  field :email, type: String

  index(search_field: 'text' )

  def self.search_by_typeahead(query)
    self.where('$or' => [{"firstName" => /.*#{query}.*/i}, 
                                  {"lastName": /.*#{query}.*/i}, 
                                  {"email" => /.*#{query}.*/i}
                        ]
              ).to_a
  end
end

module Currencies
  class Pull
    include Interactor::Organizer

    organize Fetch,
             Create
  end
end

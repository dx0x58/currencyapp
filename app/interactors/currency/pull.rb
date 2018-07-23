module Currency
  class Pull
    include Interactor::Organizer

    organize Fetch
  end
end

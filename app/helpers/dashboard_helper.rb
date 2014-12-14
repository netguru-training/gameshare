module DashboardHelper
  def generate_collection(name)
    Game.public_send(name).collect { |name, _| [name.humanize, name]  }
  end

  def generate_collection_int(name)
    Game.public_send(name).collect { |name, id| [name.humanize, id]  }
  end
end

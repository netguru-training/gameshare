module DashboardHelper
  def generate_collection(name)
    Game.public_send(name).collect { |name, _| [name.humanize, name]  }
  end
end

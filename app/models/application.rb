class Application < ActiveRecord::Base
  belongs_to :job
  belongs_to :jobseeker

  validates :status, inclusion: { in: %w(pending approved reproved frozen) }

  state_machine :status, :initial => :pending do
  	  event :approve do
      	transition :pending => :approved
  	  end
  	  event :reprove do
      	transition :pending => :reproved
  	  end
  	  event :freeze do
      	transition :pending => :frozen
  	  end
  	  event :defreeze  do
  	    transition :frozen => :pending
  	  end
  end

  def translated_status
    tanslated_status = {
      approved: "Aprovado",
      reproved: "Reprovado",
      frozen: "Congelado",
      pending: "Pendente"
    }
    tanslated_status[self.status.to_sym]
  end

  def colored_status
    tanslated_color = {
      approved: "green",
      reproved: "red",
      frozen: "blue",
      pending: "orange"
    }
    tanslated_color[self.status.to_sym]
  end
end

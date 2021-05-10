class List < ApplicationRecord
  has_many :items
  belongs_to :user

  def percent_complete
    return 0 if total_items == 0
    (100 * completed_items.to_f / total_items).round(1)
  end

  def completed_items
    total = 0

    items.each do |i|
      if i.completed?
        total += 1
      end
    end

    @completed_items ||= total
  end

  def total_items
    @total_items ||= items.count
  end

  def status
    case percent_complete.to_i
    when 0
      'Not started'
    when 100
      'Complete'
    else
      'In progress'
    end
  end

  def status_color
    case percent_complete.to_i
    when 0
      'secondary'
    when 100
      'success'
    else
      'warning'
    end
  end
end

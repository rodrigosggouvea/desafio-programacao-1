require 'csv'
class ImportFile
  def self.import(file)
    file = CSV::read(file.path, { headers: true, col_sep: "\t" })
    sale = Sale.new
    sale.items << file.map{ |row| parse(row.to_hash, sale) }
    update_income(sale)
    sale
  end

  def self.parse(row, sale)
    Item.new(
      sale: sale,
      purchaser: Purchaser.find_or_create_by(name: row['purchaser name']),
      merchant: Merchant.find_or_create_by(name: row['merchant name'], address: row['merchant address']),
      description: row['item description'],
      price: row['item price'],
      count: row['purchase count']
      )
  end

  def self.update_income(sale)
    sale.income = sale.items.map{|item| (item.price * item.count)}.sum
  end
end
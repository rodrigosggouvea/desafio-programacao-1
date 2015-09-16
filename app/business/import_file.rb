require 'csv'
class ImportFile
  def self.import(file)
    file = CSV::read(file.path, { headers: true, col_sep: "\t" })
    items = file.map{ |row| parse(row.to_hash) }
    income = items.map{|item| (item.price * item.count)}.sum
    sale = Sale.create(income: income)
    items.each{ |item| item.update(sale: sale) }
    sale
  end

  def self.parse(row)
    Item.create(
      purchaser: Purchaser.find_or_create_by(name: row['purchaser name']),
      merchant: Merchant.find_or_create_by(name: row['merchant name'], address: row['merchant address']),
      description: row['item description'],
      price: row['item price'],
      count: row['purchase count']
      )
  end
end
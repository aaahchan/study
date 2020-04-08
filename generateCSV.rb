require 'roo'

xlsx = Roo::Excelx.new(Dir.pwd + '/Initial_Data.xlsx')

  sheetName = xlsx.sheets
  
  sheetName.each{|i|
  xlsx.sheet(i).to_csv(i + '.csv')
  }

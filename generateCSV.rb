require 'roo'

xlsx = Roo::Excelx.new(Dir.pwd + '/Initial_Data.xlsx')
sheetName = xlsx.sheets
  
  sheetName.each{|i|
    #create csv file
    fileName = i + '.csv'
    xlsx.sheet(i).to_csv(fileName)

    #replace "NULL" to NULL
    buffer = File.open(Dir.pwd + '/' + fileName){|f| f.read()}
    buffer.gsub!('"NULL"','NULL')
    File.open(Dir.pwd + '/' + fileName, "w") { |f| f.write(buffer) }
  }

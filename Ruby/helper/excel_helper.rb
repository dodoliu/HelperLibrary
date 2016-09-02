require "axlsx"
require "roo"

class ExcelAxlsxHelper
  def initialize
    
  end


  def self.write_default
    
  end

  #自定义的写操作
  #si: SheetInfo
  def self.write_custom(sheet)
    # Axlsx::Package.new do |p|
    #   p.workbook.add_worksheet(:name => "Pie Chart") do |sheet|
    #     sheet.add_row ["Simple Pie Chart"]
    #     %w(first second third).each { |label| sheet.add_row [label, rand(24)+1] }
    #     sheet.add_chart(Axlsx::Pie3DChart, :start_at => [0,5], :end_at => [10, 20], :title => "example 3: Pie Chart") do |chart|
    #       chart.add_series :data => sheet["B2:B4"], :labels => sheet["A2:A4"],  :colors => ['FF0000', '00FF00', '0000FF']
    #     end
    #   end
    #   p.serialize('simple.xlsx')
    # end

    Axlsx::Package.new do |p|
      sheet.workbooks.each do |si|
        p.workbook.add_worksheet(:name => si.name) do |sheet|
          sheet.merge_cells "A1:B1" #, :types => [:string]
          sheet.merge_cells "C1:D1"
          sheet.merge_cells "E1:G1"
          sheet.add_row si.titles  #添加表头

          sheet.table.each do |tb|
            puts tb
            # sheet.add_row 
          end


        end  


      end
      p.serialize(sheet.save_path)
    end


  end


end

#excel的对象类
class SheetInfo
  #load_path: string 加载的路径
  #save_path: string 保存的路径
  #workbooks: [WorkbookInfo] WorkbookInfo的数组
  attr_accessor :load_path, :save_path, :workbooks
  def initialize
     @workbooks = []
  end
end
class WorkbookInfo
  #name: string sheet名称
  #titles: array sheet中列标题
  #types: hash sheet中列对应的数据类型 支持的类型包括: ["Date", "Time", "String", "Boolean", "Float", "Integer"]
  #table: array sheet中列标题
  attr_accessor :name, :titles, :types, :table
  def initialize
    @table = []
  end
end
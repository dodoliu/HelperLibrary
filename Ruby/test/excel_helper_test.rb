require  File.join(File.expand_path("../..",__FILE__),'helper','excel_helper.rb')
# require  File.join(File.expand_path("../..",__FILE__),'helper','excel_roo_helper.rb')

# excel_path = File.join(File.expand_path("..",__FILE__),'tmp','excel.xls')
# sheets = []
# si = SheetInfo.new
# si.name = 'test_sheetname'
# si.titles = %w(标题1 标题2 标题3)

# sheets.push si

# ExcelHelper.new.write_excel_simple sheets,excel_path



#RooRooRooRooRooRooRooRooRooRoo
#用Roo

si = SheetInfo.new
si.save_path = "tmp/#{Time.now.strftime('%Y%m%d')}.xlsx"


wi = WorkbookInfo.new

wi.name = '用户记录'
wi.titles = %w(日期 '' 姓名 '' 年龄 '' '')
wi.types = { 日期: :string,姓名: :string, 年龄: :integer }

wi.table = [{日期: '2016-9-1', 姓名: '小明', 年龄: 20},{日期: '2016-9-2', 姓名: '小刚', 年龄: 69},{日期: '2016-9-3', 姓名: '小布点', 年龄: 8},{日期: '2016-9-5', 姓名: '雅蠛蝶', 年龄: 99}]



si.workbooks << wi

# puts si.save_path
# puts si.workbooks[0].table

ExcelAxlsxHelper.write_custom si



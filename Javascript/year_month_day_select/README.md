### 简介
> 使用KnockoutJS实现年月日三个下拉级联,方便复用  
  模式A(year_month_day_select_a): 完整的年月日控件  
  模式B(year_month_day_select_b): 只包含年和月的控件  
  基本参数的详细说明在 coffee中

### 编译
> coffee -w -b -o . -c .

### 用法
>
引入
```html
<script type="text/javascript" src="year_month_day_select.js" defer='defer'></script>
```
html中绑定
```html
<div data-bind="component:'year_month_day_select_a' "></div>
```
或
```html
<div data-bind="component:'year_month_day_select_b' "></div>
```
获取值
```javascript
var year = $("#test_sl_year option:selected").val();
var month = $("#test_sl_month option:selected").val();
var day = $("#test_sl_day option:selected").val();
$("#span").text(year + '-' + month + '-' + day);
```
日期默认选择有三种形式
* 模式1,默认选种 年月日
```javascript
 new YearMonthDaySelect({
  initSelect: 2,
  yearDefault: 'year',
  monthDefault: 'month',
  dayDefault: 'day',
  yearInterval: 10,
  yearTitle: '年',
  yearID: 'test_sl_year',
  yearName: 'test_sl_year_name',
  yearClass: 'test_sl_year_class otherclassname',
  monthTitle: '月',
  monthID: 'test_sl_month',
  monthName: 'test_sl_month_name',
  monthClass: 'test_sl_month_class otherclassname',
  dayTitle: '日',
  dayID: 'test_sl_day',
  dayName: 'test_sl_day_name',
  dayClass: 'test_sl_day_class otherclassname'
});
```
* 模式2, 默认选中 当前 年月日
```javascript
new YearMonthDaySelect({
  initSelect: 2,
  yearInterval: 10,
  yearTitle: '年',
  yearID: 'test_sl_year',
  yearName: 'test_sl_year_name',
  yearClass: 'test_sl_year_class otherclassname',
  monthTitle: '月',
  monthID: 'test_sl_month',
  monthName: 'test_sl_month_name',
  monthClass: 'test_sl_month_class otherclassname',
  dayTitle: '日',
  dayID: 'test_sl_day',
  dayName: 'test_sl_day_name',
  dayClass: 'test_sl_day_class otherclassname'
});
```
* 模式3, 默认选中 当前 年,1月,1日
```javascript
new YearMonthDaySelect({
  initSelect: 3,
  yearInterval: 10,
  yearTitle: '年',
  yearID: 'test_sl_year',
  yearName: 'test_sl_year_name',
  yearClass: 'test_sl_year_class otherclassname',
  monthTitle: '月',
  monthID: 'test_sl_month',
  monthName: 'test_sl_month_name',
  monthClass: 'test_sl_month_class otherclassname',
  dayTitle: '日',
  dayID: 'test_sl_day',
  dayName: 'test_sl_day_name',
  dayClass: 'test_sl_day_class otherclassname'
});
```
* 无论处于何种模式下,只要传入了默认值则选中指定的年月日
```javascript
new YearMonthDaySelect({
  initYear: 2013,
  initMonth: 3,
  initDay: 2,
  yearInterval: 10,
  yearTitle: '年',
  yearID: 'test_sl_year',
  yearName: 'test_sl_year_name',
  yearClass: 'test_sl_year_class otherclassname',
  monthTitle: '月',
  monthID: 'test_sl_month',
  monthName: 'test_sl_month_name',
  monthClass: 'test_sl_month_class otherclassname',
  dayTitle: '日',
  dayID: 'test_sl_day',
  dayName: 'test_sl_day_name',
  dayClass: 'test_sl_day_class otherclassname'
});
```
### 注意事项
> 该扩展所需依赖  
  jquery.js  
  helper.js  
  knockout.js  
  只能同时存在一种模式  
  必须 通过 new YearMonthDaySelect() 调用,否则无法正常使用
//call 和 apply 理解

//有 egg 这样一个类
function egg() {}

//为 egg 设置属性和方法
egg.prototype = {
  egg_type: '未知动物',
  hatch: function(legs){
    if (!legs) {
      legs = 0;
    }
    console.log('孵化出一只 ' + this.egg_type + ',有 ' + legs + ' 条腿');
  }
}

//实例化一个 egg 类
tmp_egg = new egg();
tmp_egg.hatch();
//p 孵化出一只 未知动物,有 0 条腿

//实例化一个 鸭蛋类
duck_egg = { egg_type: '小鸭子' };
tmp_egg.hatch.call(duck_egg,2);
//p 孵化出一只 小鸭子,有 2 条腿

//实例化一个 鳄鱼蛋类
crocodile_egg = { egg_type: '小鳄鱼'};
tmp_egg.hatch.apply(crocodile_egg,[4]);
//p 孵化出一只 小鳄鱼,有 4 条腿


//多重继承

//有一个动物类
function animal(){
  this.name = function (name) {
    console.log('我是 ' + name);
  }
}
//有一个 动物叫声类
function cry(sound){
  this.sound = function(sound){
    console.log('我的叫声 ' + sound);
  }
}

//有一个 家禽类
function fowl()
{
  //实现多重继承
  animal.call(this);
  cry.apply(this);
}

tmp_chicken = new fowl();
tmp_chicken.name('鸡');
tmp_chicken.sound('咕咕咕');
//p 我是 鸡
//p 我的叫声 咕咕咕

tmp_duck = new fowl();
tmp_duck.name('鸭');
tmp_duck.sound('嘎嘎嘎');
//p 我是 鸭
//p 我的叫声 嘎嘎嘎





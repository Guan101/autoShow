<template>
  <van-nav-bar fixed title="提交订单" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
  <div
    style="background: linear-gradient(0deg, #bebebe, #bebebe, #0095b6, #0095b6); height: 91vh; padding-top: 1px; margin-top: 8vh"
  >
    <div style="width: 96vw; margin: 0 auto">
      <!-- title和日期选择 -->
      <van-notice-bar :scrollable="false" text="疫情期间，请全程佩戴口罩！" />
      <div class="titleWrapper" style="background-color: white">
        <h2 style="margin-top: 1vh">{{ sceneInfo.name }}门票</h2>
        <!-- 日期 -->
        <div>
          <van-cell title="参展日期" :value="date" @click="show = true"></van-cell>
          <hr style="border: 1px solid rgba(173, 173, 173, 0.7); border-top: none; margin: 2vh 0" />
          <!-- 初始化时间 -->
          <van-calendar
            v-model:show="show"
            @confirm="onConfirm"
            color="#1989fa"
            :min-date="new Date(startTime)"
            :max-date="new Date(endTime)"
          />
        </div>
        <!-- 选择门票数量 -->
        <div class="ticketsNum">
          <h1 style="font-size: 1.5rem">选择数量</h1>
          <div style="display: flex">
            <van-button type="primary" @click="numSub" :disabled="sub">-</van-button>
            <input type="text" v-model="num" @blur="Dia" />
            <van-button type="primary" @click="numAdd" :disabled="add" color="#1E90FF">+</van-button>
          </div>
        </div>
        <div class="smallFont">每单限购5张</div>
      </div>
      <!-- 游客信息 -->
      <div class="touristInfo">
        <div class="touristTop">
          <b style="font-size: 1.5rem; margin-top: 2vh">游客信息</b>
          <span>用户参展身份验证</span>
        </div>
        <!-- 选择游客 -->
        <div v-if="uTourist" class="infoWarpper">
          <!-- 用户已存游客信息展示 -->
          <!-- 用户已存游客信息展示 -->
          <div class="touristName">
            <!-- // 拿到用户已添加的游客信息的长度，动态的给bbb一个长度 -->
            <div id="bbb" :style="{ width: uTourist.leng * 22 + 'vw' }">
              <!-- 父组件传递时再给子组件一个自定义事件 -->
              <tourists-btn
                @setId="getId"
                v-for="item in uTourist.list"
                :key="item.t_id"
                :items="{ item, leng: uTourist.leng }"
              />
            </div>
          </div>
          <!-- 联系人编辑 -->
          <div class="addUser">
            <van-cell is-link @click="showPopup">添加游客</van-cell>
            <van-popup v-model:show="show1" round position="bottom" :style="{ height: '70%' }">
              <div class="editInfo">
                <div class="top">
                  <span @click="show1 = false">取消</span>
                  <b>编辑游客</b>
                  <span @click="verifyInfo">完成</span>
                </div>
                <div class="info">
                  <van-cell-group inset>
                    <!-- 输入任意文本 -->
                    <van-field v-model="userName" @blur="getuserName" label="姓名" :required="true" />
                    <!-- 输入手机号，调起手机号键盘 -->
                    <van-field v-model="userTel" @blur="getuserTel" type="tel" label="手机号" :required="true" />
                    <!-- 允许输入正整数，调起纯数字键盘 -->
                    <van-field v-model="userID" @blur="getuserID" type="digit" label="身份证号" :required="true" />
                  </van-cell-group>
                </div>
              </div>
            </van-popup>
          </div>
        </div>
      </div>
    </div>
    <van-submit-bar label="总价" :price="totalPrice" button-text="提交订单" @submit="onSubmit" />
  </div>
</template>

<script>
import { Dialog, Toast, Button } from 'vant';
import axios from 'axios';
axios.defaults.baseURL = 'http://127.0.0.1:3000';
// 引入nanoid
import { nanoid } from 'nanoid';
import router from '@/router/index.js';
import { onMounted, reactive, ref } from 'vue';
import TouristsBtn from './TouristsBtn.vue';
export default {
  components: { TouristsBtn },
  setup() {
    // 开始时间结束时间
    let startTime = ref('');
    let endTime = ref('');
    // 用户保存的游客信息
    let uTourist = reactive({});
    // 拿到路径中传递过来的参数
    // console.log(router.currentRoute.value.query);
    const sceneInfo = router.currentRoute.value.query;
    // console.log(sceneInfo.id);
    // 根据id请求参展信息
    function initialize() {
      // 请求场次信息
      const url = `/v1/scenes/sceneList/${sceneInfo.id}`;
      axios.get(url).then(res => {
        startTime.value = res.data.results[0].showStartTime.match(/\d+/g).join(',');
        endTime.value = res.data.results[0].showEndTime.match(/\d+/g).join(',');
        // console.log(startTime.value);
        // console.log(res.data.results[0].showEndTime);
      });
      initTourists();
    }
    // 初始化请求用户保存的游客信息信息
    const initTourists = () => {
      const url1 = `/v1/tuser/tuserInfo`;
      // 请求用户自己保存的游客信息列表
      // 这里插入的时候最后一个值一定要是从浏览器动态获取的用户id（还有上边遍历的地方）
      let user = JSON.parse(localStorage.getItem('userinfo'));
      const params = `t_uid=${user.u_id}`;
      axios.post(url1, params).then(res => {
        uTourist.list = [...res.data.data];
        uTourist.leng = res.data.data.length;
        console.log(uTourist.list);
        console.log(uTourist.leng);
      });
    };
    // 日期
    const date = ref('');
    const timeing = ref('');
    const show = ref(false);
    const formatDate = date => {
      // 选中的天数
      timeing.value = `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
      // console.log(time.value);
      // console.log(`${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`);
      return `${date.getFullYear()}-${date.getMonth() + 1}-${date.getDate()}`;
    };
    const onConfirm = value => {
      show.value = false;
      date.value = formatDate(value);
    };
    // 门票数量
    let num = ref('1');
    let sub = ref(true);
    let add = ref(false);
    function numSub() {
      num.value--;
      add.value = false;
      if (num.value <= 1) {
        num.value = 1;
        sub.value = true;
      }
    }
    function numAdd() {
      num.value++;
      sub.value = false;
      if (num.value >= 5) {
        Toast('单次最多购买5张');
        num.value = 5;
        add.value = true;
      }
    }
    // 门票超出数量弹出框
    let Dia = () => {
      if (num.value >= 5) {
        num.value = 5;
        add.value = true;
        Toast('单次最多购买5张');
      }
    };
    // 联系人弹框
    const show1 = ref(false);
    const showPopup = () => {
      if (uTourist.leng >= 5) {
        Dialog({ message: '游客信息最多只可添加5条！双击游客可删除重新添加。' });
        return;
      }
      show1.value = true;
    };
    // 验证编辑的信息
    const userName = ref('');
    const userTel = ref('');
    const userID = ref('');
    const getuserName = () => {
      if (!/^[\u4e00-\u9fa5]{2,4}$/.test(userName.value)) {
        Toast('请查看姓名是否有误');
      }
      // console.log(userName.value);
    };
    const getuserTel = () => {
      if (!/^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test(userTel.value)) {
        Toast('请查看手机号是否有误');
      }
      // console.log(userTel.value);
    };
    const getuserID = () => {
      if (!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(userID.value)) {
        Toast('请查看身份证号是否有误');
      }
      // console.log(userID.value);
    };
    // 点击完成按钮
    const verifyInfo = () => {
      // 如果三个都书写正确
      if (
        /^[\u4e00-\u9fa5]{2,4}$/.test(userName.value) &&
        /^(13[0-9]|14[5|7]|15[0|1|2|3|4|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/.test(userTel.value) &&
        /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(userID.value)
      ) {
        // Toast.success('保存成功');
        // 这里插入的时候最后一个值一定要是从浏览器动态获取的用户id（还有上边遍历的地方）
        let user = JSON.parse(localStorage.getItem('userinfo'));
        let params = `userName=${userName.value}&userTel=${userTel.value}&userID=${userID.value}&t_uid=${user.u_id}`;
        axios.post('/v1/tuser/tuser', params).then(res => {
          // 判断用户身份证号是否存在
          if (res.data.code == 202) {
            Toast.fail('用户已存在');
          } else if (res.data.code == 200) {
            Toast.success('添加成功');
            initTourists();
            show1.value = false;
            userName.value = userTel.value = userID.value = '';
          } else {
            Toast.fail('添加失败，请重试');
          }
        });
      } else {
        Toast.fail('信息格式，有误请重新输入！');
      }
    };
    // 总价格
    const totalPrice = ref(0);
    // 保存游客被选中了几个的数组
    const maiId = reactive([]);
    // 获取买票信息被选中的id,是否被选中，传入的用户信息
    let getId = (id, isShow, userInfo) => {
      // 判断如果数组为空则直接添加
      if (maiId.length == 0) {
        maiId.push(userInfo);
        // 对数组每操作一次就重新渲染总价格
        totalPrice.value = maiId.length * 7777;
      }
      // console.log(isShow);
      // 对maiIdfor循环
      for (let i in maiId) {
        // 如果传递过来的是true则需要展示
        if (isShow) {
          if (maiId.indexOf(userInfo) == -1) {
            // 查询原数组如果没有添加进去
            maiId.push(userInfo);
            // 对数组每操作一次就重新渲染总价格
            totalPrice.value = maiId.length * 7777;

            // 对数组进行排序
            maiId.sort((a, b) => {
              return a.t_id - b.t_id;
            });
            // >-1证明已经存在
          } else if (maiId.indexOf(userInfo) > -1) {
            return;
          }
          // 如果传递过来的是false则需要把数组中原来的删除了
        } else {
          let a = maiId.indexOf(userInfo);
          // console.log("我次那个哪里开始删除1个",a);
          maiId.splice(a, 1);
          // 对数组每操作一次就重新渲染总价格
          totalPrice.value = maiId.length * 7777;
          return;
        }
      }
    };
    // 提交订单
    const onSubmit = () => {
      // 得到场次id
      const carId = router.currentRoute.value.query.id;
      const carname = router.currentRoute.value.query.name;
      // 判断选择的门票数量是否和选择的游客信息一致
      if (num.value != maiId.length) {
        Toast('请将购票数量与游客信息相匹配');
      } else if (!timeing.value) {
        Toast('请选择参展日期');
      } else {
        // console.log(maiId);
        maiId.forEach(item => {
          console.log(item);
          // 用户id
          let user = JSON.parse(localStorage.getItem('userinfo'));
          // console.log(user.u_id);
          let params = `o_id=${nanoid()}&o_u_id=${user.u_id}&osen_id=${carId}&o_name=${carname}&o_number=${1}&o_price=${
            totalPrice.value
          }&o_time=${timeing.value}&tname=${item.tname}&tphone=${item.tphone}&tidcard=${item.tidcard}`;
          console.log(params);
          axios.post('/v1/p_order/p_order', params).then(res => {
            console.log(res);
            if (res.data.code == 200) {
              Toast.fail('订单已生成');
              router.push('/carorder');
            } else if (res.data.code == 202) {
              Toast.fail('用户以购票请勿重复购票');
            }
          });
        });
      }
    };
    onMounted(() => {
      initialize();
      initTourists();
    });
    return {
      sceneInfo, //拿到的属性
      date,
      show,
      onConfirm, //日历
      startTime,
      endTime, //开始结束时间
      uTourist, //用户保存的信息
      show1,
      showPopup, //弹出编辑游客信息
      num,
      sub,
      add,
      numAdd,
      numSub,
      Dia, //编辑游客信息正则
      userName,
      userTel,
      userID,
      getuserName,
      getuserTel,
      getuserID, //游客信息验证
      verifyInfo, //完成按钮
      getId,
      maiId, //子组件传递过来的id
      totalPrice, // 总票价
      onSubmit, //提交订单
    };
  },
};
</script>
<script></script>
<style lang="scss" scoped>
// title和日期数量
.titleWrapper {
  margin-top: 1vh;
  background-color: white;
  overflow: hidden;
  border-radius: 10px;
  padding: 1vh 2vw;

  // 日期
  .van-cell {
    margin-top: 1vh;
    font-size: 1.2rem;
    font-weight: 600;
    // background-color: red;
    .van-cell__value {
      span {
        font-size: 0.7rem;
      }
    }
  }
  // 选择门票数量
  .ticketsNum {
    display: flex;
    justify-content: space-between;
    align-items: center;
    button {
      font-size: 1.4rem;
      width: 9vw;
      border: none;
      border-radius: 5px;
    }
    input {
      width: 10vw;
      text-align: center;
      // box-sizing: border-box;
      border: none;
      height: 5vh;
      padding-top: 0.6vh;
      font-size: 1.4rem;
    }
  }
  // 小的每次限购
  .smallFont {
    background-color: rgb(219, 219, 219);
    padding-left: 10px;
    font-size: 0.8rem;
    border-radius: 7px;
    margin-top: 10px;
    padding: 5px 5px;
  }
}
// 游客信息
.touristInfo {
  margin-top: 1vh;
  background-color: white;
  overflow: hidden;
  border-radius: 10px;
  padding: 1vh 2vw;
  span {
    font-size: 0.6rem;
    margin-left: 3vw;
    color: rgb(190, 6, 6);
  }
  // 用户已存游客信息展示
  ::-webkit-scrollbar {
    width: 1px;
  }
  .touristName {
    width: 60vw;
    overflow: auto;
    border-top-right-radius: 20px;
    border-bottom-right-radius: 20px;
    box-shadow: -10px 0 3px -7px rgba(206, 206, 206, 0.5) inset;
    // 动态游客信息选择
    #bbb {
      // border: 1px solid red;
      // 动态宽度
      display: flex;
      > div {
        width: 20vw;
        margin-right: 2vw;
        margin-top: 1.5vh;
        text-align: center;
        height: 13vw;
        overflow: hidden;
        line-height: 13vw;
        border-radius: 10px;
        border: 1px solid rgb(168, 168, 168);
      }
    }
  }
  // 展示选择游客
  .infoWarpper {
    position: relative;
    height: 19vw;
    .addUser {
      position: absolute;
      right: 0;
      top: 1.5vh;
      width: 110px;
      height: 13vw;
      overflow: hidden;
      border-radius: 10px;
      border: 1px solid rgb(168, 168, 168);
      .editInfo {
        width: 94%;
        margin: 0 auto;
        padding-top: 2vh;
        .top {
          span {
            font-weight: 600;
            color: #1e90ff;
          }
          b {
            font-size: 1.4rem;
            margin-top: -5px;
          }
          display: flex;
          justify-content: space-between;
        }
      }
    }
  }
}
// 联系人编辑
</style>

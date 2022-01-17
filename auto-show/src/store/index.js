import { createStore } from 'vuex';

export default createStore({
  state: {
    islogin: localStorage.getItem('islogin'), //定义是否登陆状态
    userinfo: localStorage.getItem('userinfo'), //保存当前登录用户名
    cityName: '',
  },
  mutations: {
    loginOk(state, newobj) {
      state.islogin = true;
      state.userinfo = newobj;
      localStorage.setItem('islogin', true);
      localStorage.setItem('userinfo', JSON.stringify(newobj));
    },
    setCityName(state, value) {
      state.cityName = value;
    },
  },
  actions: {},
  modules: {},
});

import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';

const routes = [
  {
    path: '/pointsShop',
    name: 'PointsShop',
    component: () => import('../views/PointsShop.vue'),
  },
  {
    path: '/pointsResult',
    name: 'PointsResult',
    component: () => import('../views/PointsResult.vue'),
  },
  {
    path: '/Artdetails/:art_id',
    name: 'Artdetails',
    component: () => import('../views/Artdetails.vue'),
  },
  {
    path: '/newsbutton',
    name: 'Newsbutton',
    component: () => import('../views/Newsbutton.vue'),
  },
  {
    path: '/editinfo',
    name: 'Editinfo',
    component: () => import('../views/Editinfo.vue'),
  },
  {
    path: '/selfinfo',
    name: 'Selfinfo',
    component: () => import('../views/Selfinfo.vue'),
  },
  {
    path: '/myhistory',
    name: 'Myhistory',
    component: () => import('../views/Myhistory.vue'),
  },
  {
    path: '/mysetter',
    name: 'Mysetter',
    component: () => import('../views/Mysetter.vue'),
  },
  {
    path: '/mycollect',
    name: 'MyCollect',
    component: () => import('../views/MyCollect.vue'),
  },
  {
    path: '/myorder',
    name: 'MyOrder',
    component: () => import('../views/MyOrder.vue'),
  },
  {
    path: '/ticket',
    name: 'Ticket',
    component: () => import('../views/Ticket.vue'),
  },
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/myhelp',
    name: 'Myhelp',
    component: () => import('../views/Myhelp.vue'),
  },
  {
    path: '/couponlist',
    name: 'ConponList',
    component: () => import('../views/CouponList.vue'),
  },
  {
    path: '/me',
    name: 'Me',
    component: () => import('../views/Me.vue'),
  },
  {
    path: '/setpwd',
    name: 'SetPwd',
    component: () => import('../views/SetPwd.vue'),
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue'),
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('../views/Register.vue'),
  },
  {
    path: '/map',
    name: 'Map',
    component: () => import('views/map/Map'),
  },
  {
    path: '/navigation',
    name: 'Navigation',
    component: () => import('views/navigation/Navigation'),
  },
  {
    path: '/news',
    name: 'News',
    component: () => import('../views/News.vue'),
    meta: {
      requireAuth: true,
    },
  },
  {
    path: '/newsDetails',
    name: 'NewsDetails',
    component: () => import('../views/NewsDetails.vue'),
  },
  {
    path: '/activity',
    name: 'Activity',
    component: () => import('../views/Activity.vue'),
  },
  {
    path: '/activityDetails',
    name: 'ActivityDetails',
    component: () => import('../views/ActivityDetails.vue'),
  },
  {
    //汽车全部头像
    path: '/barand',
    name: 'Barand',
    component: () => import('../views/Barand.vue'),
  },
  {
    path: '/barandChild/:?',
    name: 'BarandChild',
    component: () => import('../views/BarandChild.vue'),
  },
  {
    path: '/cardetails',
    name: 'CarDetails',
    component: () => import('../views/CarDetails.vue'),
  },
  {
    path: '/scene',
    name: 'Scene',
    component: () => import('../views/Scene.vue'),
  },
  {
    path: '/sceneChild',
    name: 'SceneChild',
    component: () => import('../views/SceneChild.vue'),
  },
  {
    path: '/buyticket',
    name: 'BuyTicket',
    component: () => import('../views/BuyTicket.vue'),
  },
  {
    path: '/userinfo',
    name: 'UserInfo',
    component: () => import('../views/UserInfo.vue'),
  },
  {
    path: '/carorder',
    name: 'CarOrder',
    component: () => import('../views/CarOrder.vue'),
  },

  {
    path: '/特斯拉',
    name: 'Tesla',
    meta: {
      title: '特斯拉',
    },
    component: () => import('../components/Tesla.vue'),
  },
  {
    path: '/amg',
    name: 'Benz',
    component: () => import('../components/Benz.vue'),
  },
  {
    path: '/劳斯莱斯',
    name: 'Rolls',
    component: () => import('../components/Rolls.vue'),
  },
  {
    path: '/路虎',
    name: 'Luhu',
    component: () => import('../components/Luhu.vue'),
  },
  {
    path: '/宝马',
    name: 'Bwm',
    component: () => import('../components/Bwm.vue'),
  },
  {
    path: '/宾利',
    name: 'Binli',
    component: () => import('../components/Binli.vue'),
  },
  {
    path: '/法拉利',
    name: 'Ferrari',
    component: () => import('../components/Ferrari.vue'),
  },
  {
    path: '/雷克萨斯',
    name: 'Lexus',
    component: () => import('../components/Lexus.vue'),
  },
  {
    path: '/保时捷',
    name: 'Porsche',
    component: () => import('../components/Porsche.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});
// 路由前置收尾
//进入页面之前判断用户是否登录
router.beforeEach((to, from, next) => {
  if (to.meta.requireAuth) {
    // 判断该路由是否需要登录权限
    if (localStorage.getItem('userinfo')) {
      // 获取用户登录信息
      next();
    } else {
      next({
        path: '/login',
        query: { redirect: from.fullPath }, // 将跳转的路由path作为参数，登录成功后跳转到该路由
      });
    }
  } else {
    next();
  }
});
export default router;

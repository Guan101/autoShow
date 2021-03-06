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
    //??????????????????
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
    path: '/?????????',
    name: 'Tesla',
    meta: {
      title: '?????????',
    },
    component: () => import('../components/Tesla.vue'),
  },
  {
    path: '/amg',
    name: 'Benz',
    component: () => import('../components/Benz.vue'),
  },
  {
    path: '/????????????',
    name: 'Rolls',
    component: () => import('../components/Rolls.vue'),
  },
  {
    path: '/??????',
    name: 'Luhu',
    component: () => import('../components/Luhu.vue'),
  },
  {
    path: '/??????',
    name: 'Bwm',
    component: () => import('../components/Bwm.vue'),
  },
  {
    path: '/??????',
    name: 'Binli',
    component: () => import('../components/Binli.vue'),
  },
  {
    path: '/?????????',
    name: 'Ferrari',
    component: () => import('../components/Ferrari.vue'),
  },
  {
    path: '/????????????',
    name: 'Lexus',
    component: () => import('../components/Lexus.vue'),
  },
  {
    path: '/?????????',
    name: 'Porsche',
    component: () => import('../components/Porsche.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});
// ??????????????????
//??????????????????????????????????????????
router.beforeEach((to, from, next) => {
  if (to.meta.requireAuth) {
    // ???????????????????????????????????????
    if (localStorage.getItem('userinfo')) {
      // ????????????????????????
      next();
    } else {
      next({
        path: '/login',
        query: { redirect: from.fullPath }, // ??????????????????path????????????????????????????????????????????????
      });
    }
  } else {
    next();
  }
});
export default router;

<template>
  <div class="boxs">
    <van-nav-bar title="AMG" left-text="返回" @click="$router.go(-1)" left-arrow> </van-nav-bar>
    <div class="maskLoading" v-if="isLoading">
      <div class="loading">
        <div :style="{ width: loadingWidth + '%' }"></div>
      </div>
      <div style="padding-left: 10px">{{ parseInt(loadingWidth) }}%</div>
    </div>
    <div class="mask">
      <van-button @click="isAutoFun" type="primary" size="small">转动车</van-button>
      <van-button @click="stop" type="warning" size="small">停止</van-button>
    </div>
  </div>
</template>

<script setup>
import { onMounted, reactive, ref, toRefs } from 'vue';
import {
  DirectionalLight,
  DirectionalLightHelper,
  HemisphereLight,
  HemisphereLightHelper,
  PerspectiveCamera,
  Scene,
  WebGLRenderer,
  AmbientLight,
} from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader';
const loader = new GLTFLoader(); //引入模型的loader实例
const defaultMap = {
  x: 7,
  y: 1,
  z: 1,
}; // 相机的默认坐标
const map = reactive(defaultMap); //把相机坐标设置成可观察对象
const { x, y, z } = toRefs(map); //输出坐标给模板使用
let scene, camera, renderer, controls, dhelper, hHelper, directionalLight, hemisphereLight; // 定义所有three实例变量
// 学习中定义的环境光
let light;
let isLoading = ref(true); //是否显示loading  这个load模型监听的进度
let loadingWidth = ref(0); // loading的进度

//创建灯光
const setLight = () => {
  directionalLight = new DirectionalLight(0xffffff, 0.1);
  directionalLight.position.set(-4, 8, 4);
  dhelper = new DirectionalLightHelper(directionalLight, 5, 0xff0000);
  hemisphereLight = new HemisphereLight(0xffffff, 0xffffff, 0.4);
  hemisphereLight.position.set(0, 8, 0);
  hHelper = new HemisphereLightHelper(hemisphereLight, 5);
  light = new AmbientLight(0x404040); // soft white light
  scene.add(light);
  scene.add(directionalLight);
  scene.add(hemisphereLight);
};

// 创建场景
const setScene = () => {
  scene = new Scene();
  renderer = new WebGLRenderer();
  renderer.setClearColor('#a8a8a8', 1);
  renderer.setSize(innerWidth, innerHeight);
  document.querySelector('.boxs').appendChild(renderer.domElement);
};

// 创建相机
const setCamera = () => {
  const { x, y, z } = defaultMap;
  camera = new PerspectiveCamera(60, innerWidth / innerHeight, 1, 1000);
  camera.position.set(x, y, z);
};

// 设置模型控制
const setControls = () => {
  controls = new OrbitControls(camera, renderer.domElement);
  controls.maxPolarAngle = (0.9 * Math.PI) / 2;
  controls.enableZoom = true;
  controls.autoRotate = true;
  controls.addEventListener('change', render);
};
//返回坐标信息
const render = () => {
  map.x = Number.parseInt(camera.position.x);
  map.y = Number.parseInt(camera.position.y);
  map.z = Number.parseInt(camera.position.z);
};
// 循环场景 、相机、 位置更新
const loop = () => {
  requestAnimationFrame(loop);
  renderer.render(scene, camera);
  controls.update();
};
//是否自动转动
const isAutoFun = () => {
  controls.autoRotate = true;
};
//停止转动
const stop = () => {
  controls.autoRotate = false;
};
const loadFile = url => {
  return new Promise((resolve, reject) => {
    loader.load(
      url,
      gltf => {
        resolve(gltf);
      },
      ({ loaded, total }) => {
        let load = Math.abs((loaded / total) * 100);
        loadingWidth.value = load;
        if (load >= 100) {
          setTimeout(() => {
            isLoading.value = false;
          }, 1000);
        }
        // console.log((loaded / total * 100) + '% loaded')
      },
      err => {
        reject(err);
      }
    );
  });
};

//初始化所有函数
const init = async () => {
  setScene();
  setCamera();
  setLight();
  setControls();
  const gltf = await loadFile('/modelss/benz/benz.gltf');
  scene.add(gltf.scene);
  loop();
};
//用vue钩子函数调用
onMounted(init);
</script>

<style>
body {
  margin: 0;
}

.maskLoading {
  background: rgb(31, 29, 29);
  position: fixed;
  display: flex;
  justify-content: center;
  align-items: center;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 1111111;
  color: #fff;
}

.maskLoading .loading {
  width: 400px;
  height: 20px;
  border: 1px solid #fff;
  background: #000;
  overflow: hidden;
  border-radius: 10px;
}

.maskLoading .loading div {
  background: #fff;
  height: 20px;
  width: 0;
  transition-duration: 500ms;
  transition-timing-function: ease-in;
}

canvas {
  width: 100%;
  height: 100%;
  margin: auto;
}

.mask {
  color: #fff;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  text-align: center;
}
</style>

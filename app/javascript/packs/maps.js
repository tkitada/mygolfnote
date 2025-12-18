const mapElement = document.getElementById("map");
const apiKey = mapElement ? mapElement.dataset.apiKey : null;

if (!apiKey) {
  console.error("APIキーが取得できませんでした。");
}

(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: apiKey, 
  v: "weekly"
});

async function initMap() {
  try {
    const { Map } = await google.maps.importLibrary("maps");
    
    const mapElement = document.getElementById("map");
    if (!mapElement) return;

    // 地図の初期化
    const map = new Map(mapElement, {
      center: { lat: 35.681236, lng: 139.767125 },
      zoom: 10, 
    });

    console.log("1. Railsからデータ取得...");
    const response = await fetch("/practice_posts.json");
    const items = await response.json();
    

    items.forEach((item, index) => {
      // 緯度経度を数値に変換
      const lat = parseFloat(item.latitude);
      const lng = parseFloat(item.longitude);

      if (isNaN(lat) || isNaN(lng)) {
        return;
      }

      // 確実な表示のために「標準マーカー」を使用
      new google.maps.Marker({
        position: { lat: lat, lng: lng },
        map: map,
        title: item.address || "練習場"
      });
      
    });

  } catch (error) {
    console.error("エラーが発生しました:", error);
  }
}

window.initMap = initMap;

// Turbolinks環境下での二重起動を防ぎつつ実行
window.initMap = initMap;
document.addEventListener("turbolinks:load", () => {
  if (typeof google !== 'undefined') {
    initMap();
  }
});
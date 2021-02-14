import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';
import googleCalendarPlugin from '@fullcalendar/google-calendar';


document.addEventListener('turbolinks:load', function () {
  // DOMを取得
  var calendarEl = document.getElementById('calendar');
  
  // 指定DOMにカレンダープラグインを適用する
  var calendar = new Calendar(calendarEl, {
    plugins: [googleCalendarPlugin, dayGridPlugin, timeGridPlugin, interactionPlugin, listPlugin],
    eventSources: [
      {
        googleCalendarApiKey: 'AIzaSyAMoaf_1Pz15oaBM0V1J5MUx6uf06lNmgk',
        googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
        display: 'background',
        color: "#f09e9e",
      }
    ],
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },
    events: '/tasks.json', //カレンダー上の予定（以下「イベント」）の表示に使用します
      timeZone: 'Asia/Tokyo',
      locale: 'ja', //カレンダーに表示する文字の言語選択
      firstDay: 0, //日曜日から表示する
      navLinks: true, //カレンダー内の日付クリックで日表示に遷移するかどうか
      nowIndicator: true,
      weekNumbers: true,
      weekNumberCalculation: 'ISO',
      editable: true, //イベントを編集できるかどうか
      selectable: true,
      dayMaxEvents: true,
    selectLongPressDelay: 0 // スマホでタップしたとき即反応
  });

    calendar.render();
  });

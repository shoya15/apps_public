function getElements() {
    let elements = [];
    for (let i = 0; i < arguments.length; i++){
        let id = arguments[i];
        elements.push(document.getElementById(id));
    }
    return elements;
}

const elements = getElements("js-text", "js-time", "js-script_visible", "js-label_text", "js-label_time", "js-button", "js-script_hidden1", "js-script_hidden2", "js-script_hidden3", "js-reset");

window.addEventListener("load", function () {
    let   text           = elements[0];
    let   time           = elements[1];
    const script_visible = elements[2];
    const label_text     = elements[3];
    const label_time     = elements[4];
    const button         = elements[5];
    const script_hidden1 = elements[6];
    const script_hidden2 = elements[7];
    const script_hidden3 = elements[8];
    const reset          = elements[9];
    const arr            = [text, time, script_visible, label_text, label_time, button, script_hidden1, script_hidden2, script_hidden3, reset];

    if (!button) { return false; }

    button.addEventListener("click", function () {
        for (let i = 0; i < 10; i++){
            if (i < 6) {
                arr[i].style.display = "none";
            } else {
                arr[i].style.display = "block";
            }
        }

        time = time.value
        text = text.value
        script_hidden2.innerHTML = "設定したテキスト：" + `${text}`
        script_hidden3.innerHTML = "設定した時間：" + `${time}`
        setInterval(function () {
            let now = new Date();
            let hour = now.getHours();
            if (hour < 10) {
                hour = `0${hour}`
            }
            let minute = now.getMinutes();
            if (minute < 10) {
                minute = `0${minute}`
            }
            let current_time = hour + ":" + minute

            if ('speechSynthesis' in window) {
                const uttr = new SpeechSynthesisUtterance()
                uttr.text = text
                uttr.rate = 0.93
                uttr.pitch = 1.1
                if (text.length <= 50) {
                    if (time == current_time) {
                        window.speechSynthesis.speak(uttr)
                        window.location.href = "/"
                    }
                }
            } else {
                alert('大変申し訳ございません。このブラウザは音声合成に対応しておりません。')
            }
        }, 1000)
    })
})
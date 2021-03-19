document.addEventListener("DOMContentLoaded", function () {
    const characterAnnotation = document.querySelector(".annotation");
    const characterAnnotationWrapper = characterAnnotation.querySelector(".annotation-wrapper");

    let getRaceResult = true;
    let characterJumpDistance = [];
    let startTime = getTimestamp();

    function interval() {
        if (!window.character.isRunning) {
            window.character.run();
            getRaceResult = true;
        }

        const distance = window.terrain.rockPosition - window.character.characterPosition;

        const fault = window.terrain.rockSize / 3;

        if (distance < 150 - fault && distance > 0) {
            window.character.jump();
            const jumpIntervalID = setInterval(function () {
                if (window.character.isJumping) {
                    characterJumpDistance.push(window.character.characterPosition);
                } else clearInterval(jumpIntervalID);
            }, 10);
        }

        if (getRaceResult && characterAnnotation.style.opacity === "1") {
            clearInterval(intervalID);
            getRaceResult = false;
            let stopTime = getTimestamp();
            let raceTime = parseFloat((stopTime - startTime).toFixed(2));
            console.log(startTime, stopTime, raceTime);
            const wrapperText = characterAnnotationWrapper.innerText;

            if (wrapperText === "Yay!") {
                console.log("Победа!");
                saveResults(1, window.terrain.rockSize, window.terrain.rockPosition, characterJumpDistance[0], characterJumpDistance[characterJumpDistance.length - 1], raceTime);
            } else if (wrapperText === "Ouch!") {
                console.log("Поражение!");
                saveResults(0, window.terrain.rockSize, window.terrain.rockPosition, characterJumpDistance[0], characterJumpDistance[characterJumpDistance.length - 1], raceTime);
            }

            startTime = getTimestamp();
            intervalID = setInterval(interval, 10);
        }
    }

    let intervalID = setInterval(interval, 10);
});

function getTimestamp() {
    return Date.now() / 1000;
}

function saveResults(result, rockSize, rockPosition, jumpDistanceStart, jumpDistanceStop, raceTime) {
    const postData = {
        result: result,
        rockSize: rockSize,
        rockPosition: rockPosition,
        jumpDistanceStart: jumpDistanceStart,
        jumpDistanceStop: jumpDistanceStop,
        raceTime: raceTime,
    }

    let xhr = new XMLHttpRequest();
    xhr.open("POST", '/save_results.php', true);

    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            console.log(xhr);
        }
    }

    xhr.send(serialize(postData));
}

function serialize(obj) {
    let str = [];
    for (let p in obj)
        if (obj.hasOwnProperty(p)) {
            str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
        }
    return str.join("&");
}
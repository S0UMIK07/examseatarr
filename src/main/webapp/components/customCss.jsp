<%-- 
    Document   : customCss
    Created on : Dec 25, 2023, 9:59:13 PM
    Author     : 91731
--%>

<style>
    .cshover {
  --color: #560bad;
  font-family: inherit;
  display: inline-block;
  width: 8em;
  height: 2.6em;
  line-height: 2.5em;
  margin: 20px;
  position: relative;
  overflow: hidden;
  border: 2px solid var(--color);
  transition: color 0.5s;
  z-index: 1;
  font-size: 17px;
  border-radius: 6px;
  font-weight: 500;
  color: var(--color);
}

.cshover:before {
  content: "";
  position: absolute;
  z-index: -1;
  background: var(--color);
  height: 150px;
  width: 200px;
  border-radius: 50%;
}

.cshover:hover {
  color: #fff;
}

.cshover:before {
  top: 100%;
  left: 100%;
  transition: all 0.7s;
}

.cshover:hover:before {
  top: -30px;
  left: -30px;
}

.cshover:active:before {
  background: #3a0ca3;
  transition: background 0s;
}
.ui-btn {
  cursor: pointer;
  border-radius: 5px;
  color: black;
  border-style: solid;
  background-color: transparent;
  border-color: black;
  width: 120px;
  height: 40px;
  transition: 0.2s ease;
  text-transform: uppercase;
  border-width: 2px;
  font-weight: 500;
  font-size: 18px;
  letter-spacing: 2px;
}
.ui-btn:hover {
  color: rgb(247, 247, 247);
  background-color: rgb(0, 81, 255);
  border-color: rgb(0, 81, 255);
  text-shadow: 0 0 50px white, 0 0 20px white, 0 0 15px white;
  box-shadow: 0 0 50px rgb(0, 81, 255), 0 0 30px rgb(0, 81, 255),
    0 0 60px rgb(0, 81, 255), 0 0 120px rgb(0, 81, 255);
  font-size: 20px;
  width: 130px;
  height: 50px;
  letter-spacing: 3px;
}
.ui-btn:active {
  width: 115px;
  height: 38px;
  letter-spacing: 0px;
}

.inputGroup {
  font-family: 'Segoe UI', sans-serif;
  margin: 1em 0 1em 0;
  max-width: 500px;
  position: relative;
}

.inputGroup input {
  font-size: 100%;
  padding: 0.8em;
  outline: none;
  border: 2px solid rgb(200, 200, 200);
  background-color: transparent;
  border-radius: 20px;
  width: 100%;
}

.inputGroup label {
  font-size: 100%;
  position: absolute;
  left: 0;
  padding: 0.8em;
  margin-left: 0.5em;
  pointer-events: none;
  transition: all 0.3s ease;
  color: rgb(100, 100, 100);
}

.inputGroup :is(input:focus, input:valid)~label {
  transform: translateY(-50%) scale(.9);
  margin: 0em;
  margin-left: 1.3em;
  padding: 0.4em;
  background-color: white;
}

.inputGroup :is(input:focus, input:valid) {
  border-color: rgb(150, 150, 200);
}



</style>

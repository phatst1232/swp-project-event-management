const firebaseConfig = {
    apiKey: "AIzaSyDXMTQmC5BL4PrjSzFZ6eggpbXp0drBGiw",
    authDomain: "swp-project-event-manage-b4865.firebaseapp.com",
    databaseURL: "https://swp-project-event-manage-b4865-default-rtdb.firebaseio.com/",
    projectId: "swp-project-event-manage-b4865",
    storageBucket: "swp-project-event-manage-b4865.appspot.com",
    messagingSenderId: "542073066796",
    appId: "1:542073066796:web:916c68c2ad83702ab8c889",
    measurementId: "G-34KP9247BN"
};
firebase.initializeApp(firebaseConfig);
var database = firebase.database();
var cmtRef = database.ref('content');
cmtRef.on("child_changed", function(snapshot) {
    var commentContent = snapshot.val();
    console.log(commentContent);
    document.getElementById("message").innerHTML = commentContent;
})
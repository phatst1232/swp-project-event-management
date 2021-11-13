document.getElementById('addcontent');

// có 2 cách để lắng nghe sự kiện (2 syntax)

// 1. 
//    document.getElementById('addcontent').onclick = function(){
//      console.log(123);  
//    };
    
// 2.
    document.getElementById('addcontent').addEventListener('click', function(){
      document.querySelector('.contentbox-modal').style.display = 'flex';
      document.querySelector('.contentbox-modal').style.backgroundColor  = 'rgba(0,0,0,0.2)'
    });
    
    document.querySelector('.close-btn').addEventListener('click', function(){
      document.querySelector('.contentbox-modal').style.display = 'none';
    });





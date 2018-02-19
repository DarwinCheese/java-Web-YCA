/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $(".circleLogo svg").click(function(){
       $("body").toggleClass("white-bg");
    });
    $("#myCanvas").click(function(){
       $("body").toggleClass("white-bg");
    });
    new Twitch.Embed("twitch-embed", {
        width: 854,
        height: 300,
        channel: "sodapoppin"
    });
});


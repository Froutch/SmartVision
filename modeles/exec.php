    <?php
    function execInBackground($path, $exe, $args = "") {
    global $conf;
     
    if (file_exists($path . $exe)) {
    chdir($path);
    if (substr(php_uname(), 0, 7) == "Windows"){
    pclose(popen("start \"bla\" \"" . $exe . "\" " . escapeshellarg($args), "r"));
    } else {
    exec("./" . $exe . " " . escapeshellarg($args) . " > /dev/null &");
    }
    }
    }
    ?>

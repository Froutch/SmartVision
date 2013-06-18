<?php

$stream = ssh2_exec($con, $command);

        stream_set_blocking($stream, true);
                $data2 = "";
            while ($buf = fread($stream,4096)) {
                $data2 .= $buf;
            }
            fclose($stream);
        echo $data2;



?>

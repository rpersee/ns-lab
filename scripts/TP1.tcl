set ns [new Simulator]
set nf [open out.nam w]
$ns trace-all $nf
$ns namtrace-all $nf

# Create four blue nodes
for {set i 0} {$i < 4} {incr i} {
    set n($i) [$ns node]
    $n($i) color blue
}

# Create the yellow node
set n4 [$ns node]
$n4 color yellow

# Create the red node
set n5 [$ns node]
$n5 color red

# Create four full-duplex links between the blue nodes and the yellow node
for {set i 0} {$i < 4} {incr i} {
    $ns duplex-link $n($i) $n4 10Mb 10ms DropTail
}

# Create the full-duplex link between the yellow and red nodes
$ns duplex-link $n4 $n5 1Mb 10ms RED
$ns queue-limit $n4 $n5 80

# Create four TCP agents, TCP sinks, and FTP applications
for {set i 0} {$i < 4} {incr i} {
    set tcp($i) [new Agent/TCP/RFC793edu]
    $tcp($i) set window_ 20
    $tcp($i) set packetSize_ 1000
    set sink($i) [new Agent/TCPSink]
    set ftp($i) [new Application/FTP]
    $ns attach-agent $n($i) $tcp($i)
    $ns attach-agent $n5 $sink($i)
    $ftp($i) attach-agent $tcp($i)
    $ns connect $tcp($i) $sink($i)
    $ns at 0.0 "$ftp($i) start"
}

proc finish {} {
    global ns nf
    $ns flush-trace
    close $nf
    exec nam out.nam &
    exit 0
}

$ns at 2.0 "finish"
$ns run

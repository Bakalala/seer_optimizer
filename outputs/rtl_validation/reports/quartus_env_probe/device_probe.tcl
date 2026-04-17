puts "FAMILY_LIST_BEGIN"
if {[catch {get_family_list} families]} {
    puts "FAMILY_LIST_ERROR $families"
} else {
    foreach family $families {
        puts $family
    }
}
puts "FAMILY_LIST_END"
puts "ARRIA10_PART_LIST_BEGIN"
if {[catch {get_part_list -family "Arria 10"} parts]} {
    puts "ARRIA10_PART_LIST_ERROR $parts"
} else {
    foreach part $parts {
        puts $part
    }
}
puts "ARRIA10_PART_LIST_END"

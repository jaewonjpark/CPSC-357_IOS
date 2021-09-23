import UIKit

func waitingTime(firstHour: Int, firstMinute: Int, secondHour: Int, secondMinute: Int){

    var time = 0
    var minute = 0
    
    if firstMinute > secondMinute{
        minute = secondMinute + 60 - firstMinute
        time = secondHour - firstHour - 1
    }
    
    else if firstMinute < secondMinute{
        time = secondHour - firstHour
        minute = secondMinute - firstMinute
    }
    
    else if firstMinute == secondMinute{
        time = secondHour - firstHour
        minute = secondMinute - firstMinute
    }
        
    print("You should wait: " + String(time) + ":" + String(minute))

}

// Should give me 1:45 (when firstMin > secondMin)
waitingTime(firstHour: 11, firstMinute: 30, secondHour: 13, secondMinute: 15)

// Should give me 0:05 (when firstMin < secondMin)
waitingTime(firstHour: 11, firstMinute: 30, secondHour: 11, secondMinute: 35)

// Should give me 2:00 (when firstMin == secondMin)
waitingTime(firstHour: 11, firstMinute: 30, secondHour: 13, secondMinute: 30)


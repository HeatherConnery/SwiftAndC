//
//  ViewController.swift
//  SwiftAndC
//
//  Created by Heather Connery on 2015-12-08.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var numbers = [12,45,5,23,7,2,25,456]
    var myStrings = ["HELLO","hello","WORLD","world"]

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(numbers)
        // swift built in sort:
        //print(numbers.sort())
        
        //print(quickSort(&numbers))
        //print(quickSortString(&myStrings))
        quickSortGeneric(numbers)
    }
    
    func quickSortGeneric<A:Comparable>(var input:[A]) -> [A] {
        qsort_b(&input, input.count, sizeof(A)) { (lhs, rhs) -> Int32 in
            let left:A = UnsafePointer(lhs).memory
            let right:A = UnsafePointer(rhs).memory
            
            if left < right {return -1}
            if left == right {return 1}
            return 1
        }
        print(input)
        return input
    }
    
    func quickSort(inout input:[Int]) -> ([Int]) {
        
        qsort(&input, input.count, sizeof(Int)) { (lhs, rhs) -> Int32 in
            // do our magic
            // casting in C language:
            //let left: UnsafePointer<Int> = UnsafePointer(lhs)
            let left:Int = UnsafePointer(lhs).memory
            let right:Int = UnsafePointer(rhs).memory
            
            if left < right {
                return -1
            }
            if left == right {
                return 0
            }
            return 1
        }
        //print(input)
        return input
    }
    
    func quickSortString(inout input:[String]) -> ([String]) {
        
        qsort(&input, input.count, sizeof(String)) { (lhs, rhs) -> Int32 in
            // do our magic
            // casting in C language:
            
            let left:String = UnsafePointer(lhs).memory
            let right:String = UnsafePointer(rhs).memory
            
            if left < right {
                return -1
            }
            if left == right {
                return 1 // or 0
            }
            return 1
        }
        // print(input)
        return input
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


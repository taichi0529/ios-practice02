//
//  GCDViewController.swift
//  practice02
//
//  Created by 中村太一 on 2017/11/21.
//  Copyright © 2017年 Asaichi LLC. All rights reserved.
//

import UIKit


/// GCDの練習用クラス
/// 下記参照
/// https://developer.apple.com/jp/documentation/ConcurrencyProgrammingGuide.pdf
/// https://dev.classmethod.jp/smartphone/iphone/swift-3-how-to-use-gcd-api-1/
class GCDViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func serialButtonDIdTouch(_ sender: Any) {
        let start = NSDate()
        var result:Int = 0
        
        let queueGroup = DispatchGroup()
        let queue1 = DispatchQueue(label: "queue1")
        
        // 非同期にしないとラベルが更新されない。
        DispatchQueue.main.async() {
            self.answerLabel.text = "計算中..."
            self.resultLabel.text = "計算結果"
        }
        
        // キューとグループを紐付ける
        queue1.async(group: queueGroup) {
            //フィボナッチの計算を2回直列で行う
            result += self.fib(40)
            result += self.fib(40)
        }
        
        // タスクが全て完了したらメインスレッド上で処理を実行する
        queueGroup.notify(queue: DispatchQueue.main) {
            let elapsed = NSDate().timeIntervalSince(start as Date)
            self.answerLabel.text = String(elapsed) + "秒"
            self.resultLabel.text = String(result)
        }
        
        // 上記やっていることは下記と同じだが「実行中...」が非同期でないと表示されないので上記の様になっている。
//        result += fib(40)
//        result += fib(40)
//        let elapsed = NSDate().timeIntervalSince(start as Date)
//        self.answerLabel.text = String(elapsed) + "秒"
//        self.resultLabel.text = String(result)
    }
    @IBAction func conurrentButonDidTouch(_ sender: Any) {
        let start = NSDate()
        var result:Int = 0
        
        let queueGroup = DispatchGroup()
        let queue1 = DispatchQueue(label: "queue1")
        let queue2 = DispatchQueue(label: "queue2")
        
        // 非同期にしないとラベルが更新されない。
        DispatchQueue.main.async() {
            self.answerLabel.text = "計算中..."
            self.resultLabel.text = "計算結果"
        }
        
        // キューとグループにしている
        //フィボナッチの計算を2回非同期（並列）で行う
        queue1.async(group: queueGroup) {
            result += self.fib(40)
        }
        queue2.async(group: queueGroup) {
            result += self.fib(40)
        }
        
        // タスクが全て完了したらメインスレッド上で処理を実行する
        queueGroup.notify(queue: DispatchQueue.main) {
            let elapsed = NSDate().timeIntervalSince(start as Date)
            self.answerLabel.text = String(elapsed) + "秒"
            self.resultLabel.text = String(result)
        }
    }

    /// フィボナッチ数列
    ///
    /// - Parameter n:
    /// - Returns:
    func fib(_ n: Int) -> Int {
        return n < 2 ? n : fib(n - 1)  + fib(n - 2)
    }

}

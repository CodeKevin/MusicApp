//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by Kevin on 2017/8/22.
//  Copyright © 2017年 Kevin. All rights reserved.
//

import UIKit
import KDEAudioPlayer
class PlayerViewController: BaseViewController {
    public static let shared = PlayerViewController()
    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var songImg: UIImageView!
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var vcBackImg: UIImageView!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var needlImg: UIImageView!
    let player = AudioPlayer()
    var dataSource = [TracksModel]()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        backImg.clipsToBounds = true
        backImg.layer.cornerRadius = 135.0
        coverImg.clipsToBounds = true
        coverImg.layer.cornerRadius = 135.0
        songImg.clipsToBounds = true
        songImg.layer.cornerRadius = 85.0
        player.delegate = self
        needlImg.layer.anchorPoint = CGPoint(x: 0.28, y: 0.16)
        // Do any additional setup after loading the view.
    }
    func playMusicWith(_ list:[TracksModel], _ index: Int) -> Void {
        dataSource = list
        currentIndex = index
        var itemArr = [AudioItem]()
        for song in list {
            let item = AudioItem(mediumQualitySoundURL: URL(string: song.filename!))
            itemArr.append(item!)
        }
        player.play(items: itemArr, startAtIndex: currentIndex)
        playAnimation()
    }
    func playAnimation() {
        let baseAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        baseAnimation.fromValue = 0
        baseAnimation.toValue = Double.pi * 2
        baseAnimation.duration = 16
        baseAnimation.repeatCount = MAXFLOAT
        songImg.layer.add(baseAnimation, forKey: "playMusic")
        UIView.animate(withDuration: 0.5) {
            self.needlImg.transform = .identity
        }
    }
    func continueAnimation() {
        let pauseTime = songImg.layer.timeOffset
        songImg.layer.speed = 1.0
        songImg.layer.timeOffset = 0.0
        songImg.layer.beginTime = 0.0
        let sinceTime = songImg.layer.convertTime(CACurrentMediaTime(), from: nil) - pauseTime
        songImg.layer.beginTime = sinceTime
        UIView.animate(withDuration: 0.5) {
            self.needlImg.transform = .identity
        }
    }
    func stopAnimation() {
        let pauseTime = songImg.layer.convertTime(CACurrentMediaTime(), from: nil)
        songImg.layer.speed = 0.0
        songImg.layer.timeOffset = pauseTime
        UIView.animate(withDuration: 0.5) {
            self.needlImg.transform = CGAffineTransform(rotationAngle: -CGFloat(Double.pi / 6))
        }
    }
    @IBAction func pauseAction(_ sender: Any) {
        if player.state == .playing {
            player.pause()
            stopAnimation()
        }else if player.state == .paused {
            player.resume()
            continueAnimation()
        }
    }
    @IBAction func nextAction(_ sender: Any) {
        player.next()
    }
    @IBAction func previousAction(_ sender: Any) {
        player.previous()
    }
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PlayerViewController: AudioPlayerDelegate {
    func audioPlayer(_ audioPlayer: AudioPlayer, didChangeStateFrom from: AudioPlayerState, to state: AudioPlayerState) {
        if state == .playing || state == .buffering {
            pauseBtn.setImage(UIImage(named: "cm2_vehicle_btn_pause_prs"), for: .normal)
        }else {
            pauseBtn.setImage(UIImage(named: "cm2_vehicle_btn_play_prs"), for: .normal)
        }
    }
    func audioPlayer(_ audioPlayer: AudioPlayer, willStartPlaying item: AudioItem) {
        currentIndex = audioPlayer.currentItemIndexInQueue!
        let song = self.dataSource[currentIndex]
        nameLabel.text = song.songname
        let url = URL(string: song.songphoto!)
        songImg.kf.setImage(with: url)
        UIView.animate(withDuration: 0.25, animations: { 
            self.vcBackImg.alpha = 0.0
        }) { (isComplete) in
            if isComplete {
                UIView.animate(withDuration: 0.25, animations: { 
                    self.vcBackImg.alpha = 1.0
                    self.vcBackImg.kf.setImage(with: url)
                })
            }
        }
    }
}

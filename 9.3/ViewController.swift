//
//  ViewController.swift
//  9.3
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 2016110409. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollView1: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named:"1"))
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size
        scrollView.minimumZoomScale = 0.2
        scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        
        for i in 1...7{
            let imageView = UIImageView(image: UIImage(named:"\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1)*scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
            scrollView1.addSubview(imageView)
            scrollView1.isPagingEnabled = true
        }
        
        scrollView1.contentSize = CGSize(width: 7 * scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.delegate = self
        
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = true
        scrollView1.showsHorizontalScrollIndicator = false
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return  scrollView.subviews.first
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView1.contentOffset.x / scrollView1.bounds.width)
    }
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage)*scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.scrollRectToVisible(rect, animated: true)
    }
}


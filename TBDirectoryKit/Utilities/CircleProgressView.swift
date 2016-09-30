//
//  CircleProgressView.swift
//
//
//  Created by Eric Rolf on 8/11/14.
//  Copyright (c) 2014 Eric Rolf, Cardinal Solutions Group. All rights reserved.
//

import UIKit


@objc @IBDesignable open class CircleProgressView: UIView {

    internal struct Constants {
        let circleDegress = 360.0
        let minimumValue = 0.000001
        let maximumValue = 0.999999
        let ninetyDegrees = 90.0
        let twoSeventyDegrees = 270.0
        var contentView:UIView = UIView()
    }

    let constants = Constants()
    fileprivate var internalProgress:Double = 0.0

    @IBInspectable open var progress: Double = 0.000001 {
        didSet {
            internalProgress = progress
            setNeedsDisplay()
        }
    }

    @IBInspectable open var clockwise: Bool = true {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open var trackWidth: CGFloat = 10 {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open var trackImage: UIImage? {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open dynamic var trackBackgroundColor: UIColor = UIColor.gray {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open dynamic var trackFillColor: UIColor = UIColor.blue {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open dynamic var trackBorderColor:UIColor = UIColor.clear {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open var trackBorderWidth: CGFloat = 0 {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open dynamic var centerFillColor: UIColor = UIColor.white {
        didSet { setNeedsDisplay() }
    }
    
    @IBInspectable open var centerImage: UIImage? {
        didSet { setNeedsDisplay() }
    }

    @IBInspectable open var contentView: UIView {
        return self.constants.contentView
    }

    required override public init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contentView)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(contentView)
    }

    override open func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        let innerRect = rect.insetBy(dx: trackBorderWidth, dy: trackBorderWidth)
        
        internalProgress = (internalProgress/1.0) == 0.0 ? constants.minimumValue : progress
        internalProgress = (internalProgress/1.0) == 1.0 ? constants.maximumValue : internalProgress
        internalProgress = clockwise ?
                                (-constants.twoSeventyDegrees + ((1.0 - internalProgress) * constants.circleDegress)) :
                                (constants.ninetyDegrees - ((1.0 - internalProgress) * constants.circleDegress))
        
        let context = UIGraphicsGetCurrentContext()
        
        // background Drawing
        trackBackgroundColor.setFill()
        let circlePath = UIBezierPath(ovalIn: CGRect(x: innerRect.minX, y: innerRect.minY, width: innerRect.width, height: innerRect.height))
        circlePath.fill();
        
        if trackBorderWidth > 0 {
            circlePath.lineWidth = trackBorderWidth
            trackBorderColor.setStroke()
            circlePath.stroke()
        }
        
        // progress Drawing
        let progressPath = UIBezierPath()
        let progressRect: CGRect = CGRect(x: innerRect.minX, y: innerRect.minY, width: innerRect.width, height: innerRect.height)
        let center = CGPoint(x: progressRect.midX, y: progressRect.midY)
        let radius = progressRect.width / 2.0
        let startAngle:CGFloat = clockwise ? CGFloat(-internalProgress * M_PI / 180.0) : CGFloat(constants.twoSeventyDegrees * M_PI / 180)
        let endAngle:CGFloat = clockwise ? CGFloat(constants.twoSeventyDegrees * M_PI / 180) : CGFloat(-internalProgress * M_PI / 180.0)
        
        progressPath.addArc(withCenter: center, radius:radius, startAngle:startAngle, endAngle:endAngle, clockwise:!clockwise)
        progressPath.addLine(to: CGPoint(x: progressRect.midX, y: progressRect.midY))
        progressPath.close()
        
        context?.saveGState()
        
        progressPath.addClip()
        
        if trackImage != nil {
            trackImage!.draw(in: innerRect)
        } else {
            trackFillColor.setFill()
            circlePath.fill()
        }
        
        context?.restoreGState()
        
        // center Drawing
        let centerPath = UIBezierPath(ovalIn: CGRect(x: innerRect.minX + trackWidth, y: innerRect.minY + trackWidth, width: innerRect.width - (2 * trackWidth), height: innerRect.height - (2 * trackWidth)))
        centerFillColor.setFill()
        centerPath.fill()
        
        if let centerImage = centerImage {
            context?.saveGState()
            centerPath.addClip()
            centerImage.draw(in: rect)
            context?.restoreGState()
        } else {
            let layer = CAShapeLayer()
            layer.path = centerPath.cgPath
            contentView.layer.mask = layer
        }
    }
}

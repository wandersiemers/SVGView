//
//  Utils.swift
//  SVGView
//
//  Created by Alisa Mylnikova on 20/07/2020.
//

import SwiftUI

class Utils {

    static func degreesToRadians(_ degrees: CGFloat) -> CGFloat {
        return degrees * .pi / 180
    }

}

extension String {

    var cgFloatValue: CGFloat? {
        if let value = Double(self) {
            return CGFloat(value)
        }
        return .none
    }
}

extension Dictionary {

    static func +(dict1: Dictionary, dict2: Dictionary) -> Dictionary {
        dict1.reduce(into: dict2) { (r, e) in r[e.0] = e.1 }
    }
}

extension CGAffineTransform {

    func shear(shx: CGFloat = 0, shy: CGFloat = 0) -> CGAffineTransform {
        return CGAffineTransform(a: a + c * shy, b: b + d * shy,
                                 c: a * shx + c, d: b * shx + d, tx: tx, ty: ty)
    }

}

extension Shape {

    func applySVGStroke(stroke: SVGStroke?, eoFill: Bool = false) -> some View {
        let result = eoFill
            ? AnyView(self.fill(style: FillStyle(eoFill: true, antialiased: true)))
            : AnyView(self)
        if let stroke = stroke {
            return AnyView(result.overlay(self.stroke(stroke.fill.toSwiftUI(), style: stroke.toSwiftUI())))
        }
        return result
    }

}

extension View {

    func applyShapeAttributes(model: SVGShape) -> some View {
        apply(paint: model.fill).applyNodeAttributes(model: model)
    }

    func applyNodeAttributes(model: SVGNode) -> some View {
        self.opacity(model.opacity)
            .applyMask(mask: model.clip, absoluteNode: model)
            .transformEffect(model.transform)
            .onTapGesture {
                model.onTap()
            }
    }

}

extension View {

    func applyMask(mask: SVGNode?, absoluteNode: SVGNode) -> some View {
        guard let mask = mask as? SVGUserSpaceNode else {
            return AnyView(self)
        }
        return AnyView(self.mask(mask.toSwiftUI(absoluteNode: absoluteNode)))
    }

}

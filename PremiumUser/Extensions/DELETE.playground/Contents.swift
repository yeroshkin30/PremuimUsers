import UIKit

import PlaygroundSupport


let stackview = UIStackView(frame: CGRect(x: 0, y: 0, width: 500, height: 150))
stackview.backgroundColor = .white
let colours: [UIColor] = [
    .blue,
    .green,
    .red,
    .yellow,
    .orange
]

for i in 0...4 {

    let view = UIView(frame: CGRect.zero)
    view.backgroundColor = colours[i]
    view.translatesAutoresizingMaskIntoConstraints = false

    if i == 2 {
        view.heightAnchor.constraint(equalToConstant: 150).isActive = true
        view.widthAnchor.constraint(equalToConstant: 30).isActive = true
    } else {
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 75)
    }

    stackview.addArrangedSubview(view)
}

stackview.axis  = .horizontal
stackview.distribution = .fillEqually
stackview.alignment = .bottom
stackview.spacing = 0.5

PlaygroundPage.current.liveView = stackview

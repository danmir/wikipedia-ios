class TextFormattingTableViewCell: UITableViewCell {
    let topSeparator = UIView()
    let bottomSeparator = UIView()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSeparator()
        configureSeparator()
    }

    private func addSeparator() {
        topSeparator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(topSeparator)
    }

    private func configureSeparator() {
        let topSeparatorHeightConstraint = topSeparator.heightAnchor.constraint(equalToConstant: 1)
        let topSeparatorTopConstraint = topSeparator.topAnchor.constraint(equalTo: contentView.topAnchor)
        let topSeparatorLeadingConstraint = topSeparator.leadingAnchor.constraint(equalTo: leadingAnchor)
        let topSeparatorTrailingConstraint = topSeparator.trailingAnchor.constraint(equalTo: trailingAnchor)

        NSLayoutConstraint.activate([
            topSeparatorHeightConstraint,
            topSeparatorTopConstraint,
            topSeparatorLeadingConstraint,
            topSeparatorTrailingConstraint
        ])
    }

    @IBInspectable var isTopSeparatorHidden: Bool = false {
        didSet {
            topSeparator.isHidden = isTopSeparatorHidden
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateFonts()
    }

    open func updateFonts() {

    }
}

extension TextFormattingTableViewCell: Themeable {
    func apply(theme: Theme) {
        topSeparator.backgroundColor = theme.colors.border
    }
}

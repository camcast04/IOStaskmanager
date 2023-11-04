import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!

    var onCompleteButtonTapped: ((Task) -> Void)?

    var task: Task?

    @IBAction func didTapCompleteButton(_ sender: UIButton) {
        // We check if we have a task
        guard var task = task else { return } // 'var' makes a mutable copy of task
        task.isComplete = !task.isComplete // Modify the mutable copy
        update(with: task) // Update the cell's UI with the modified task
        onCompleteButtonTapped?(task) // Call the completion handler with the modified task
    }

    func configure(with task: Task, onCompleteButtonTapped: ((Task) -> Void)?) {
        self.task = task
        self.onCompleteButtonTapped = onCompleteButtonTapped
        update(with: task)
    }

    private func update(with task: Task) {
        titleLabel.text = task.title
        noteLabel.text = task.note
        noteLabel.isHidden = task.note?.isEmpty ?? true
        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
        completeButton.isSelected = task.isComplete
        completeButton.tintColor = task.isComplete ? .systemBlue : .tertiaryLabel
    }

    override func setSelected(_ selected: Bool, animated: Bool) { }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
}

import './TodoFooter.css';

export const TodoFooter = ({ activeCount, hasCompleted, onClearCompleted }) => {
  return (
    <div className="todo-footer">
      <span className="todo-count">
        {activeCount} {activeCount === 1 ? 'item' : 'items'} left
      </span>
      {hasCompleted && (
        <button
          onClick={onClearCompleted}
          className="clear-completed-button"
        >
          Clear completed
        </button>
      )}
    </div>
  );
};

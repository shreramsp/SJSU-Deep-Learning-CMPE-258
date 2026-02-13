import { FILTERS } from '../utils/constants';
import './TodoFilters.css';

export const TodoFilters = ({ currentFilter, onFilterChange }) => {
  return (
    <div className="todo-filters">
      {Object.values(FILTERS).map(filter => (
        <button
          key={filter}
          className={`filter-button ${currentFilter === filter ? 'active' : ''}`}
          onClick={() => onFilterChange(filter)}
        >
          {filter.charAt(0).toUpperCase() + filter.slice(1)}
        </button>
      ))}
    </div>
  );
};

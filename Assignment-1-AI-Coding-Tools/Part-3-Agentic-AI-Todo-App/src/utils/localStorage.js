import { STORAGE_KEY } from './constants';

export const loadTodos = () => {
  try {
    const data = localStorage.getItem(STORAGE_KEY);
    if (!data) return [];

    const parsed = JSON.parse(data);

    // Validate structure
    if (!Array.isArray(parsed)) return [];

    // Validate each todo
    return parsed.filter(todo =>
      todo.id &&
      typeof todo.text === 'string' &&
      typeof todo.completed === 'boolean'
    );
  } catch (error) {
    console.error('Failed to load todos:', error);
    return [];
  }
};

export const saveTodos = (todos) => {
  try {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(todos));
  } catch (error) {
    console.error('Failed to save todos:', error);
    // Handle quota exceeded
    if (error.name === 'QuotaExceededError') {
      alert('Storage quota exceeded. Please delete some todos.');
    }
  }
};

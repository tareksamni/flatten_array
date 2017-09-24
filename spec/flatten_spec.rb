require_relative '../flatten'

RSpec.describe Array, "#my_flatten" do
  context 'with empty array' do
    let (:array) { [] }
    it 'return empty array' do
      expect(array.flatten).to eq []
    end
  end

  context 'with empty nested arrays' do
    let (:array) { [[[[[[[[[]]]]]]]], []] }
    it 'return empty array' do
      expect(array.flatten).to eq []
    end
  end

  context 'with 1 item array' do
    let (:array) { [1] }
    it 'returns the same array with the same single item' do
      expect(array.flatten).to eq [1]
    end
  end

  context 'flat array' do
    let (:array) { [1, 2, 3] }
    it 'returns the same array' do
      expect(array.flatten).to eq [1, 2, 3]
    end
  end

  context 'with first nested array' do
    let (:array) { [[1, 1], 2, 3, 4, 5, 6] }
    it 'flattens the array' do
      expect(array.flatten).to eq [1, 1, 2, 3, 4, 5, 6]
    end
  end

  context 'with last nested array' do
    let (:array) { [1, 2, 3, 4, 5, [6, 6]] }
    it 'flattens the array' do
      expect(array.flatten).to eq [1, 2, 3, 4, 5, 6, 6]
    end
  end

  context 'with nested arrays' do
    let (:array) { [[1, 1, 1, []], 2, 3, [4, []], [5, 10, 11], [6, [7, 8]]] }
    it 'flattens the array' do
      expect(array.flatten).to eq [1, 1, 1, 2, 3, 4, 5, 10, 11, 6, 7, 8]
    end
  end
end
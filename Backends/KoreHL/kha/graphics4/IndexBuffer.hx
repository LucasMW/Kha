package kha.graphics4;

import haxe.io.Bytes;
import haxe.io.BytesData;

class IndexBuffer {
	public var _buffer: Pointer;
	public var _data: kha.arrays.Uint32Array;
	private var myCount: Int;
	
	public function new(indexCount: Int, usage: Usage, canRead: Bool = false) {
		myCount = indexCount;
		_data = new kha.arrays.Uint32Array(myCount);
		init(indexCount);
	}
	
	private function init(count: Int) {
		_buffer = kore_create_indexbuffer(count);
	}

	public function delete() {
		
	}
	
	public function lock(): kha.arrays.Uint32Array {
		return _data;
	}
	
	public function unlock(): Void {
		var bytes = Bytes.ofData(new BytesData(kore_indexbuffer_lock(_buffer), myCount * 4));
		for (i in 0...myCount) {
			bytes.setInt32(i * 4, _data[i]);
		}
		kore_indexbuffer_unlock(_buffer);
	}
	
	public function count(): Int {
		return myCount;
	}
	
	@:hlNative("std", "kore_create_indexbuffer") static function kore_create_indexbuffer(count: Int): Pointer { return null; }
	@:hlNative("std", "kore_indexbuffer_lock") static function kore_indexbuffer_lock(buffer: Pointer): hl.Bytes { return null; }
	@:hlNative("std", "kore_indexbuffer_unlock") static function kore_indexbuffer_unlock(buffer: Pointer): Void { }
}

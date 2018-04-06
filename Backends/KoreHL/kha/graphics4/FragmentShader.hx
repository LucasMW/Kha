package kha.graphics4;

import haxe.io.Bytes;
import kha.Blob;

class FragmentShader {
	public var _shader: Pointer;
	
	public function new(sources: Array<Blob>, files: Array<String>) {
		initFragmentShader(sources[0]);
	}
	
	private function initFragmentShader(source: Blob): Void {
		_shader = kore_create_fragmentshader(source.bytes.getData(), source.bytes.getData().length); 
	}

	public static function fromSource(source: String): FragmentShader {
		return null;
	}
	
	public function unused(): Void {
		var include: Bytes = Bytes.ofString("");
	}
	
	@:hlNative("std", "kore_create_fragmentshader") static function kore_create_fragmentshader(data: hl.Bytes, length: Int): Pointer { return null; }
}

package kha.graphics4;

import haxe.io.Bytes;
import kha.Blob;

@:headerCode('
#include <Kore/pch.h>
#include <Kore/Graphics4/Graphics.h>
')

@:headerClassCode("Kore::Graphics4::Shader* shader;")
class TessellationEvaluationShader {
	public function new(sources: Array<Blob>, files: Array<String>) {
		init(sources[0], files[0]);
	}
	
	private function init(source: Blob, file: String): Void {
		untyped __cpp__('shader = new Kore::Graphics4::Shader(source->bytes->b->Pointer(), source->get_length(), Kore::Graphics4::TessellationEvaluationShader);');
	}
	
	public function delete(): Void {
		untyped __cpp__('delete shader; shader = nullptr;');
	}

	function _forceInclude(): Void {
		Bytes.alloc(0);
	}
}

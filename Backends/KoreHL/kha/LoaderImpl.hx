package kha;

import kha.Blob;
import haxe.io.Bytes;
import kha.Kravur;
import sys.io.File;

class LoaderImpl {
	public static function loadSoundFromDescription(desc: Dynamic, done: kha.Sound -> Void) {
		done(new kha.korehl.Sound(desc.files[0]));
	}
	
	public static function getSoundFormats(): Array<String> {
		return ["wav", "ogg"];
	}
	
	public static function loadImageFromDescription(desc: Dynamic, done: kha.Image -> Void) {
		var readable = Reflect.hasField(desc, "readable") ? desc.readable : false;
		done(kha.Image.fromFile(desc.files[0], readable));
	}
	
	public static function getImageFormats(): Array<String> {
		return ["png", "jpg", "hdr"];
	}
	
	public static function loadBlobFromDescription(desc: Dynamic, done: Blob -> Void) {
		done(new Blob(File.getBytes(desc.files[0])));
	}
	
	public static function loadFontFromDescription(desc: Dynamic, done: Font -> Void): Void {
		loadBlobFromDescription(desc, function (blob: Blob) {
			done(new Kravur(blob));
		});
	}
	
	public static function loadVideoFromDescription(desc: Dynamic, done: Video -> Void) {
		done(null); //new kha.kore.Video(desc.files[0]));
	}
	
	// @:functionCode('return ::String(Kore::System::videoFormats()[0]);')
	private static function videoFormat(): String {
		return "";
	}
	
	public static function getVideoFormats(): Array<String> {
		return [videoFormat()];
	}
}

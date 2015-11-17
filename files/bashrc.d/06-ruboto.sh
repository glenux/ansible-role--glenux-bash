export PATH
export ANDROID_HOME

if [ -d "$HOME/android-sdk-linux" ]; then
	PATH="$HOME/android-sdk-linux/build-tools/19.1.0:$PATH"
	PATH="$HOME/android-sdk-linux/tools:$PATH"
	ANDROID_HOME="$HOME/android-sdk-linux/"
fi

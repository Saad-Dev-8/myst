#!/bin/sh
# Smoke test for st. Fails on first error.
set -eu
cd "$(dirname "$0")/.."

echo "==> clean build (must be warning-free)"
make clean >/dev/null
build_log=$(make 2>&1)
printf '%s\n' "$build_log"
warnings=$(printf '%s\n' "$build_log" | grep -ci "warning" || true)
if [ "$warnings" -ne 0 ]; then
	echo "FAIL: $warnings warning(s) in default build"
	exit 1
fi
[ -x ./st ] || { echo "FAIL: ./st not built"; exit 1; }
echo "OK: built ./st"

echo "==> version flag"
./st -v 2>&1 | grep -q "0.9.3" && echo "OK: version output" || {
	echo "FAIL: ./st -v did not report 0.9.3"
	./st -v 2>&1 || true
	exit 1
}

echo "==> terminfo source compiles"
if command -v tic >/dev/null 2>&1; then
	rm -rf /tmp/st-terminfo-smoke
	mkdir -p /tmp/st-terminfo-smoke
	tic -sx -o /tmp/st-terminfo-smoke st.info && echo "OK: st.info"
else
	echo "SKIP: tic not installed"
fi

echo "PASS"

module github.com/conejoninja/badger2040

go 1.22

require (
	github.com/makeworld-the-better-one/dither/v2 v2.4.0
	github.com/nfnt/resize v0.0.0-20180221191011-83c6a9932646
	github.com/skip2/go-qrcode v0.0.0-20200617195104-da1b6568686e
	golang.org/toolchain v0.0.1-go1.9rc2.windows-amd64
	tinygo.org/x/drivers v0.28.0
	tinygo.org/x/tinydraw v0.4.0
	tinygo.org/x/tinyfont v0.4.0
)

require github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510 // indirect

// replace tinygo.org/x/drivers => github.com/conejoninja/drivers v0.0.0-20240515082542-5f2645f5444d
replace tinygo.org/x/drivers => ../drivers

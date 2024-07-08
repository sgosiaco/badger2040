package main

import (
	"encoding/base64"
	"flag"
	"image/color"
	"image/png"
	"log"
	"os"

	"golang.org/toolchain/src/fmt"

	dither "github.com/makeworld-the-better-one/dither/v2"
	"github.com/nfnt/resize"
)

func main() {
	filepath := flag.String("filepath", "", "Fullpath of the image, only when -conf=custom")
	flag.Parse()

	if *filepath == "" {
		fmt.Println("-filepath can not be empty if -conf=custom")
		return
	}

	file, _ := os.Open(*filepath)
	img, err := png.Decode(file)
	if err != nil {
		log.Fatal("failed to decode image file", err)
	}

	// resize to be right size
	// import that dimensions are correct otherwise will be wrong
	// !! the draw buffer call has display.DrawBuffer(0, 0, 128, 120, []uint8(profileImg))
	// but we need to reverse the x and y b/c the screen rotation
	img = resize.Resize(120, 128, img, resize.Lanczos3)
	palette := []color.Color{
		color.Black,
		color.White,
		// You can put any colors you want
	}

	// Create ditherer
	d := dither.NewDitherer(palette)
	d.Matrix = dither.FloydSteinberg

	// Dither the image, attempting to modify the existing image
	// If it can't then a dithered copy will be returned.
	img = d.Dither(img)

	f2, err := os.Create("dither.png")
	if err != nil {
		panic(err)
	}

	err = png.Encode(f2, img)
	if err != nil {
		panic(err)
	}

	buffer := make([]uint8, int(img.Bounds().Max.Y)*int(img.Bounds().Max.X)/8)
	bbb := 0
	for x := 0; x < img.Bounds().Max.X; x++ {
		for y := 0; y < (img.Bounds().Max.Y / 8); y++ {
			var buf uint8
			for i := uint8(0); i < 8; i++ {
				r, g, b, _ := img.At(img.Bounds().Max.X-x-1, (y*8)+int(i)).RGBA()
				if r == 0 && g == 0 && b == 0 {
					buf |= 1 << (7 - i)
				} else {
					buf &^= 1 << i % 8
				}
			}
			buffer[bbb] = buf
			bbb++
		}
	}

	fmt.Printf("var kobayashi = []uint8{")
	for b := 0; b < len(buffer); b++ {
		fmt.Printf("0x%X,", buffer[b])
	}
	fmt.Printf("}\n")

	f, err := os.Create("out.txt")
	if err != nil {
		panic(err)
	}
	defer f.Close()
	w := base64.NewEncoder(base64.StdEncoding, f)
	defer w.Close()
	w.Write(buffer)
}

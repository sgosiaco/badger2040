package main

import (
	"image/color"
	"machine"
	"time"

	"tinygo.org/x/drivers/pcf85063"
	"tinygo.org/x/drivers/uc8151"
)

var display uc8151.Device
var clock pcf85063.Device
var btnA, btnB, btnC, btnUp, btnDown machine.Pin

var black = color.RGBA{1, 1, 1, 255}
var white = color.RGBA{0, 0, 0, 255}

const WIDTH = 296
const HEIGHT = 128

func main() {
	model := NewModel()

	led3v3 := machine.ENABLE_3V3
	led3v3.Configure(machine.PinConfig{Mode: machine.PinOutput})
	led3v3.High()

	machine.SPI0.Configure(machine.SPIConfig{
		Frequency: 12000000,
		SCK:       machine.EPD_SCK_PIN,
		SDO:       machine.EPD_SDO_PIN,
	})

	display = uc8151.New(machine.SPI0, machine.EPD_CS_PIN, machine.EPD_DC_PIN, machine.EPD_RESET_PIN, machine.EPD_BUSY_PIN)
	display.Configure(uc8151.Config{
		Rotation:    uc8151.ROTATION_270,
		Speed:       uc8151.MEDIUM,
		Blocking:    true,
		FlickerFree: false,
		UpdateAfter: 0,
	})

	machine.I2C0.Configure(machine.I2CConfig{
		Frequency: pcf85063.I2C_SPEED_STANDARD,
		SDA:       machine.I2C0_SDA_PIN,
		SCL:       machine.I2C0_SCL_PIN,
		Mode:      machine.I2CModeController,
	})

	clock = pcf85063.New(machine.I2C0)
	clock.Reset()
	clock.SetTime(time.Date(2024, 07, 11, 3, 30, 0, 0, time.UTC))

	btnA = machine.BUTTON_A
	btnB = machine.BUTTON_B
	btnC = machine.BUTTON_C
	btnUp = machine.BUTTON_UP
	btnDown = machine.BUTTON_DOWN
	btnA.Configure(machine.PinConfig{Mode: machine.PinInputPulldown})
	btnB.Configure(machine.PinConfig{Mode: machine.PinInputPulldown})
	btnC.Configure(machine.PinConfig{Mode: machine.PinInputPulldown})
	btnUp.Configure(machine.PinConfig{Mode: machine.PinInputPulldown})
	btnDown.Configure(machine.PinConfig{Mode: machine.PinInputPulldown})

	pressChan := make(chan Buttons, 1) // 5 works ok but can ghost
	createInterrupt(btnA, A, pressChan)
	createInterrupt(btnB, B, pressChan)
	createInterrupt(btnC, C, pressChan)
	createInterrupt(btnUp, UP, pressChan)
	createInterrupt(btnDown, DOWN, pressChan)

	display.ClearBuffer()
	display.Display()
	setCustomData()

	tainigoLogo()
	time.Sleep(1 * time.Second)

	for {
		select {
		case pressed := <-pressChan:
			model.Transition(pressed)
		default:
		}

		model.View()
		//time.Sleep(time.Millisecond)
	}
}

func createInterrupt(pin machine.Pin, button Buttons, pressChan chan<- Buttons) {
	pin.SetInterrupt(machine.PinRising, func(p machine.Pin) {
		if p.Get() {
			select {
			case pressChan <- button:
			default:
			}
		}
	})
}

package main

import (
	"time"

	"tinygo.org/x/drivers"
	"tinygo.org/x/tinydraw"
	"tinygo.org/x/tinyfont"
	"tinygo.org/x/tinyfont/freesans"
	"tinygo.org/x/tinyfont/proggy"
)

type State int

const (
	MENU State = -1
)

const (
	BADGE State = iota
	SCHEDULE
	WIFI_QR_CODE
	CLOCK
)

var options = []string{
	"Badge",
	"GopherCon Schedule",
	"GopherCon Wifi QR",
	//"Clock",
}

const (
	FIRST_STATE = BADGE
	LAST_STATE  = WIFI_QR_CODE
)

type Buttons int

const (
	A Buttons = iota
	B
	C
	UP
	DOWN
)

const QR_DATA = "1237^Sean^Gosiaco^Software Engineer^DIRECTV^sean.gosiaco@directv.com^United States of America^Strong (1 year+)"
const QR_WIFI = "WIFI:S:GopherCon;T:WPA;P:community;;"

type Model struct {
	State    State
	Loaded   bool
	Selected int16     // menu
	Day      int       // schedule
	Hour     int       // schedule
	LastTime time.Time // clock
}

func NewModel() Model {
	return Model{
		State:    MENU,
		Loaded:   false,
		Selected: 0,
		Day:      2,
		Hour:     0,
	}
}

func (m *Model) View() {
	if m.Loaded {
		return
	}

	switch m.State {
	case MENU:
		// handle up down for options movement
		// handle select and change state on select
		display.ClearBuffer()

		showRect(0, 0, WIDTH, 16, black)
		tinyfont.WriteLine(&display, &proggy.TinySZ8pt7b, 6, 12, "MENU - GOPHERCON", white)

		for i := int16(0); i < int16(len(options)); i++ {
			tinydraw.Circle(&display, 20, 38+12*i, 3, black)
			tinyfont.WriteLine(&display, &proggy.TinySZ8pt7b, 28, 40+12*i, options[i], black)
		}
		// draw circle for initial selection
		tinydraw.FilledCircle(&display, 20, 38+12*m.Selected, 4, black)
		display.DrawBuffer(24, 8, 96, 112, []uint8(logochip))

		display.Display()
		display.WaitUntilIdle()

		m.Loaded = true
	case BADGE:
		profile()
		m.Loaded = true
	case SCHEDULE:
		// flip screen rotation to make it easier
		// when looking at it while on neck
		display.SetRotation(drivers.Rotation90)
		// move to day 2 by default
		showDay(m.Day, m.Hour)
		m.Loaded = true
	// case ADVENTURE:
	// 	adventure()
	// 	m.State = MENU
	// case DEMO:
	// 	demo()
	// 	m.State = MENU
	case WIFI_QR_CODE:
		display.ClearBuffer()
		display.Display()
		display.WaitUntilIdle()
		QR(QR_WIFI)
		display.Display()
		m.Loaded = true
	case CLOCK:
		newTime, err := clock.ReadTime()
		if err != nil {

			return
		}

		if newTime.Sub(m.LastTime) < (10 * time.Second) {
			return
		}
		m.LastTime = newTime

		display.ClearBuffer()
		display.Display()
		display.WaitUntilIdle()

		str := newTime.Format(time.RFC3339)
		w32, _ := tinyfont.LineWidth(&freesans.Bold12pt7b, str)
		tinyfont.WriteLine(&display, &freesans.Bold12pt7b, int16(WIDTH-w32)/2, 70, str, black)
		display.Display()
	}
}

func (m *Model) Transition(button Buttons) {
	switch m.State {
	case MENU:
		// handle up down for options movement
		// handle select and change state on select
		switch button {
		case UP:
			tinydraw.FilledCircle(&display, 20, 38+12*(m.Selected), 4, white)
			tinydraw.Circle(&display, 20, 38+12*(m.Selected), 3, black)
			m.Selected -= 1
			// roll over
			if m.Selected < 0 {
				m.Selected = int16(LAST_STATE)
			}
			tinydraw.FilledCircle(&display, 20, 38+12*m.Selected, 4, black)
			display.Display()
		case DOWN:
			tinydraw.FilledCircle(&display, 20, 38+12*(m.Selected), 4, white)
			tinydraw.Circle(&display, 20, 38+12*(m.Selected), 3, black)
			m.Selected += 1
			// roll over
			if m.Selected > int16(LAST_STATE) {
				m.Selected = 0
			}
			tinydraw.FilledCircle(&display, 20, 38+12*m.Selected, 4, black)
			display.Display()
		case A, B, C:
			// switch to selected state
			m.State = State(m.Selected)
			m.Loaded = false
		}
	case BADGE:
		switch button {
		case A, B, C:
			m.State = MENU
			m.Loaded = false
		case UP:
			// show png
			drawProfileImage()
			display.Display()
		case DOWN:
			// show qr code
			QRPos(WIDTH-120, 0, 120, 128, QR_DATA)
			display.Display()
		}

	case SCHEDULE:
		switch button {
		case A: // next day
			m.Day += 1
			if m.Day > len(scheduleData)-1 {
				m.Day = len(scheduleData) - 1
			} else {
				m.Hour = 0
			}
		case B: // quit
			m.State = MENU
			m.Loaded = false
			// reset rotation back to normal
			display.SetRotation(drivers.Rotation270)
		case C: // prev day
			m.Day -= 1
			if m.Day < 0 {
				m.Day = 0
			} else {
				m.Hour = 0
			}
		case UP: // next hour
			m.Hour += 1
			if m.Hour > len(scheduleData[m.Day].talks)-2 {
				m.Hour = len(scheduleData[m.Day].talks) - 2
			}
		case DOWN: // prev hour
			m.Hour -= 1
			if m.Hour < 0 {
				m.Hour = 0
			}

		}
		// set loaded to false to force refresh
		m.Loaded = false
	// case ADVENTURE:
	// 	//m.State = MENU
	// case DEMO:
	// 	//m.State = MENU
	case WIFI_QR_CODE:
		m.State = MENU
		m.Loaded = false
	case CLOCK:
		m.State = MENU
		m.Loaded = false
	}
}

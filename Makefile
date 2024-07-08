flash:
	tinygo flash -size short -target badger2040 -ldflags="-X main.YourName='$(NAME)' \
	-X main.YourTitleA1='$(TITLEA1)' -X main.YourTitleA2='$(TITLEA2)'  -X main.YourTitleB1='$(TITLEB1)' \
	 -X main.YourTitleB2='$(TITLEB2)' -X main.YourMarqueeTop='$(MARQUEETOP)' -X main.YourMarqueeMiddle='$(MARQUEEMIDDLE)' \
	 -X main.YourMarqueeBottom='$(MARQUEEBOTTOM)' -X main.YourQRText='$(QRTEXT)'" .

sean:
	tinygo flash --target=badger2040 -ldflags="-X main.YourName='SEAN' \
-X main.YourCompany='DIRECTV' \
-X main.YourTitle='Fixer' \
-X main.YourSocial='sean.gosiaco@directv.com' \
-X main.ProfilePic='OVL/////7f61//ff+IEUJC////zNEv/371Vf+rIqQsn//QABEmXbvX3/66/5RJUqkAJAAAiY/vfXXb/+spEqVCQoKqqjNav+uvdt+/QqQKNJUoAADOL/9e+v966yxKtMkAgVVVHV3t+6/V//9BEUMmpS8Y4ziPv7b6vrurGqYsXQpAIQj1Ovrv1+v+/0QQwqJAlUog8k/vv/69e9cRRRlEk0AAi8Ude/+t1997SqpmmgAAAAPor9/9e3r97xQQiGCt//9vlU3/99evt7tBRTWP/////////+1++v7vKipCX9KIgT8gT/1b1V2725SQrKAEAAR3BT///3/3771BRRKRACJQ7kD/+qqqq373KhJlZFEIAb4T+7f///7bqlSoigEEQQPvT+////////8BQlTwgAAfvP/f/fvd/+//6BUJBCG3t13+v99f/2/9df9AtmEPHR7//X71//3VV993+UGQV7Zdv+v1X///////3f4eJQAgO3/W////7/////d/4MBIgHa+v+/+//X+9AH71/UwAAXl/ev/+/n4AABUfXt+RVVRzqq/9+/4WCEJAD/e/5///4vX//9f+h6KIAVfd9vtQK8Wv//6/3CsQIKQB7q38VdODf/f/fz0DipQARfv/XaInDv9fVv24VcABERB///rIzwNa/731uAGUpEQBP//80xwO9/V/y3/IwQAAVDyV/uT8Da/e39G/48gpCQBPQA0RPBtftb8jP3DCgCABDzfa5vA29W/+ibvlyAqCVBfIOADwLa7a+CG/wcKgAABDkrP/4Ptb//qFuAnIABQBE+1j/8qu9VfQEbkhwJKAlAHC4QP11b//vUA4RYoAIgBB9MGnX3v////8OhHASABAFPmRn6rW7////7iJiQCICoDzQb91vbpatrf4I4AkIIABf5UO72tvtX1b/wekAAIQJH/7HVrW2u/b9X+/8JIIAQC4/7+1vbW1fV///fAAQEhSPg39b2tvatv/5d/CRAEAABxAutrW2t+//Rr+CAEkJAS/Ab+1vbW65v/g7KEIAAFyH0C1b2tvZbvv/vwAIJFQ+J+1utrW2r9uW//sigIABPwdwPe1vbXq27a3/CBIIgHtTu19b2tvNbbta/4JAIhV2B7wctrW2e9tt91/wBIBAbUNOT+1veFa221qr/yASBHYXtx1b1aDtba619XuJQJF9Q49etrtAW9d17y/fwAgAcgfzP+12wbU9qzX//SJBJT5TCTpbzYLf633f//AACAAeB/Z/tncvtVbLf/BclKJJTKMJOuvc2Wq7v/0CHgAAAAAHcn2+t27f1v/kyIYhFRIRV017a23bqq3/UeQviEAASAZSNtbbdv1/9ATAgwIApQJOrX29ts2r/wBJyguQqgAgHtN7a227X/39DeCjhAAIiowvdtbbdv////zUC8EhIgA93T27bc3337f//0GUBAAiGjp7dtt3/u3/f/8VwVCIiLn0Os2236u71f/vgdQCIiA74H93bbb217/87xXBUAACv4g63Nttra3/5v5B1ASIiD5APbd223t/+g7gCcJQIiJ9AlttzbbW/9AG6KDJAgCAcCA+23dtr/jCp2IF1FCICugAO7bc23/H6AtwUMEEIiHAAz1tt3b/+MIh9QXEoQCJwL8e223N9f9wiDAQyghUA5/1Xbbbd7//5kI6hdCkAVP/Sh9tttztV/kImCGCAUQH8KAN2223u//+YiiLlKgQVjIAXrbbbW62/5CCB4EChQ94AA9tttrbbb/kAA5UUCBOGBcO2223tttb+q/+AQUKHF//T7bbbW22/vwH+JQQQJ///wdtttrbba2/UAAhRAB///4Xu2239tta34KlBAF///f5Q9bbbQ+297fkAAC///1f6gWtttqBba1t6JX//+rS/1QT+223stta2/////q9r/+AQdbbbW2297b///tX63/xwQXtttrbbaztv3VWrVb/hOAg+223tNtfm1/fq/q//ipwAHbbbWw29/bz6v6n//9JOFV9ttraDa99r//pf//qJFwAO223d9db/136v//fv0kuAT627tq69q/zf//8ffsiTxQd7Vm1da3//b//kf/WVJdAX7uvb89bWv9upEfvfwkpAQ5Xet11////30kfv/dSpSQH6teq3f////eAf/6upAoAV72td7d63t3/9/6/+wm1UQPXeq1t7/v3f//99a8kQgQI6tf621auvf/9//97URQAov2tV7b7++7r19vf3wqrEgB7eqrtVq1bf37v9XdUAEAKPuf9u71ave3f//+pAVsJQJ9dV1Vr9/ve+7wAV///IBAHuqrv11qve677/////wICI+f92ru1Wu////////9IqIX6qzVV7////////++9AAAQf1bv/////////vU6UhIAAr/////////9XlOO5e8Ar/////////7ZS6mueZsY////////+7qpt713ddd29//////31U1VXqpqqqqqqqr//210nSq6qulV1VVVVVVV////y/L/5f+X/y///////1QAADYNgBsAbADYAAAAAADb///t+3/2/9v/t///////'" --stack-size=8kb .


ron:
	tinygo flash --target=badger2040 -ldflags="-X main.YourName='RON' \
-X main.YourCompany='Mechanoid' \
-X main.YourTitle='Technologist for hire' \
-X main.YourSocial='@deadprogram' \
-X main.ProfilePic='AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADGQAAAAAAAAAAAAAAAAAABxmBAAAAAAAAAAAAAAAAAAcbkYAAAAAAAAAAAAAAAAAHO7P/wAAAAAAAAAAAAAAAT//v//wAAAAAAAAAAAAAAG/+/yAfAAAAAAAAAAAAAAB///9/wsAAAAAAAAAAAAACf/+///jwAAAAAAAAAAAAAv/////+OAAAAAAAAAAAAAP//3/8H55f//////AAAAAf/////AP/+3szESbAAAAAH4H///wA84AAQCRIAAAAAD+Af//4AHnEhASAASAAAAA/APv94AAc4BCQCRAAAAAAPwPf++AADmECASBCQAAAAD8Bz//AAAZkICQCCAAAAAD9AZ//AAAHcISASICAAAAB/x+//AAAAzIQCQASAAAAAf8HP/wAAAMwQSACAEAAAAH/A//4AAABuQQCP+QAAAABfwf/eAAAATgQSHFggAAAAf/G/wAAAAGYQQHAQiAAAAf/5/gAAAABmQQTAmAAAAAH/vfwAAAAAbgQQwD8gAAAA///8AAAAAGYQQYQYiAAAAP//4AAAAABmQQTEWEAAAAD//+gAAAAATgQQwRhgAAAA///4AAAAAG4QQkQLEAAAB///+AAAAADMQQhkGBAAAAPf/+wAAAAAzAQgxBkgAAAD//3MAA+AAMyQgmAsIAAAAf//zAAPwAGcAhBgDMAAAAf/38wAH8ABmSBEoRyAAAAP//7OABvgA5gEADAlAAAAD//+zgAD4AM4QJEwjAAAAA///ucAA8AGcQgEMBwQAAAH//5jgAfADmQhIFgsAAAAB/3+c4ADAAzghAjISAAAAB/f/HngAAA54hBBnBgIAAAf//k48AAAc4hBEgQwAAAAH//4HDgAAeOBBAYn4IAAAB//fE8eAAePEBAMCYAAAAAP//wHj+E7HgJD+JIAEAAAD//sk8H/+H4gDhAkAAAAAD///ADwFpHzBJiCSCAIAAA///wkfgAH4ZAQAJACAAAAP3/8gR/qf4mCMCQgAAAAAH///ghD//8DoJAAQAEIAAB/7/wiBDePkfwxwUBAAAAAf/f8gJEOTcUGMTBAAAAAAD/+/AgATh/DAhIYIAAgAAA///wiJByOSwASDGAIAAAAP/95AIEMO+PmHAwgAAAAAD//+EgITZrjAkQYIAAIAAA///gCIhwfwQYBGECAgAAAf/+4kIAODcbciBDAAAAAAF///AQB//+z+BIfABAAAAB//+xBH///mYEAEAAAEAAAP//+ED8AP8bEJIAgAAAAAD//vgT4GwOxkIAAAQgAAAAP//4h4f/w/4IJAAAAAAAAH//+A4fAPj4gQAIAAEAAAD///EseAAOOBBJAAAAAAAA///wcKAAApxCAAIAAIAAAP//+HPAAAGOCJIAD4AAAAA/9/znAB+AZwAAgJjAAAAAP///zgA/wGcSJAAxYEAAAD/3/4wAP8AzgIEgIWAAAAA///+cADfAGcQQAGCgAAAAff/3GAAjwAnBBEBgICAAAH///zgAE8AMyCEEQnAAAAAf//8wAA+ABOIIEMCwAAAAD///sAACAAZgQkBEMCAAAB///rAAAAACZBAEwFAAAAAf/79gAAAAAnCEkYFQAAAAP///YAAAAANwIADAMAAAAB///2AAAAABMQkkiLAgAAAH///gAAAAAzhAAYgwAAAAB///8AAAAAEyEkjCMAAAAB////AAAAABsIACiDCAAAAe9//4AAAAATgkkIhiAAAAH/9//gAAAAEyAAWAsCAAAAP/99+IAAABmIkgwDCAAAAD/+b/tAAAAzggCThyAAAABv/Hf/4AAAM5AkAf4CAAAAf/g//6AAADMEgSQASAAAAD/4ef/gAAAzIBAAIQAAAAA/+Ln/4AAAZwkESQgSAAAAD/g4//AAAOZAIQBCQAAAAA/4HP/cAAHOEggSEAQAAAAH+A3//wADjgBCQISQAAAAD/wP//8AB5xEEAQgAAAAAAf+H///gA85EISRCSQAAAAH/////4B8cAAAAAAAAAAAAf////+B//IJEiIkkgAAAAD/////v+Nf//////8AAAAAv/////+HAAAAAAAAAAAAAJ/////wHgAAAAAAAAAAAAAf///+wPgAAAAAAAAAAAAAH////t/gAAAAAAAAAAAAABP////+AAAAAAAAAAAAAAAB9//gAAAAAAAAAAAAAAAAAY7u4AAAAAAAAAAAAAAAAAHG5mAAAAAAAAAAAAAAAAAAxmBgAAAAAAAAAAAAAAAAAAJAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'" --monitor --stack-size=8kb .

conejo:
	tinygo flash --target=badger2040 -ldflags="-X main.YourName='CONEJO' \
-X main.YourCompany='TinyGo' \
-X main.YourTitle='Technologist for hire' \
-X main.YourSocial='@conejo@social.tinygo.org' \
-X main.ProfilePic='AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAD9uAAAAAAAAAAAAAAAAAAC/u6AAAAAAAAAAAAAAAAAB7t7d4AwAAAAAAAAAAAAAA//1t3toAAAAAAAAAAAAAA937zwvtZ6AAAAAAAAAAAAf33vg9vb3t/////AAAAAAHf/2wd7v2b0AgADwAAAAAD/7/wCRm37vQBIiAAAAAABu39gAt3zP2uEAiCAAAAAA//3oAG7nuXe4JACAAAAAAPvv8AApm3e9tIEiAAfAAAHvv3gAL3zOztwICEA/+AAD/ff4ABpnufd4QkEAcB4AA7/9sAALu7897hAQAMAHgAfvv/wAAK5mbbIAAkCAAeAG/e/cAABp2du/H+ABgABwD//+/AAAPb/ezfHkgQAAHA5ve/QAACbnMt/AYAEAAA4d+9/4AAAbnO9zAWEiAAADH///vAAAG3vt7wB8AgAAAeu+7fwAAAbnNt8Q4kIAYAD/77/cAAANnNs3FGECAQgAPvv+/AAAC3PN7wSgggCEAB//9/ZwAAN7NtuQLEICMUAPva9//AANzds3kHBCAEkIA+/7+zwADbZt7YE0ggEGKAP/378+ABN3ZtuAcIIAMKIBdv3//gAPWZs2gHMCAIiRgH/v3t4AFe5t74SyAQBBBAA/fvf8ABu39ZnANAEAEGJgPff++ABuGZ92wngAgAwYCH/fvAAAbY5rd8CgAMADBIl3/f4AANuH7M9gsABgAMMSf33uAACbFLe7YDAAMAAwUPv3XgAA9gbWtnFgIBgADE3/v/4AAM8jfUwY4AAOAAGA7PvbAAM5Cs14H7AABwAAMv/u/wAP9wOysCfYAAHgAAa3//0AfM4hP+JOcAAAeAAA/7+///M6ifxEnbgAAB+AAe377/8DuwNggT7oAAAD/AH/3v8AAucRYCJnbAAAAD/93v/+CCctAcAI/fwAAAAP//fvbSEd74FCAbuWAAAAD3//e/8EPpvxwwXO+AAAAA37fd/7EDu8OMfA/bgAAAAP78/dvwFvZBrM4bdkAAAAD7/39/0kfdwLb7Ct+AAAAB3+/3/vAHO/+3mw25gAAAAf8zv+vgl/7ArncNzwAAAAG7/7t7cgdx4bnuG26AAAAB/73v//BD/38xnjtzgAAAAfbuf96RE+b+LvX23eAAAAG///738AXZwEs9Nh5gAAAB//u3//AA3zEN5833gAAAAf///33/8DPkJtZ9ucAAAAf/Hf3fv/8uYJs9s69AAAA/AA9v9+AH2fIb7a73gAAB8AAP///gAPeQNnOt3oAAB4AAD/t94AAucJ3Od3kCABwAAH7f30AACegTvZ3/AABwAAUP/ffgABeRHnPvrgAAwAAZD+//4AAGcG3OcwYAAYAAYld/veAADdAyvZ4aAAIABYxH/e+gAAnRNnO+AwIEABRBL7X/4AAHMG3ObicADABhGIP/p+AABvhtvbQLABgAjIJD/v7gAADo3bPcAwAQAiIxA7f/wAADmbNufCUAEASIRAf/74AAA3dvbegHAiAJMYgPu3uAAABs3OzcCwAgEQYgHt//wAABu7ObvIMAIARgQD//3s+AAJuvaryHACASDQB/7v/fwADubO/spwAgCJAA+7/vn+AAOfuZeCMAICRgAf77e5/gAfebd5iHJCACAAfv//+T4ADOZ27ohwAgCAAP/9/dk+ADObzb+AsIIAAAG3T2/o/AAbebtT4DIDAAADPf/+8GgAb2Z2XihwIQAADj/3+/AAAGzfzdxP8IAAABxvvd/wAADb2b1pBBIBgAB8ff//cAABOzZzuBBAIAAByH9u78AAAeb3zvBBBIBABwBvf/vgAAOezb3BBBAAcDwA+/+/4AACeb53iBBBIB/wAP+7/uAAD+e32wJBBAADAADt/8/oAAyeee4gCBBAAAAAvP7/zgAT2c+8CIJBAAAAAf9v+36AO3e+cEIQBAAAAAH3/7/zwE2uc8AAAAAAAAADvff/mnB1u9//////8AAAA///7/ee/3f8AAAAAAAAAAfvvv7tu8PcgAAAAAAAAAAHc///PewAewAAAAAAAAAADf/3v/NAAA8AAAAAAAAAAA+/v/bYAAAAAAAAAAAAAAAf/zn8AAAAAAAAAAAAAAAAHfdz/AAAAAAAAAAAAAAAADt+Y9gAAAAAAAAAAAAAAAB3+EP4AAAAAAAAAAAAAAAAf/CD8AAAAAAAAAAAAAAAAD/AA2AAAAAAAAAAAAAAAAAAAAPgAAAAAAAAAAAAAAAAAAADwAAAAAAAAAAAAAAAAAAAA4AAAAAAAAAAAAAAAAAAAAOAAAAAAAAAAAAAAAAAAAAHAAAAAAAAAAAAAA'" --stack-size=8kb .

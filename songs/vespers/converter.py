import json
import sys

with open(sys.argv[1], "r") as f:
	data = json.load(f)
	if "codenameChart" in data:
		exit()

	data = data["song"]

strumLines = []
events = []

result = {
	"scrollSpeed": data["speed"],
	"strumLines": strumLines,
	"noteTypes": [],
	"events": events,
	"codenameChart": True
}
if "stage" in data:
	result["stage"] = data["stage"]
result["meta"] = {
	"bpm": data["bpm"],
	"needsVoices": data["needsVoices"],
}


p2isGF = data["player2"] == "gf"
strumLines.append({
	"characters": [data["player2"]],
	"type": 0,
	"position": "girlfriend" if p2isGF else "dad",
	"notes": []
})
strumLines.append({
	"characters": [data["player1"]],
	"type": 1,
	"position": "boyfriend",
	"notes": []
})
if (not p2isGF and "gfVersion" in data and data["gfVersion"] is not None):
	strumLines.append({
		"characters": [data["gfVersion"] if data["gfVersion"] is not None else "gf"],
		"type": 2,
		"position": "girlfriend",
		"notes": [],
		"visible": False,
		"strumLinePos": 0.5
	})

camFocusedBF = False
beatsPerMeasure = data["beatsPerMesure"] if "beatsPerMesure" in data else 4
curBPM = data["bpm"]
curTime = 0
curCrochet = ((60 / curBPM) * 1000)

result["meta"]["mania"] = 0
keyAmount = 6
if "mania" in data:
	keyAmount = [4, 6, 7, 9][int(data["mania"])]
	result["meta"]["mania"] = int(data["mania"])
tk = keyAmount * 2

result["meta"]["keyAmount"] = keyAmount
result["mania"] = result["meta"]["mania"]
result["keyAmount"] = keyAmount

if data["notes"] is not None:
	for section in data["notes"]:
		if section is None:
			curTime += curCrochet * beatsPerMeasure
			continue

		oldcbf = camFocusedBF
		camFocusedBF = section["mustHitSection"]
		if oldcbf != camFocusedBF:
			events.append({
				"time": curTime,
				"name": "Camera Movement",
				"params": [1 if camFocusedBF else 0]
			})

		if "sectionNotes" in section:
			for note in section["sectionNotes"]:
				if note[1] < 0: continue

				daStrumTime = note[0]
				daNoteData = int(note[1] % tk)
				daNoteType = 0 # int(note[1] / tk)
				gottaHitNote = not section["mustHitSection"] if daNoteData >= keyAmount else section["mustHitSection"]

				#if (note.length > 2):
				#	if type(note[3]) == int:
				#		daNoteType = Chart.addNoteType(result, data.noteTypes[Std.int(note[3])-1])

				#if (note.length > 2):
				#	if type(note[3]) == int:
				#		daNoteType = Chart.addNoteType(result, data.noteTypes[Std.int(note[3])-1])
				#	elif type(note[3]) == str:
				#		daNoteType = Chart.addNoteType(result, note[3])
				#else:
				#	daNoteType = Chart.addNoteType(result, data.noteTypes[daNoteType-1])

				# time = daStrumTime
				time = int(daStrumTime*100)/100
				if time == int(time):
					time = int(time)

				strumLines[1 if gottaHitNote else 0]["notes"].append({
					"time": time,
					"id": daNoteData % keyAmount,
					"type": daNoteType,
					"sLen": note[2]
				})

		if ("changeBPM" in section and section["changeBPM"] and section["bpm"] != curBPM):
			curBPM = section["bpm"]
			curCrochet = ((60 / (curBPM)) * 1000)

			events.push({
				"time": curTime,
				"name": "BPM Change",
				"params": [curBPM]
			})

		curTime += curCrochet * beatsPerMeasure

#print(data)
#print(result)

print("Saving " + sys.argv[1])
# with open(sys.argv[1].replace(".json", "")+".cne.json", "w") as f:
with open(sys.argv[1], "w") as f:
	json.dump(result, f, separators=(",",":"))

import random

if "canon" in sys.argv[1] and len(sys.argv) > 2: # only save canon meta
	meta = result["meta"].copy()

	meta["color"] = f"#{random.randint(0, 0xFFFFFF):06x}"
	meta["icon"] = data["player2"]
	meta["bpm"] = data["bpm"]
	meta["coopAllowed"] = keyAmount == 4
	meta["opponentModeAllowed"] = True
	meta["displayName"] = sys.argv[2].replace("-", " ").title()

	with open(f"songs/{sys.argv[2]}/meta.json", "w") as f:
		json.dump(meta, f, separators=(",",":"))
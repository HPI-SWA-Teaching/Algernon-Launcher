initialization
initializePosition
	"Position the list under the input field while respecting the borders"
	self position: self position x + (self borderWidth / 2) floor @ (self position y - self borderWidth)
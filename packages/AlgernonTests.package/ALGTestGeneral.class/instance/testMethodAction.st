testing interaction with tools
testMethodAction
	| oldWindows |
	self runQuery: 'testMethodAction' withCursorAt: 'Method'.
	oldWindows := (self findSystemWindowsByLabel: 'Implementors of testMethodAction').
	self activateCurrentItemAction.
	self assert: (self findNewSystemWindowsByLabel: 'Implementors of testMethodAction' old: oldWindows) size equals: 1.
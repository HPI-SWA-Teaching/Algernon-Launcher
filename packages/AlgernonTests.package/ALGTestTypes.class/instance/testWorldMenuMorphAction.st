testing menu morph type
testWorldMenuMorphAction
	| oldSettingsSize |
	oldSettingsSize := (self findSystemWindowsByLabel: 'Preference Browser') size.
	(ALGItem withAlgertype: 
		(ALGWorldMenuMorphType with: {'Preference Browser'. {PreferenceBrowser. #open}})) 
		defaultAlgeraction do.
	self assert: (self findSystemWindowsByLabel: 'Preference Browser') size
		equals: oldSettingsSize + 1
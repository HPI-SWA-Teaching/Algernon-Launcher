testing positioning
testAlgernonPositioningWindowIsSmallerAfterReopening
	| oldExtent |
	oldExtent := World extent.
	World extent: (100@100).
	self algInstance deactivate.
	self algInstance activate.
	self assert: self algInstance center equals: ALGCore defaultPosition rounded.
	World extent: oldExtent
computation
scoreBetween: pattern and: text
	"1. All characters of the search must be in
	the result in the right order.
	2. We score the result by the number of
	characters between the first and the last of
	the query.
	3. Matches at the start of the text are preferred."
	| score patternIndex textIndex |
	"if the pattern is longer than the text, we can never find it."
	pattern size > text size
		ifTrue: [^ nil ].
	
	score := 0.
	patternIndex := 1.
	textIndex := 1.
	
	[patternIndex <= pattern size & (textIndex <= text size)]
		whileTrue: [(text at: textIndex)
					= (pattern at: patternIndex)
				ifTrue: [ patternIndex := patternIndex + 1]
				ifFalse: [score := score + self beforePenalty.
					patternIndex > 1 ifTrue: [score := score + self innerPenalty ]].
			textIndex := textIndex + 1].

	"punish text after the pattern sligthly"		
	score := (text size - textIndex + 1) * (self afterPenalty) + score.
	
	"have we reached the end of the text without finding the whole pattern?"
	(textIndex > text size
			and: [patternIndex <= pattern size])
		ifTrue: [^ nil ].
	
	^ score
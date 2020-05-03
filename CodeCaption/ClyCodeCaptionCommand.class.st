"
Say hello contextmenu.
"
Class {
	#name : #ClyCodeCaptionCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'node'
	],
	#category : #'CodeCaption-UI Context'
}

{ #category : #activation }
ClyCodeCaptionCommand class >> sourceCodeMenuActivation [
	<classAnnotation>
	
	^SycSourceCodeMenuActivation byRootGroupItemOrder: 100000 for: ClyMethodSourceCodeContext
]

{ #category : #execution }
ClyCodeCaptionCommand >> applyResultInContext: aToolContext [
	aToolContext selectedSourceNode.
]

{ #category : #accessing }
ClyCodeCaptionCommand >> defaultMenuItemName [
	^'Add Code Caption'.
]

{ #category : #execution }
ClyCodeCaptionCommand >> execute [
	node inspect.
]

{ #category : #accessing }
ClyCodeCaptionCommand >> node [
	^ node
]

{ #category : #accessing }
ClyCodeCaptionCommand >> node: anObject [
	node := anObject
]

{ #category : #execution }
ClyCodeCaptionCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	
	node := aToolContext selectedSourceNode  .
]
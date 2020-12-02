"
Context Menu for the ""Add Caption Button"".

"
Class {
	#name : #CodeCaptionAddCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'repository',
		'node'
	],
	#category : #'CodeCaption-UI Context'
}

{ #category : #testing }
CodeCaptionAddCommand class >> canBeExecutedInContext: aToolContext [
	^ (Smalltalk globals includesKey: #IceLog)
		and: [ (IceRepository registeredRepositoryIncludingPackage: aToolContext lastSelectedMethod package) notNil ]
]

{ #category : #activation }
CodeCaptionAddCommand class >> sourceCodeMenuActivation [
	<classAnnotation>
	
	^SycSourceCodeMenuActivation byRootGroupItemOrder: 100000 for: ClyMethodSourceCodeContext
]

{ #category : #execution }
CodeCaptionAddCommand >> applyResultInContext: aToolContext [
	aToolContext selectedSourceNode.
]

{ #category : #accessing }
CodeCaptionAddCommand >> defaultMenuIconName [
	^#recentMessages
]

{ #category : #accessing }
CodeCaptionAddCommand >> defaultMenuItemName [
	^'Add Code Caption'.
]

{ #category : #execution }
CodeCaptionAddCommand >> execute [
	(CodeCaptionWindow
		on:
			(CodeCaptionComment
				newWithNode: node
				package: node methodNode methodClass package
				methodNode: node methodNode
				repository: repository)) openWithSpec
]

{ #category : #accessing }
CodeCaptionAddCommand >> node [
	^ node
]

{ #category : #accessing }
CodeCaptionAddCommand >> node: anObject [
	node := anObject
]

{ #category : #execution }
CodeCaptionAddCommand >> prepareFullExecutionInContext: aToolContext [
	| method packageName |
	super prepareFullExecutionInContext: aToolContext.
	
	"Set Iceberg repository"
	method := aToolContext lastSelectedMethod.
	packageName := method package name.
	repository := IceRepository registry detect: [ :each | each includesPackageNamed: packageName ].
	"Set AST node"
	aToolContext selectedSourceNode.
	node := aToolContext selectedSourceNode  .
]

{ #category : #accessing }
CodeCaptionAddCommand >> repository [
	^ repository
]

{ #category : #accessing }
CodeCaptionAddCommand >> repository: anObject [
	repository := anObject
]
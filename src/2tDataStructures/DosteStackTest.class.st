Class {
	#name : #DosteStackTest,
	#superclass : #TestCase,
	#category : #'2tDataStructures'
}

{ #category : #tests }
DosteStackTest >> testStackIsEmpty [
	| myStack |
	myStack := DosteStack new.
	myStack push: 17.
	myStack push: 31.
	myStack pop.
	myStack pop.
	self assert: (myStack isEmpty) equals: true.
]

{ #category : #tests }
DosteStackTest >> testStackPushPopElement [
	| myStack |
	myStack := DosteStack new.
	myStack push: 7.
	myStack push: 3.
	self assert: (myStack pop) equals: 3.
]

{ #category : #tests }
DosteStackTest >> testStackTop [
	| myStack |
	myStack := DosteStack new.
	myStack push: 2.
	myStack push: 4.
	myStack push: 9.
	
	self assert: (myStack pop) equals: 9.
	self assert: (myStack top) equals: 4.
	myStack pop.
	self assert: (myStack pop) equals: 2.
	
	self assert: (myStack pop) equals: nil.
]

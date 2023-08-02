Class {
	#name : #DosteNode,
	#superclass : #Object,
	#instVars : [
		'data',
		'next'
	],
	#category : #'2tDataStructures'
}

{ #category : #'instance creation' }
DosteNode class >> newNode: nodeData [
	| node |
	node := self class new.
	node data: nodeData.
	node next: nil.
	^ node
]

{ #category : #accessing }
DosteNode >> data [
	^ data
]

{ #category : #accessing }
DosteNode >> data: nodeData [
	data := nodeData.
]

{ #category : #initialization }
DosteNode >> initialize [ 
	data := nil.
	next := nil.
	
]

{ #category : #accessing }
DosteNode >> next [
	^ next
]

{ #category : #accessing }
DosteNode >> next: nextNode [
	next := nextNode.
	^ self
]

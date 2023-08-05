Class {
	#name : #DosteLLNode,
	#superclass : #Object,
	#instVars : [
		'data',
		'next'
	],
	#category : #'2tDataStructures'
}

{ #category : #'instance creation' }
DosteLLNode class >> newNode: nodeData [
	| node |
	node := self class new.
	node data: nodeData.
	node next: nil.
	^ node
]

{ #category : #accessing }
DosteLLNode >> data [
	^ data
]

{ #category : #accessing }
DosteLLNode >> data: nodeData [
	data := nodeData.
]

{ #category : #initialization }
DosteLLNode >> initialize [ 
	data := nil.
	next := nil.
	
]

{ #category : #accessing }
DosteLLNode >> next [
	^ next
]

{ #category : #accessing }
DosteLLNode >> next: nextNode [
	next := nextNode.
	^ self
]

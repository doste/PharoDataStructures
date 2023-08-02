Class {
	#name : #DosteLinkedListTest,
	#superclass : #TestCase,
	#category : #'2tDataStructures'
}

{ #category : #tests }
DosteLinkedListTest >> testLinkedListAddFirst [
	| ll |
	ll := DosteLinkedList new.
	ll add: 7.
	ll add: 2.
	ll addFirst: 1.
	ll add: 11.
	self assert: ll asOrderedCollection equals: #(1 7 2 11) asOrderedCollection 
	
]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListAddFirstWithHead [
	| ll |
	ll := DosteLinkedList new.
	ll add: 7.
	ll add: 2.
	ll addFirst: 12.
	ll add: 11.
	self assert: ll head data equals: 12
	
]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListGetAt [
	| ll |
	ll := DosteLinkedList new.
	ll add: 18.
	ll add: 3.
	ll add: 30.
	ll add: 10.
	
	self assert: (ll getAt: 0) data equals: 18.
	self assert: (ll getAt: 1) data equals: 3.
	self assert: (ll getAt: 2) data equals: 30.
	self assert: (ll getAt: 3) data equals: 10.
	
	"self assert: (ll getAt: 8) equals: self error.  TODO esto . ver como hacer para poder testear esto" 
	
]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListHead [
	| ll |
	ll := DosteLinkedList new.
	ll add: 18.
	ll add: 3.
	ll add: 30.
	self assert: ll head data equals: 18 
	
]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListRemoveAt [
	| ll removedNode |
	ll := DosteLinkedList new.
	ll add: 17.
	ll add: 13.
	ll add: 1.
	ll add: 9.
	self assert: ll asOrderedCollection equals: #(17 13 1 9) asOrderedCollection.
	self assert: ll size equals: 4.
	
	ll removeAt: 2.
	self assert: ll asOrderedCollection equals: #(17 13 9) asOrderedCollection.
	self assert: ll size equals: 3.

	ll removeAt: 2.
	self assert: ll asOrderedCollection equals: #(17 13) asOrderedCollection.
	self assert: ll size equals: 2.
	
	self assert: ll tail data equals: 13.
	

]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListRemoveAtReturnedNode [
	| ll removedNodeData |
	ll := DosteLinkedList new.
	ll add: 17.
	ll add: 13.
	ll add: 1.
	ll add: 9.
	"self assert: ll asOrderedCollection equals: #(17 13 1 9) asOrderedCollection."

	removedNodeData := ll removeAt: 1.
	self assert: removedNodeData equals: 13.

]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListSize [
	| ll |
	ll := DosteLinkedList new.
	ll add: 8.
	ll add: 3.
	ll add: 12.
	self assert: ll size equals:  3
	
]

{ #category : #tests }
DosteLinkedListTest >> testLinkedListTail [
	| ll |
	ll := DosteLinkedList new.
	ll add: 18.
	ll add: 3.
	ll add: 30.
	self assert: ll tail data equals: 30
	
]

{ #category : #tests }
DosteLinkedListTest >> testNewLinkedList [
	| ll |
	ll := DosteLinkedList new.
	ll add: 8.
	ll add: 3.
	self assert: ll asOrderedCollection equals: #(8 3) asOrderedCollection 
	
]

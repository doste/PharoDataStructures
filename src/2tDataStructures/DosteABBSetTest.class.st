Class {
	#name : #DosteABBSetTest,
	#superclass : #TestCase,
	#category : #'2tDataStructures'
}

{ #category : #tests }
DosteABBSetTest >> testSetContainsElement [
	| abbSet anEmptySet |
	abbSet := DosteABBSet new.
	abbSet insert: 5.
	abbSet insert: 15.
	
	self assert: (abbSet contains: 5) equals: true.
	
	self assert: (abbSet contains: 25) equals: false.
	
	self assert: (abbSet contains: 15) equals: true.
	
	anEmptySet := DosteABBSet new.
	1 to: 10 do: [ :n |  self assert: (anEmptySet contains: n) equals: false. ].
	
	
	
]

{ #category : #tests }
DosteABBSetTest >> testSetMinElement [
	| abbSet |
	abbSet := DosteABBSet new.
	abbSet insert: 10.
	abbSet insert: 20.
	abbSet insert: 9.
	abbSet insert: 100.
	abbSet insert: 2.
	self assert: (abbSet minElement) equals: 2
]

{ #category : #tests }
DosteABBSetTest >> testSetMinMaxElement [
	| abbSet |
	abbSet := DosteABBSet new.
	abbSet insert: 5.
	abbSet insert: 4.
	abbSet insert: 20.
	
	self assert: (abbSet maxElement ) equals: 20.
	
	self assert: (abbSet minElement) equals: 4.
	
	abbSet insert: 34.
	
	self assert: (abbSet maxElement ) equals: 34.
]

{ #category : #tests }
DosteABBSetTest >> testSetNextElements [
	| abbSet |
	abbSet := DosteABBSet new.
	abbSet insert: 5.
	abbSet insert: 4.
	abbSet insert: 20.
	abbSet insert: 15.
	abbSet insert: 12.
	abbSet insert: 16.
	abbSet insert: 24.
	abbSet insert: 22.
	abbSet insert: 25.
	abbSet insert: 3.
	abbSet insert: 2.
	
	"
		*          5
               / \
              /   \
             /     \
            3        20
           / \     / 		 \
          2   4   15   		24
             		 / \     / \
                12  16  22  25

	"
	
	self assert: (abbSet nextElement: 2) equals: 3.
	self assert: (abbSet nextElement: 4) equals: 5.
	self assert: (abbSet nextElement: 3) equals: 4.
	self assert: (abbSet nextElement: 5) equals: 12.
	self assert: (abbSet nextElement: 15) equals: 16.
	self assert: (abbSet nextElement: 16) equals: 20.
	self assert: (abbSet nextElement: 20) equals: 22.
	self assert: (abbSet nextElement: 22) equals: 24.
  self assert: (abbSet nextElement: 24) equals: 25.	
]

{ #category : #tests }
DosteABBSetTest >> testSizeOfEmptySet [ 
	| abbSet |
	abbSet := DosteABBSet new.
	
	self assert: abbSet size equals: 0
]

{ #category : #tests }
DosteABBSetTest >> testSizeOfSetWithFiveElements [
	| abbSet |
	abbSet := DosteABBSet new.
	abbSet insert: 5.
	abbSet insert: 15.
	abbSet insert: 3.
	abbSet insert: 1.
	abbSet insert: 9.
	self assert: abbSet size equals: 5
]

{ #category : #tests }
DosteABBSetTest >> testSizeOfSetWithOneElement [
	| abbSet |
	abbSet := DosteABBSet new.
	abbSet insert: 5.
	self assert: abbSet size equals: 1
]

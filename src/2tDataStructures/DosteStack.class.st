Class {
	#name : #DosteStack,
	#superclass : #Object,
	#instVars : [
		'top',
		'privateList'
	],
	#category : #'2tDataStructures'
}

{ #category : #adding }
DosteStack >> initialize [
	privateList := DosteLinkedList new.

	
]

{ #category : #adding }
DosteStack >> isEmpty [
		
		^ privateList isEmpty 
		
		

	
]

{ #category : #adding }
DosteStack >> pop [
		"Retorna el elemento en el tope y lo elimina del stack"
		
		| lastElement | "(the last element will be that at the top of the stack)"
		
		privateList isEmpty ifTrue: [ ^ nil ].
		
		lastElement := privateList tail.
		
		privateList removeLast.
		
		^ lastElement data
		
		

	
]

{ #category : #adding }
DosteStack >> push: anElement [
		
		privateList add: anElement.

	
]

{ #category : #adding }
DosteStack >> top [
		"Retorna el elemento en el tope del stack pero no lo elimina"
		
		| lastElement | "(the last element will be that at the top of the stack)"
		
		privateList isEmpty ifTrue: [ ^ nil ].
		
		lastElement := privateList tail.
		
		^ lastElement data
		
		

	
]

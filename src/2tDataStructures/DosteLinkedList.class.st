Class {
	#name : #DosteLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #'2tDataStructures'
}

{ #category : #adding }
DosteLinkedList >> add: nodeDataToAdd [
	| newNodeToAdd previousNode iterator |
	
	previousNode := nil.
	iterator := head.
	
	[ iterator isNotNil ] whileTrue: 
				[ previousNode := iterator.        "en previousNode nos guardamos el ultimo nodo de la lista, osea el nodo
																							el cual su next apunta a nil"
					iterator := iterator next ].
	
	newNodeToAdd := DosteLLNode new.
	newNodeToAdd data: nodeDataToAdd.
	newNodeToAdd next: nil.
	
	previousNode ifNotNil: [previousNode next: newNodeToAdd].
	
	head ifNil: [ head := newNodeToAdd ].
	
	tail := newNodeToAdd.
	
	^ newNodeToAdd
			
	
	
]

{ #category : #adding }
DosteLinkedList >> addFirst: nodeDataToAdd [
		
		| newNode |
		
		newNode := DosteLLNode new.
		newNode data: nodeDataToAdd.
		newNode next: head.
		
		head := newNode.
		
		^ newNode 
]

{ #category : #converting }
DosteLinkedList >> asOrderedCollection [
	| iterator resultArray |
	
	iterator := head.
	resultArray := OrderedCollection new.
	
	[ iterator isNil ] whileFalse: 
				[ resultArray addLast: iterator data.
				  iterator := iterator next ].
			
	^ resultArray
]

{ #category : #accessing }
DosteLinkedList >> getAt: index [
	  | iterator itIndex previousNode|
		
		(index < 0 | index >= self size )ifTrue: [ 
				self error: 'invalid index!'.
		].
		itIndex := 0.
		iterator := head.
		
		[ iterator isNotNil & itIndex < index] whileTrue: 
			 [ previousNode := iterator.        "en previousNode nos guardamos el ultimo nodo de la lista, osea el nodo
																							el cual su next apunta a nil"
				itIndex := itIndex + 1.
				iterator := iterator next ].
			
		"del bucle salio por la negacion de la guarda. entonces para este punto: o iterator es nil o itIndex >= index"
		itIndex = index ifTrue: [ 
				^ iterator
		].
	
		^ nil
		
		
		
]

{ #category : #accessing }
DosteLinkedList >> head [ 
	^ head
]

{ #category : #accessing }
DosteLinkedList >> head: aNode [
	head := aNode
]

{ #category : #accessing }
DosteLinkedList >> isEmpty [
	(self size = 0) ifTrue: [ 
			^ true 
	]
	ifFalse: [ 
			^ false
	].

	
]

{ #category : #'instance creation' }
DosteLinkedList >> new [
	head := nil.
	tail := nil.
	^ self
]

{ #category : #'as yet unclassified' }
DosteLinkedList >> removeAt: index [
		"este metodo borra el nodo indicado por el indice index y ademas devuelve la data de dicho nodo"	
	  | iterator itIndex previousNode nodeToDelete dataOfDeletedNode|
		
		(index < 1 | index > self size )ifTrue: [ 
				self error: 'invalid index!'.
		].
		itIndex := 1.
		previousNode := nil.
		iterator := head.
		
		[ iterator isNotNil and:[itIndex < index]] whileTrue: 
			 [ previousNode := iterator.        
				itIndex := itIndex + 1.
				iterator := iterator next ].
			
		iterator ifNotNil: [
			 dataOfDeletedNode  := iterator data.
		].
		
		itIndex = index ifTrue: [   "si itIndex = index entonces en iterator tenemos el nodo a borrar"
				nodeToDelete := iterator.
				"en previousNode nos quedo el elemento anterior a nodeToDelete, osea el nodo el cual su next apunta a nodeToDelete.
				por lo tanto lo que habra que hacer sera 'saltear' a nodeToDelete, que el next de previousNode ahora apunte al next
				de nodeToDelete"
				"OJO. si itIndex = index tambien puede ser el caso donde la lista consiste de un unico nodo y por lo tanto en itIndex como en index tenemos 1. Este caso lo podemos ver chequeando si previousNode es nil, si lo es significa que hay un unico nodo, asique vemos ese caso aparte:"
				previousNode ifNil: [ 
						self head: nil.
						self tail: nil.
				]
				ifNotNil: [
						previousNode next: nodeToDelete next.
						previousNode next ifNil: [ 
								tail := previousNode		 
						].
				].
				
				
			  "nos aseguramos de borrar el nodo seteando sus variables a nil"
				"nodeToDelete data: nil.
				nodeToDelete next: nil."
				nodeToDelete := nil.
		].
		
		"como seteamos nodeToDelete todo a nil, no podemos hacer ^ nodeToDelete . pero sabemos que en iterator tenemos una copia"
		^ dataOfDeletedNode  
		
		
		
]

{ #category : #'as yet unclassified' }
DosteLinkedList >> removeLast [
		
		self isEmpty ifTrue: [ ^ nil ].
		^ self removeAt: self size
		
		
		
		
]

{ #category : #accessing }
DosteLinkedList >> size [
	| size iterator |
	
	size := 0.
	iterator := head.
	
	[ iterator isNotNil ] whileTrue: [ 
			size := size + 1.
			iterator := iterator next.
	].

	^size 
]

{ #category : #accessing }
DosteLinkedList >> tail [
	^ tail
]

{ #category : #accessing }
DosteLinkedList >> tail: aNode [
	tail := aNode
]

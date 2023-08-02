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
	
	newNodeToAdd := DosteNode new.
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
		
		newNode := DosteNode new.
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
		
		(index < 0 | index >= self size )ifTrue: [ 
				self error: 'invalid index!'.
		].
		itIndex := 0.
		previousNode := nil.
		iterator := head.
		
		[ iterator isNotNil & itIndex < index] whileTrue: 
			 [ previousNode := iterator.        
				itIndex := itIndex + 1.
				iterator := iterator next ].
			
		dataOfDeletedNode  := iterator data.
		
		itIndex = index ifTrue: [   "si itIndex = index entonces en iterator tenemos el nodo a borrar"
				nodeToDelete := iterator.
				"en previousNode nos quedo el elemento anterior a nodeToDelete, osea el nodo el cual su next apunta a nodeToDelete.
				por lo tanto lo que habra que hacer sera 'saltear' a nodeToDelete, que el next de previousNode ahora apunte al next
				de nodeToDelete"
				previousNode next: nodeToDelete next.
				"con esta asignacion tambien tenemos en cuenta el caso donde nodeToDelete sea el ultimo nodo de la lista, cuyo next 
				apuntara a nil, entonces previousNode ahora apuntara a nil"
				"un detalle a tener en cuenta sera ajustar la variable tail como corresponda:"
				previousNode next ifNil: [ 
						tail := previousNode		 
				].
			  "nos aseguramos de borrar el nodo seteando sus variables a nil"
				nodeToDelete data: nil.
				nodeToDelete next: nil.
		].
		
		"como seteamos nodeToDelete todo a nil, no podemos hacer ^ nodeToDelete . pero sabemos que en iterator tenemos una copia"
		^ dataOfDeletedNode  
		
		
		
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

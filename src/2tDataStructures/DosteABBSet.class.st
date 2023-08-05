Class {
	#name : #DosteABBSet,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #'2tDataStructures'
}

{ #category : #accessing }
DosteABBSet >> contains: key [
		| nodeIterator |

		nodeIterator := self root.
		
		nodeIterator ifNil: [ ^ false ].
		
		(nodeIterator data) = key ifTrue: [ ^ true ].
		
		[nodeIterator isNotNil and:[(nodeIterator data = key) not]] whileTrue: [ 
		 		 (nodeIterator data > key ) ifTrue: [    "nodeIterator > key entonces voy al subarbol izq"
							nodeIterator := nodeIterator left
					] ifFalse: [   															 "nodeIterator < key entonces voy al subarbol der"
							nodeIterator := nodeIterator right
					]
		].
	
		nodeIterator isNil ifTrue: [ 
				^ false
		] ifFalse: [ 					"si nodeIterator no es Nil, entonces salio del while porque nodeIterator data = key entonces key SI esta"									
				^ true
		]
		
		
]

{ #category : #accessing }
DosteABBSet >> findNextElementOf: key inLeftSubtreeFrom: aNode [ 
		"si el nodo u tiene hijo derecho, entonces el siguiente de u sera el minimo de todo ese subarbol hijo (incluso si u es la raiz, tambien vale)
      siguiente de u basicamente sera 'el minimo de los que estan a la derecha de u'"

		| nodeIterator leftParents |
		
		nodeIterator := aNode.
		leftParents := DosteStack new.
	
		[nodeIterator isNotNil] whileTrue: [ 
		 		 (nodeIterator data > key ) ifTrue: [    "cada vez que bajo por izquierda pusheo ese padre"
							leftParents push: nodeIterator.
							nodeIterator := nodeIterator left
					] ifFalse: [   															 "nodeIterator < key entonces voy al subarbol der"
							(nodeIterator data < key ) ifTrue: [ 
									nodeIterator := nodeIterator right
							] ifFalse: [ 														"si entramos aca es porque son iguales"
									(leftParents isEmpty) ifFalse: [ 
											^ leftParents top data.
									].
							].
			
					]
		].
	
		^ nil
		

]

{ #category : #accessing }
DosteABBSet >> findNextElementOf: key inRightSubtreeFrom: aNode [ 
		"si el nodo u tiene hijo derecho, entonces el siguiente de u sera el minimo de todo ese subarbol hijo (incluso si u es la raiz, tambien vale)
      siguiente de u basicamente sera 'el minimo de los que estan a la derecha de u'"

		| nodeIterator |
		
		nodeIterator := aNode.
	
		[nodeIterator isNotNil] whileTrue: [ 
		 		 (nodeIterator data > key ) ifTrue: [    "nodeIterator > key entonces voy al subarbol izq"
							nodeIterator := nodeIterator left
					] ifFalse: [   															 "nodeIterator < key entonces voy al subarbol der"
							(nodeIterator data < key ) ifTrue: [ 
									nodeIterator := nodeIterator right
							] ifFalse: [ 														"si entramos aca es porque son iguales"
									nodeIterator right ifNotNil: [ 
											^ self minElementFromNode: nodeIterator right
									] ifNil: [ 
											^ nil
									].
							].
			
					]
		].
	
		^ nil
		

]

{ #category : #accessing }
DosteABBSet >> findParent: key [
		| nodeIterator nodeParent|
		
		nodeIterator := root.
		nodeParent := nil.
		
		[ nodeIterator isNil ] whileFalse: [ 
					nodeParent := nodeIterator.
					( key < nodeIterator data ) ifTrue: [ 
								nodeIterator := nodeIterator left
					 ] ifFalse: [
								nodeIterator := nodeIterator right
					].
		 ].
	
		 ^ nodeParent
]

{ #category : #accessing }
DosteABBSet >> insert: key [
		"Inserta un elemento en el conjunto. Si este ya existe, el conjunto no se modifica."
		| nodeIterator nodeToInsert nodeParent|
		
		(self contains: key) ifTrue: [ " si prev es nullptr es porque actual es nullptr y nunca entro al while
           											eso significa que el arbol era vacio. asique solo seteo la raiz con la clave pasada "
				^ nil
		
		] ifFalse: [ 
		
				nodeToInsert := DosteABBNode new.
				nodeToInsert data: key.
				nodeToInsert left: nil.
				nodeToInsert right: nil.
				
				nodeIterator := self root.
				nodeParent := self findParent: key.
				
				nodeParent isNil ifTrue: [ 						"si prev es nullptr es porque actual es nullptr y nunca entro al while"
						nodeParent := nodeToInsert.				"eso significa que el arbol era vacio. asique solo seteo la raiz con la clave pasada"
						self root: nodeParent.
				] ifFalse: [ 
						(key < nodeParent data) ifTrue: [   "nodeParent seria el padre del nodo a insertar . si la clave es mayor:"
								nodeParent left: nodeToInsert.     "lo inserto como hijo izquierdo"
						] ifFalse:  [
								nodeParent right: nodeToInsert.    "y si la clave es menor, como hijo derecho"
						]
			
				].
				
		].
		
		
		
		
]

{ #category : #accessing }
DosteABBSet >> maxElement [
	"como estamos trabajando con ABB sabemos que el mayor elemento sera 'el que esta 'mas a la derecha' osea el nodo que esta en 	el extremo derecho"
	| nodeIterator |
	
	self root ifNil: [ ^ 0 ].
	
	nodeIterator := self root.
	
	[nodeIterator right] whileNotNil: [ 
			nodeIterator := nodeIterator right
	].
	
	^ nodeIterator data
	
]

{ #category : #accessing }
DosteABBSet >> minElement [
	
	^ self minElementFromNode: self root.
	
]

{ #category : #accessing }
DosteABBSet >> minElementFromNode: aNode [
	"como estamos trabajando con ABB sabemos que el menor elemento sera 'el que esta 'mas a la izquierda' osea el nodo que esta en 	el extremo izquierdo"
	| nodeIterator |
	
	aNode ifNil: [ ^ 0 ].
	
	nodeIterator := aNode.
	
	[nodeIterator left] whileNotNil: [ 
			nodeIterator := nodeIterator left
	].
	
	^ nodeIterator data
	
]

{ #category : #accessing }
DosteABBSet >> nextElement: key [
		"Devuelve el siguiente elemento al recibido por párametro. Se asume que el elemento recibido se encuentra en el conjunto y existe un elemento siguiente."
		
		| nextInRight |
		
		nextInRight := self findNextElementOf: key inRightSubtreeFrom: self root.
		
		nextInRight ifNotNil: [ 
				^ nextInRight  
		] ifNil: [ 
		
			^ self findNextElementOf: key inLeftSubtreeFrom: self root.
		
		].
		
]

{ #category : #accessing }
DosteABBSet >> root [

	^ root
]

{ #category : #accessing }
DosteABBSet >> root: anObject [

	root := anObject
]

{ #category : #accessing }
DosteABBSet >> size [
		| setSize |
		
		setSize := self sizeOfSubsetFrom: self root.
		
		^ setSize
]

{ #category : #accessing }
DosteABBSet >> sizeOfSubsetFrom: aNode [
		| setSize |
		
		setSize := 0.
		
		aNode ifNotNil: [ 
				setSize := 1 + (self sizeOfSubsetFrom: aNode left) + (self sizeOfSubsetFrom: aNode right).
		].
		
		^ setSize
]

Class {
	#name : #FDOpenDirectoryDialogTest,
	#superclass : #FDFileDialogTest,
	#category : 'FileDialog-Tests'
}

{ #category : #accessing }
FDOpenDirectoryDialogTest >> dialogClass [
	^ FDOpenDirectoryDialog
]

{ #category : #tests }
FDOpenDirectoryDialogTest >> testDefaultDirectory [
	self assert: dialog selectedEntry equals: root.
	dialog defaultFolder: root / 'dir'.
	self assert: dialog selectedEntry equals: root / 'dir'
]

{ #category : #tests }
FDOpenDirectoryDialogTest >> testSelectDirectory [
	| selectedDirectory |
	dialog whenSelected: [ :dir | selectedDirectory := dir ].
	window := dialog open.
	self assert: dialog currentDirectory equals: root.
	dialog selectFile: root / 'dir'.
	self assert: dialog selectedEntry equals: root / 'dir'.
	dialog confirm.
	self assert: selectedDirectory equals: root / 'dir'
]

{ #category : #tests }
FDOpenDirectoryDialogTest >> testSelectNonexistingDirectory [
	dialog defaultFolder: root / 'idontexist'.
	self assert: dialog selectedEntry equals: FileLocator imageDirectory asFileReference
]

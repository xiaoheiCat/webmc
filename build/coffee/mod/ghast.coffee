#Ghast1
ghast=al.get "ghastF"
texturex1 = al.get "ghast"
texturex1.magFilter = THREE.NearestFilter
ghast.children[1].material.map=texturex1
ghast.children[0].children[0].scale.set 0.01,0.01,0.01 
ghast.children[1].material.color=new THREE.Color 0xffffff
mat=ghast.children[1].material.clone()
scene.add ghast

#Ghast2
ghast2=SkeletonUtils.clone ghast
texturex2 = al.get "ghastS"
texturex2.magFilter = THREE.NearestFilter
ghast2.children[1].material=mat
ghast2.children[1].material.map=texturex2
ghast2.position.set 3,0,0
scene.add ghast2
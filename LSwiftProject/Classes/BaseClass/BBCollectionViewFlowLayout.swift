 
import Foundation
class BBCollectionViewFlowLayout : UICollectionViewFlowLayout {
   
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        guard attributes != nil else { return nil }
       
          guard  attributes!.count > 1 else { return nil }
        
        for i in 1..<attributes!.count {
            let current = attributes![i]
            let original = attributes![i-1].frame.maxX
            if original + current.frame.width <= collectionViewContentSize.width {
                current.frame.origin.x = original
            }
        }
        return attributes
    }
    
    
}

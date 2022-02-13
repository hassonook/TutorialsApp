//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TutorialsApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tutorial
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tutorial()
        {
            this.Active = true;
            this.Ratings = new HashSet<Rating>();
            this.Commentings = new HashSet<Commenting>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public string PathFile { get; set; }
        public int CategoryId { get; set; }
        public int TutorialTypeId { get; set; }
        public string Desc { get; set; }
        public bool Active { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<decimal> FileSize { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual TutorialType TutorialType { get; set; }
        public virtual AspNetUser AspNetUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rating> Ratings { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Commenting> Commentings { get; set; }
    }
}

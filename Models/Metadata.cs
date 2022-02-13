using System;
using System.ComponentModel.DataAnnotations;
using System.Web;
using TutorialsApp.Models;

namespace TutorialsApp.Models
{
    public class TutorialMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name ="Name")]
        public string Name { get; set; }
        [Required]
        [Display(Name = "File")]
        [DataType(DataType.Upload)]
        public string PathFile { get; set; }
        [Display(Name = "File Size")]
        public decimal FileSize { get; set; }
        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }
        [Required]
        [Display(Name = "Material Type")]
        public int TutorialTypeId { get; set; }
        [Required]
        [Display(Name = "Description")]
        public string Desc { get; set; }
        public bool Active { get; set; }
        [Required]
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
    }
    public class TutorialTypeMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Material Type")]
        public string Name { get; set; }
    }
    public class CategoryMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Category Name")]
        public string Name { get; set; }
        [Display(Name = "Parent Category")]
        public int CategoryId { get; set; }
    }
    public class CommentingMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Comment")]
        public string Comment { get; set; }
        [Required]
        [Display(Name = "Tutorial")]
        public int TutorialId { get; set; }
        [Required]
        [Display(Name = "User")]
        public string AspNetUserId { get; set; }
        [Required]
        [Display(Name = "Comment Date")]
        public DateTime CommentOn { get; set; }
    }
    public class RatingMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Rate")]
        public int Rate { get; set; }
        [Required]
        [Display(Name = "Tutorial")]
        public int TutorialId { get; set; }
        [Required]
        [Display(Name = "User")]
        public string AspNetUserId { get; set; }
        [Required]
        [Display(Name = "Rate Date")]
        public DateTime RatedOn { get; set; }
    }
}
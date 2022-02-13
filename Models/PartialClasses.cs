using System;
using System.ComponentModel.DataAnnotations;

namespace TutorialsApp.Models
{
    [MetadataType(typeof(TutorialMetadata))]
    public partial class Tutorial
    {
    }
    [MetadataType(typeof(TutorialTypeMetadata))]
    public partial class TutorialType
    {
    }
    [MetadataType(typeof(CategoryMetadata))]
    public partial class Category
    {
    }
    [MetadataType(typeof(CommentingMetadata))]
    public partial class Commenting
    {
    }
    [MetadataType(typeof(RatingMetadata))]
    public partial class Rating
    {
    }

}
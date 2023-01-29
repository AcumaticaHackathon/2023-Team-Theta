using PX.Data;

namespace PX.Objects.SO
{
    [PXNonInstantiatedExtension]
    public sealed class SOOrderExtensions : PXCacheExtension<SOOrder>
    {
        public static bool IsActive() { return true; }

        #region OrderDesc  
        [PXDBString(Common.Constants.TranDescLength, IsUnicode = true)]
        [PXUIField(DisplayName = "Description", Visibility = PXUIVisibility.SelectorVisible)]
        public string OrderDesc { get; set; }
        #endregion
    }
}
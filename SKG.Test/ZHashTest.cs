using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SKG.Test
{
    [TestClass]
    public class ZHashTest
    {
        [TestMethod]
        public void Test01()
        {
            var t = GetType().Name;
            var h = new ZHash(t);

            Assert.IsNotNull(h.Value);
            Assert.IsNotNull(h.Salt);
            Assert.IsNotNull(h.Pepper);
        }
    }
}
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SKG.Test
{
    [TestClass]
    public class ZTokenTest
    {
        [TestMethod]
        public void Test01()
        {
            var payload = new
            {
                UserName = "admin",
                Email = "nvt87x@gmail.com"
            };

            var z = new ZToken(null, payload, 0);
            Assert.IsNotNull(z.Jwt);

            z = new ZToken("1", null, 10001);
            Assert.IsNotNull(z.Jwt);

            z = new ZToken("1234567890qwerty", payload, 100);
            Assert.IsNotNull(z.Jwt);
        }
    }
}
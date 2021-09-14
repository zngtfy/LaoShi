using Microsoft.VisualStudio.TestTools.UnitTesting;
using SKG.Ext;

namespace SKG.Test
{
    [TestClass]
    public class ZEmailTest
    {
        [TestMethod]
        public void Test01()
        {
            var publicKey = @"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjjyNaiZAXRGkI0N2CC0KVM/rHcL0CbSXYlHmi9QFMfQ/IQ5opGcLo0DT+oNkSG+mQUZqplIu9ES4JtGTBSbR7sWtiKokmcDaw11IQUMpmhAu7C1RNsxjQjvDK1McUAQbI0Ai5vm/o07MA+lJIPu8XNcw/CS6hmQfw9/VRB4xmkB3fNGPeaWzHs/aDd5ilytV5xhzqLgwaC9G33kxd+0Gs5XwM4XJ49UxXjKoOmbebpYSFRoWY7opFEi75lqZfSa718M8PZmxyE88bRVtBugkZkHUXctgZt8MvhofBMSEByI6VJoY+x3wVynteHKQPLVYtg1D9qM7kAwSlQ9rbORR9QIDAQAB";
            var privateKey = @"MIIEpAIBAAKCAQEAjjyNaiZAXRGkI0N2CC0KVM/rHcL0CbSXYlHmi9QFMfQ/IQ5opGcLo0DT+oNkSG+mQUZqplIu9ES4JtGTBSbR7sWtiKokmcDaw11IQUMpmhAu7C1RNsxjQjvDK1McUAQbI0Ai5vm/o07MA+lJIPu8XNcw/CS6hmQfw9/VRB4xmkB3fNGPeaWzHs/aDd5ilytV5xhzqLgwaC9G33kxd+0Gs5XwM4XJ49UxXjKoOmbebpYSFRoWY7opFEi75lqZfSa718M8PZmxyE88bRVtBugkZkHUXctgZt8MvhofBMSEByI6VJoY+x3wVynteHKQPLVYtg1D9qM7kAwSlQ9rbORR9QIDAQABAoIBAHLHnn6oe4wfLktepyMV5Z5nYp5TskcauocW/GqeH8seBMuSKxNwLE4DhIxF92kU4B8QygOJkmaABfMdb/zaRNLgJpeAZaTFokPBRQuVPT8cDCF+uGj2KqtKOsb9fH19ssCRgxjNNb59WdlWKjM5sdlhth/jK7pDlfak7B7aFsEYSi0j+pUdqcV3RvDmcPi++6wWB/4rtel/NX2CEO/pi3prsiizkXlexaITdHONpU1JvCH0kPIkA1MtOAf9eciRwCw+t27UQGbWf7DOERwRTx6Of6RL2+YOZV+Ti/ubN/zgHPIbm/srKBKfCmtt9VgF2yup3qCx3HHLIyy4+0+PFMkCgYEA2bFWG+c/Nswsq+Q8G8UI2sb4xSxB5ZP/2rNGWFBvE1qr+GsW1iGq1S+B0Qqp7OpVy2lT9yrpLU7a0mk23gpVKrQJIVUUWA8SkY0P2OfzaC0ECh5HpqPr14bhPMzErb827sPQOMWNHEpGJ/zhMd5pLacupfyV9KkYYZki/AdWC5sCgYEAp0QNGMa53ZMea4fplE2tPVW64WsCII4MmDCJtyxg8GAXefbRPpvk/Ur23LWl4PAYOkzHUWzbmzl5qzucI28fZnSFn/gKmLk7jTSggdyM9OrYSBwLiFbjFO3VkPzmRVzSAj01RNnrALECfpg7Z86/oU59SmL0elcNdUByRJV02a8CgYEAogm8PLzect17it8yVsFNG/vrBGkzC74kPhgfjnEgnNlrFFgyAWXCETlxebZkUbMD9YsLMvm/4zfE7cXfT1uFlWm5OhRoNjvR6IGFgED3D14imZ18W++8Bwug8G7DH0krjII4pWl25c3rdqxmu4X/6Dl/IZJn1FthiJRCVDLpu20CgYAa+3NRZ91bzPu/RPF9JvqnRkkbS/PP5JpLgqj0j4gjvpyK5DHk86kA4zLnb7YOjyyZWwFcNT9HzwG9iaQqYyahlHJp1819zYO5x5+M01M5vxicqUmC+OEw4xzsgp9y2QJXsiABt1WdivBoE46htExdbRfxA/2ELr7RB1Bnl+R9qQKBgQC02fBocGPm6uz8Sa6SzC98gYt+IHrI+0RXYtz24Z47W7gJ6O7bYpJb7/SE4fKyrrD/gAtwOQsJqUzkuvKOsHSM6sRL38dzhCCRJJxoun62OU29ju8RAG0GhMNBzv5sRvIOW1FGXP99GbFh7t+Y8hRyIndyQas/LPk7rQA+7c3HQg==";

            var password = "P@SSnhucu123".Encrypt(publicKey);
            var fr = "vost.test@tanvieta.co";
            var to = "nvt87x@gmail.com";
            var z = new ZEmail("mail.tanvieta.co", 587, fr, password, privateKey);

            var i = new ZEmail.Info(fr, to)
            {
                Cc = "toan.nguyen@tanvieta.co",
                Display = "Auto system",
                Subject = "Welcome to YEX",
                FullName = "Toan Nguyen"
            };

            var m = z.GetMailWithImage(i);
            z.SendEmail(m);
        }
    }
}
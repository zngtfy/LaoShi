#region Information
/*
 * Author       : ZngTfy
 * Email        : toan.nguyen@tanvieta.co
 * Phone        : +84 345 515 010
 * ------------------------------- *
 * Create       : 2019-Oct-19 04:24
 * Update       : 2019-Oct-19 04:24
 * Checklist    : 1.0
 * Status       : Done
 */
#endregion

using Microsoft.IdentityModel.Tokens;
using SKG.Ext;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace SKG
{
    /// <summary>
    /// Token
    /// </summary>
    public class ZToken
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="secret">Secret</param>
        /// <param name="payload">Payload</param>
        /// <param name="expires">Expires (minute: 1 - 10000)</param>
        public ZToken(string secret, object payload, double expires)
        {
            if (secret == null || secret.Length < 16)
            {
                var t = DateTime.Now.ToString();
                secret = new ZHash(t).Value;
            }

            Secret = secret;
            Payload = payload;

            if (expires < 1)
            {
                expires = 1;
            }

            if (expires > 10000)
            {
                expires = 10000;
            }

            Expires = expires;
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Secret
        /// </summary>
        public string Secret { get; private set; }

        /// <summary>
        /// Payload
        /// </summary>
        public object Payload { get; private set; }

        /// <summary>
        /// Expires (minute: 1 - 10000)
        /// </summary>
        public double Expires { get; private set; }

        /// <summary>
        /// JSON web token
        /// </summary>
        public string Jwt
        {
            get
            {
                var now = DateTime.UtcNow;
                var expires = now.AddMinutes(Expires);

                var jti = string.Empty;
                var t = Payload.GetPropertyValue("Uuid").ToGuidNull();
                if (t != null)
                {
                    jti = t.ToString();
                }

                var iat = now.ToUniversalTime().ToString();

                var claims = new Claim[] {
                    new Claim(JwtRegisteredClaimNames.Jti, jti),
                    new Claim(JwtRegisteredClaimNames.Iat, iat)
                };

                var array = Encoding.UTF8.GetBytes(Secret);
                var key = new SymmetricSecurityKey(array);
                var signing = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                var token = new JwtSecurityToken(
                    issuer: "https://www.skg.com",
                    audience: "Zng Tfy",
                    claims: claims,
                    notBefore: now,
                    expires: expires,
                    signingCredentials: signing);
                token.Payload[ZConst.Payload] = Payload;

                var res = new JwtSecurityTokenHandler().WriteToken(token);
                return res;
            }
        }

        #endregion
    }
}
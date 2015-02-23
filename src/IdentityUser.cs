using Microsoft.AspNet.Identity;
using System;

namespace AspNet.Identity.PostgreSQL
{
    /// <summary>
    /// Class that implements the ASP.NET Identity IUser interface.
    /// </summary>
    public class IdentityUser : IUser
    {
        /// <summary>
        /// Default constructor. 
        /// </summary>
        public IdentityUser()
        {
            this.Id = Guid.NewGuid().ToString();
        }

        /// <summary>
        /// Constructor that takes user name as argument.
        /// </summary>
        /// <param name="userName"></param>
        public IdentityUser(string userName)
            : this()
        {
            this.UserName = userName;
        }

        /// <summary>
        /// User ID.
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// User's name.
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// Email.
        /// </summary>
        public virtual string Email { get; set; }

        /// <summary>
        /// True if the email is confirmed, default is false.
        /// </summary>
        public virtual bool EmailConfirmed { get; set; }

        /// <summary>
        /// The salted/hashed form of the user password.
        /// </summary>
        public virtual string PasswordHash { get; set; }

        /// <summary>
        /// A random value that should change whenever a users credentials have changed (password changed, login removed).
        /// </summary>
        public virtual string SecurityStamp { get; set; }

        /// <summary>
        /// User can be locked out
        /// </summary>
        public virtual bool LockoutEnabled { get; set; }

        /// <summary>
        /// The current number of failed access attempts.
        /// This number usually will be reset whenever the password is verified or the account is locked out.
        /// </summary>
        public virtual int LoginAttemps { get; set; }

        /// <summary>
        /// DateTime that represents the end of a user's lockout, any time in the past should be considered not locked out.
        /// </summary>
        public virtual DateTimeOffset LockoutEndDate { get; set; }

        /// <summary>
        /// Phone Number.
        /// </summary>
        public virtual string PhoneNumber { get; set; }

        /// <summary>
        /// True if the Phone Number is confirmed, default is false.
        /// </summary>
        public virtual bool PhoneNumberConfirmed { get; set; }

        /// <summary>
        /// Two factor authentication is enabled for the user.
        /// </summary>
        public virtual bool TwoFactorAuthEnabled { get; set; }
    }
}

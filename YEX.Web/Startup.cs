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

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SpaServices.AngularCli;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.IO;
using System.Text;

namespace YEX.Web
{
    using BLL;

    /// <summary>
    /// Startup
    /// </summary>
    public class Startup
    {
        #region -- Methods --

        /// <summary>
        /// Initialize
        /// </summary>
        /// <param name="configuration">Configuration</param>
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        /// <summary>
        /// This method gets called by the runtime.
        /// Use this method to add services to the container.
        /// </summary>
        /// <param name="services">Services</param>
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();

            #region -- AppSetting --
            var section = Configuration.GetSection("AppSetting");
            services.Configure<AppSetting>(section);

            // Configure JWT authentication
            AppSetting.S = section.Get<AppSetting>();
            AppSetting.S.RsaPrivateKey = YVariable.RsaPrivateKey + AppSetting.S.RsaPrivateKey;
            #endregion

            #region -- Swagger --
            if (AppSetting.S.Dev)
            {
                var inf1 = new OpenApiInfo
                {
                    Title = "API v1.0",
                    Version = "v1",
                    Description = "Swashbuckle",
                    TermsOfService = new Uri("http://appointvn.com"),
                    Contact = new OpenApiContact
                    {
                        Name = "ZngTfy",
                        Email = "toan.nguyen@tanvieta.co"
                    },
                    License = new OpenApiLicense
                    {
                        Name = "Apache 2.0",
                        Url = new Uri("http://www.apache.org/licenses/LICENSE-2.0.html")
                    }
                };

                var inf2 = new OpenApiInfo
                {
                    Title = "API v2.0",
                    Version = "v2",
                    Description = "Swashbuckle",
                    TermsOfService = new Uri("http://appointvn.com"),
                    Contact = new OpenApiContact
                    {
                        Name = "ZngTfy",
                        Email = "toan.nguyen@tanvieta.co"
                    },
                    License = new OpenApiLicense
                    {
                        Name = "Apache 2.0",
                        Url = new Uri("http://www.apache.org/licenses/LICENSE-2.0.html")
                    }
                };

                services.AddSwaggerGen(c =>
                {
                    c.SwaggerDoc("v1", inf1);
                    c.SwaggerDoc("v2", inf2);
                });
            }
            #endregion

            #region -- JWT --
            var key = Encoding.UTF8.GetBytes(AppSetting.S.JwtSecret);
            services.AddAuthentication(p =>
            {
                p.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                p.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(p =>
            {
                p.RequireHttpsMetadata = false;
                p.SaveToken = true;
                p.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false
                };
            });
            #endregion

            #region -- Service --
            services.AddSingleton<UserSvc, UserSvc>();
            services.AddSingleton<RoleSvc, RoleSvc>();
            services.AddSingleton<UserRoleSvc, UserRoleSvc>();
            services.AddSingleton<FunctionSvc, FunctionSvc>();
            services.AddSingleton<FunctionRoleSvc, FunctionRoleSvc>();
            services.AddSingleton<SettingSvc, SettingSvc>();
            services.AddSingleton<CodeSvc, CodeSvc>();
            services.AddSingleton<CodeTypeSvc, CodeTypeSvc>();
            services.AddSingleton<NewsSvc, NewsSvc>();
            services.AddSingleton<TeacherSvc, TeacherSvc>();
            services.AddSingleton<StudentSvc, StudentSvc>();
            services.AddSingleton<GradStudentSvc, GradStudentSvc>();
            services.AddSingleton<RequestSvc, RequestSvc>();
            #endregion

            // In production, the Angular files will be served from this directory
            services.AddSpaStaticFiles(configuration =>
            {
                configuration.RootPath = "ClientApp/dist";
            });
        }

        /// <summary>
        /// This method gets called by the runtime.
        /// Use this method to configure the HTTP request pipeline.
        /// </summary>
        /// <param name="app">Application builder</param>
        /// <param name="env">Web host environment</param>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days.
                // You may want to change this for production scenarios,
                // see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            if (AppSetting.S.Dev)
            {
                #region -- Swagger --
                app.UseSwagger();
                app.UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "API v1.0");
                    c.SwaggerEndpoint("/swagger/v2/swagger.json", "API v2.0");
                });
                #endregion

                #region -- CORS --
                app.UseCors(p => p.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());

                var t0 = "Access-Control-Allow-";
                var t2 = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot");
                var t3 = new StaticFileOptions()
                {
                    OnPrepareResponse = p =>
                    {
                        p.Context.Response.Headers.Append(t0 + "Origin", "*");
                        p.Context.Response.Headers.Append(t0 + "Headers", "*");
                    },
                    FileProvider = new PhysicalFileProvider(t2),
                    RequestPath = new PathString(string.Empty)
                };
                app.UseStaticFiles(t3);
                #endregion
            }

            //app.UseHttpsRedirection();
            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseStaticFiles();
            if (!env.IsDevelopment())
            {
                app.UseSpaStaticFiles();
            }

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });

            app.UseSpa(spa =>
            {
                // To learn more about options for serving an Angular SPA from ASP.NET Core,
                // see https://go.microsoft.com/fwlink/?linkid=864501

                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment())
                {
                    spa.UseAngularCliServer(npmScript: "start");
                }
            });
        }

        #endregion

        #region -- Properties --

        /// <summary>
        /// Configuration
        /// </summary>
        public IConfiguration Configuration { get; }

        #endregion
    }
}
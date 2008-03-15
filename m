Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Jaa6T-0004uq-QF
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Mar 2008 18:23:31 +0100
Received: by wa-out-1112.google.com with SMTP id l24so6761014waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2008 10:21:05 -0700 (PDT)
Received: by 10.114.171.1 with SMTP id t1mr14564964wae.83.1205601665798;
	Sat, 15 Mar 2008 10:21:05 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Sat, 15 Mar 2008 10:21:05 -0700 (PDT)
Message-ID: <19c1b8a90803151021g7d0eb612j1f37ce818c50ac47@mail.gmail.com>
Date: Sat, 15 Mar 2008 10:21:05 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47DA38DF.6020307@adtelecom.es>
MIME-Version: 1.0
References: <19c1b8a90803132350x14a3496en8e921fae09cf9aff@mail.gmail.com>
	<47DA38DF.6020307@adtelecom.es>
X-SA-Exim-Connect-IP: 209.85.146.183
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gnome-vfs-2.20.0 needs glib-2.0-2.14.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Mar 2008 17:23:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Joaquim,

I tried with 2.16.1 and it does not help either I end up in the same
message compiling gnome-vfs 2.20.0. I think we should stick to 2.14.x
if we are using gnome-2.20

With newer version of gnome it might be ok.

Thanks

-Khem

On Fri, Mar 14, 2008 at 1:35 AM, Joaquim Duran
<joaquinduran@adtelecom.es> wrote:
> En/na Khem Raj ha escrit:
>
>
> > Hi
>  >
>  > I stumbled upon this while compiling x11-image using
>  > angstrom-2008-1.conf that gnome-vfs does not build because it needs
>  > headers from glibc-2.0-2.14.x but in
>  > ngstrom-2008-preferred-versions.inc we override this
>  > PREFERRED_VERSION_glib-2.0 = "2.15.6"
>  >
>  > Should be still stick to 2.14.4 ?
>  >
>  > Thanks
>  >
>  > -Khem
>  >
>  > _______________________________________________
>  > Openembedded-devel mailing list
>  > Openembedded-devel@lists.openembedded.org
>  > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  >
>  >
>
>  Hello,
>
>  glib 2.15.x are development series. I think that 2.16.x series are out.
>  The last one is 2.16.1.
>
>  Joaquim Duran
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



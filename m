Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1IHReG-0002HU-HQ
	for openembedded-devel@openembedded.org; Sat, 04 Aug 2007 23:59:00 +0200
Received: by an-out-0708.google.com with SMTP id b38so210466ana
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Aug 2007 14:56:44 -0700 (PDT)
Received: by 10.100.37.4 with SMTP id k4mr2416963ank.1186264604590;
	Sat, 04 Aug 2007 14:56:44 -0700 (PDT)
Received: from ?201.21.219.113? ( [201.21.219.113])
	by mx.google.com with ESMTPS id c16sm4638206anc.2007.08.04.14.56.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 04 Aug 2007 14:56:42 -0700 (PDT)
Message-ID: <46B4F617.8040500@gmail.com>
Date: Sat, 04 Aug 2007 18:56:39 -0300
From: =?ISO-8859-1?Q?Lu=EDs_Vit=F3rio_Cargnini?= <lvcargnini@gmail.com>
User-Agent: Thunderbird 2.0.0.5 (X11/20070723)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
	<46B469C1.5060706@balister.org>
In-Reply-To: <46B469C1.5060706@balister.org>
X-Enigmail-Version: 0.95.2
Cc: openembedded-devel@openembedded.org
Subject: Re: PATCH: Use uImage make target for linux-omap1
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
X-List-Received-Date: Sat, 04 Aug 2007 21:59:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

openembedded is working for my OSK 5912 without this patch I dont felt
it is necessary.

Philip Balister wrote:
> I'm running an OSK build atm (with current code). Tomorrow, I want to
> compare how the kernel creates the uImage with the commands in the bbfile.
> 
> I tend to agree we should use the kernel build system wherever possible.
> 
> I'm concerned that we are having trouble booting various combinations of
> uboot/kernel/file system and would like to have some understanding of
> what is causing the problems. I do not want to fix one persons build at
> the expense of other's.
> 
> Of course, the "thesis" is priority number atm, so I will be doind this
> during procrastination time.
> http://www.phdcomics.com/comics/archive.php?comicid=315
> 
> Philip
> 
> Khem Raj wrote:
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

- --
-
------------------------------------------------------------------------------
Thanks && Regards
Msc. Bsc. Luís Vitório Cargnini
IEEE Member
Electrical Engineer Faculty @ PUCRS
Ipiranga Avenue, 6681 - Building 30
P.O. Box: 90619-900 - Porto Alegre/RS
Phone: +55 51 3320 3500  extension: 7696
-
---------------------------------------------------------------------------------
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.5 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGtPYXKNrSZaSIZoURAkIzAJ0UST47AGlSi2SEdupjXN9sCumYEACdFwos
1RWhnxUs0b+VMC+Z6ML2zTE=
=RszW
-----END PGP SIGNATURE-----



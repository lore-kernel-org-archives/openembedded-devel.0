Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lvcargnini@gmail.com>) id 1IH9Ly-0008FC-Pi
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2007 04:26:55 +0200
Received: by an-out-0708.google.com with SMTP id b33so156589ana
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2007 19:24:43 -0700 (PDT)
Received: by 10.100.144.11 with SMTP id r11mr2059900and.1186194283374;
	Fri, 03 Aug 2007 19:24:43 -0700 (PDT)
Received: from ?201.21.219.113? ( [201.21.219.113])
	by mx.google.com with ESMTPS id c40sm3882009anc.2007.08.03.19.24.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Aug 2007 19:24:42 -0700 (PDT)
Message-ID: <46B3E364.7060407@gmail.com>
Date: Fri, 03 Aug 2007 23:24:36 -0300
From: =?ISO-8859-1?Q?Lu=EDs_Vit=F3rio_Cargnini?= <lvcargnini@gmail.com>
User-Agent: Thunderbird 2.0.0.5 (X11/20070723)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
In-Reply-To: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
X-Enigmail-Version: 0.95.2
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
X-List-Received-Date: Sat, 04 Aug 2007 02:26:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

excuse me but I'm using openembedded for my OMAP 5912 and I  dont need
this patch for my device.

Khem Raj wrote:
> Hello,
> 
> Current uImage generated for omap1 target did not boot on my target.
> We are using manual method to create uImage.
> This patch uses uImage KERNEL_IMAGETYPE for omap1 targets. I have
> tested this on omap5912osk and the resulting uImage booted just fine.
> 
> If it is OK please consider this patch for applying.
> 
> Thanks
> 
> -Khem
> 
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

iD8DBQFGs+NkKNrSZaSIZoURAjopAJ95tKzY55rDneVEMMAzwhusDoJ0kgCgg8P6
x7PE0HgYVeQ1c91g4CSWKjM=
=gRta
-----END PGP SIGNATURE-----



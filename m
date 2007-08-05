Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IHV89-0006wK-Al
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 03:42:06 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1577373waf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2007 18:39:48 -0700 (PDT)
Received: by 10.114.170.1 with SMTP id s1mr4360126wae.1186277987828;
	Sat, 04 Aug 2007 18:39:47 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Sat, 4 Aug 2007 18:39:47 -0700 (PDT)
Message-ID: <19c1b8a90708041839r9254f4bn53123d1d098bba0f@mail.gmail.com>
Date: Sat, 4 Aug 2007 18:39:47 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B4F617.8040500@gmail.com>
MIME-Version: 1.0
References: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
	<46B469C1.5060706@balister.org> <46B4F617.8040500@gmail.com>
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
X-List-Received-Date: Sun, 05 Aug 2007 01:42:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 8/4/07, Lu=EDs Vit=F3rio Cargnini <lvcargnini@gmail.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> openembedded is working for my OSK 5912 without this patch I dont felt
> it is necessary.

I would be happy if you could try this patch and see if it does not
break anything for you.



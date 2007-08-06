Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <raj.khem@gmail.com>) id 1IHtNh-0005H7-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 05:35:45 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1940652waf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Aug 2007 20:33:21 -0700 (PDT)
Received: by 10.114.52.1 with SMTP id z1mr5196942waz.1186371201567;
	Sun, 05 Aug 2007 20:33:21 -0700 (PDT)
Received: by 10.114.208.14 with HTTP; Sun, 5 Aug 2007 20:33:21 -0700 (PDT)
Message-ID: <19c1b8a90708052033g719589f1jb50a8a8499d858e4@mail.gmail.com>
Date: Sun, 5 Aug 2007 20:33:21 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46B65255.1020101@balister.org>
MIME-Version: 1.0
References: <19c1b8a90708031735x59bf4341u736aeb19977c34a0@mail.gmail.com>
	<46B469C1.5060706@balister.org> <46B4F617.8040500@gmail.com>
	<19c1b8a90708041839r9254f4bn53123d1d098bba0f@mail.gmail.com>
	<46B65255.1020101@balister.org>
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
X-List-Received-Date: Mon, 06 Aug 2007 03:35:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thanks Philip for trying it out.

On 8/5/07, Philip Balister <philip@balister.org> wrote:
> I applied the patch locally, rebuilt my kernel, flashed into the OSK and
>   it ran fine. Basically, the patch fixes the kernel name to match the
> image type (previously I called the uImage vmlinux) this causes
> confusion with people who really understand all the kernel names.
>
> Basically, this is one of the earliest contributions to OE and I am glad
> it lasted this long :)
>
> End result, the images should be compatible, and the filename in
> deploy/images changes from vmlinux.... to uImage... The new name
> accurately describes the image.
>
> Philip
>
> Khem Raj wrote:
> > On 8/4/07, Lu=EDs Vit=F3rio Cargnini <lvcargnini@gmail.com> wrote:
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> openembedded is working for my OSK 5912 without this patch I dont felt
> >> it is necessary.
> >
> > I would be happy if you could try this patch and see if it does not
> > break anything for you.
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>



Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1QCtpK-0001Lt-5a
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Apr 2011 15:21:47 +0200
Received: by qwh5 with SMTP id 5so941440qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2011 06:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=i/54x6FY/2Ef9fX9VmmQdAgtLXP3ecP4uFy0Ugd/Km4=;
	b=fUaZRA0chcQT3ISpjcYoQPDkNkK8qo7x0Mo4PXjvuzs9zS34eM+VBDT2Ar2Bi3LGVD
	mcrnr6/z7RZbCJ7Aky5ssPxXOFy8YtTdvJaS77qBKVCmmNsXWBOOffQFOKPhqqUX0fNk
	U3ZLdlGXknVZHw8dgDlfLyx51gt2/VWAOtoqA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Tr479eIjZXpAmthO7A1CziebfGbSfunZO+ddKsEvgXIcNcAueFvdSVD9tuH38uzIwD
	v9Jf2Bx4m4f9vlru+hIvFvHfcQdvcwShmz9iE6qp11tJrC4z7e6YGmIJ2axyaLflT+Pf
	xGU02286cJ2p4Wrwf1b6Gj4rOEPc4Cf7wuagw=
MIME-Version: 1.0
Received: by 10.224.137.8 with SMTP id u8mr5674005qat.174.1303391960482; Thu,
	21 Apr 2011 06:19:20 -0700 (PDT)
Received: by 10.229.70.207 with HTTP; Thu, 21 Apr 2011 06:19:20 -0700 (PDT)
In-Reply-To: <ioormn$lho$2@dough.gmane.org>
References: <1303376052-5751-1-git-send-email-eyalr@ti.com>
	<ioormn$lho$2@dough.gmane.org>
Date: Thu, 21 Apr 2011 16:19:20 +0300
Message-ID: <BANLkTi=sWzzqgGHBX8QtUNQ=MC8dzXXADQ@mail.gmail.com>
From: =?UTF-8?B?15DXmdeZ15wg16jXmdeZ15bXqA==?= <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v3] wpa-supplicant: Build from git sources
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Apr 2011 13:21:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks!

What is the next step for pushing these recipes (wpa-supplicant, hostapd,
ti-wifi-utils) to the main repository?

Best Regards,
Eyal Reizer

On Thu, Apr 21, 2011 at 12:00 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-04-11 10:54, Eyal Reizer wrote:
> > * Builds a new version 0.8.x which is not released yet as a zip file.
> >   This version has new features like WIFI-direct used in new mac80211
> >   versions
> > * Add PV
> > * Update defconfig
> >
> > Signed-off-by: Eyal Reizer <eyalr@ti.com>
>
> Acked-by: Koen Kooi <k-kooi@ti.com>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNr/IXMkyGM64RGpERAoAvAJ9Ewn8ERjg5arQndoaD89FkGXC7gACgr4Wf
> Mrnv48tP+kBezqL3zjDSDxg=
> =pJp5
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


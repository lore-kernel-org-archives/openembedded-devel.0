Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Op0Bq-00005d-C1
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:46:04 +0200
Received: by eyb7 with SMTP id 7so2121094eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 07:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=yBgM+JN6AOmeWssssa4yzNDZCRLbyk74z8yrqWaRdVU=;
	b=DsqBjGtDtRofKi9P1/5PFmt6tVfcZ94EU0LMJHOdjZvvoBM71qhHqXjmBXeW62t4ff
	VHr9M2RtpQKbkjmJJUxzEcceft/xMGlz3kCdLxL11y22IQ7WyCY+DlItPWezUWr1Kg/H
	vVs7ZJY3uKt7EU0rSGa5voDZN2yRZRPYtol/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vlmpwuQnN8bov5rVr4sGJ3O14Sw3da0dHPeKSPq9eBvPWaqOuKLPL9ZjjNupekKtSv
	rdRkEcX9cnoE2GOithGxaW073L8GUThsMaSna9VRz2yNwI+Wozn8hRiZRT2YBJYk30kX
	f1RIVXprn83pdp6dBkJ9cImnhvTBs/jHPTp70=
MIME-Version: 1.0
Received: by 10.216.49.212 with SMTP id x62mr937724web.55.1282920330866; Fri,
	27 Aug 2010 07:45:30 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Fri, 27 Aug 2010 07:45:30 -0700 (PDT)
In-Reply-To: <AANLkTi=VbHxv0hejLkjjXzJFtX+Kuyf=xU+4ty4TLKxr@mail.gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
	<4C76CD2C.2090102@mlbassoc.com>
	<AANLkTi=WnKFoiutD+vZHEQLDQzmFnhdrUMjYrvc_MNam@mail.gmail.com>
	<AANLkTi=cBDtFg9=GvPu0t01hVOhO=4uS5kwSAqLT+cax@mail.gmail.com>
	<AANLkTi=HYU2iy923icHth=5zo1cvJOUTQxk+EK2kPVWQ@mail.gmail.com>
	<AANLkTi=VbHxv0hejLkjjXzJFtX+Kuyf=xU+4ty4TLKxr@mail.gmail.com>
Date: Fri, 27 Aug 2010 10:45:30 -0400
Message-ID: <AANLkTik-MOYXwUuyJpq71uGGAWLa=fcuThbGx1FYNJCi@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Fri, 27 Aug 2010 14:46:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2010 at 2:50 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:

> Wrt the wiki page
> I'd day remove the last succesful build column (or add a new one).
> The new column should mention the last build. In yet another column we
> can then add the reason.

> E.g. currently khem has a ppc qemu thing where it says " =A0 =A0 =A0 =A0f=
ails to
> build sed ". Next tuesday it will be unclear if this is from last
> monday's tree or this monday's tree.

Done.

> Also i would suggest that everyone who participates builds with
> tinderbox enabled, and (at least in case of failure) adds a link to
> the tinderbox log.

Good point -- I added that suggestion to the wiki page.

> And one more question:
> The wiki pages says: "All volunteers start clean builds for the
> combinations they test,"
> I have some platforms that are quite identical (eg sheevaplug and
> openrd; both marvell/kirkwood based). I have no problems testing for
> both, but as they are both armv5 and use the same soc, compiler etc, I
> kinda feel this as a waste of time. I think I would prefer it to do
> e.g. a bake for sheeva, followed by one for openrd (without a clean
> inbetween) to verify that the openrd specifics (probably only u-boot
> and kernel) work.
> I can imagine for the various omap3530 variants (beagle, overo, ...)
> this is also the case.
>
> (thinking of it, if cpu cycles/time an issue we could decide to pull
> some packages (e.g. some of the native ones) from pstage)

Agreed, I clarified the wiki page to say:

"All volunteers start a clean build and build the combinations they
test, update the above chart, and report status/issues as replies to
the above email."

So the clean part is singular in that we want people to start clean,
and then build as many targets as they test.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com



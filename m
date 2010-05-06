Received: from mail-iw0-f171.google.com ([209.85.223.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1O9vLj-0003Ws-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 09:18:26 +0200
Received: by iwn1 with SMTP id 1so6746582iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9C38CYAbsqSQqOwyNXBhxXZ1QsUNX93XkKu74NrSDHs=;
	b=NbnLC6+mvjj350ljLmdahTZXY5Y6Bg0FovtZs3p8SeFqHPGSPOJsx3cw2lJSAVTJ+n
	zG3q2o+hcpPuHzgPF/OBk5ex+r6Nzn4o3zHJ41J82c86rP8LuZ/02+0EP5b7buAmUhp2
	fRvBZ9a1KZH3ppnfGC2ZjQsBQcrubF45ZPDbk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qUAiDMFeaG5+ozpXh5Gf4atbgMh2QP4vonG28umOTDkqtCOainpotS9Jc1/ZZ+Bmpe
	KCHCglrdp1jorJ0paUCspUzcGmBYsGbnfp5Lvo502NXOuWTH1opd23qWufJEQoVcq0Sm
	EckQ8vtDC1wb/YVk3bmbGvNC9sVlNhub3DG2k=
MIME-Version: 1.0
Received: by 10.231.167.208 with SMTP id r16mr984763iby.57.1273130073030; Thu, 
	06 May 2010 00:14:33 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Thu, 6 May 2010 00:14:32 -0700 (PDT)
In-Reply-To: <hrto50$gqu$1@dough.gmane.org>
References: <1273102999.5743.49.camel@rex> <hrto50$gqu$1@dough.gmane.org>
Date: Thu, 6 May 2010 00:14:32 -0700
Message-ID: <w2u19c1b8a91005060014xcdf7b4b4j8cfa3c09900626e3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.171
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Thu, 06 May 2010 07:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 5, 2010 at 11:38 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 06-05-10 01:43, Richard Purdie wrote:
>> I finally felt the time was right so I've merged the work-in-progress
>> branch I've been talking about to OE.dev. This contains various
>> architecture improvements and legacy staging cleanups that have been
>> used in Poky for a while with great benefit.
>
> Khem, can you fix the gcc 4.5.0 recipes, Richard didn't convert those to
> the new style gcc stuff. It should a matter of shuffling includes around.
>

yes and I will also have to do eglibc.

> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL4mPgMkyGM64RGpERAr/PAJ9dN6l44gHs7cK6PApqxt32Iq2fkACgjEb4
> wqrN1+xlKp8Ps2o+lOdWfl8=
> =pMUA
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



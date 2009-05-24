Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M8LdK-0003e4-P8
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 23:53:30 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1556243ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1U3SnA61Ymj7UClYU5JScn+1wGE7+B3xQGBcrCpX8Wk=;
	b=VW4N9w6wajR4H7L7RyOOLSq1Fkcy2T2Q5qSmJDjRaAU+8FLKNUYRt6AxUvqqIcf32g
	57Kt89uA31O4i1hVir50FhaJW1uqoQEicqwnuTtqAXSt3kwC5f56MEpXhVTVw6dt6srX
	oUSqMnksrVMZd8+2fotUYYETsJpzhlTCAE9yU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LFvVh3AtWdAV4a9yfFKrn/OdMa4RUbjtSK8DNXqxec72oeelrq8O4Fc34v70b4DRBq
	tmOYIVwgmVz4zTwSIGA6lcQ/UmO6V+m97RFgRLIc8j/wNY8F6uej6rB8T8d/hIsaLhoj
	KXbKtlxa9Dsmrq+NWqRxMLO12u0bFjSNzPnNY=
MIME-Version: 1.0
Received: by 10.100.14.2 with SMTP id 2mr11239553ann.68.1243201534785; Sun, 24 
	May 2009 14:45:34 -0700 (PDT)
In-Reply-To: <1243157020.4226.124.camel@lenovo.internal.reciva.com>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
	<1243095832.4226.105.camel@lenovo.internal.reciva.com>
	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
	<gvb066$tov$1@ger.gmane.org>
	<1243157020.4226.124.camel@lenovo.internal.reciva.com>
Date: Sun, 24 May 2009 23:45:34 +0200
Message-ID: <c384c5ea0905241445x4c0636d8u43c4561c9c58b9e4@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 21:53:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

On Sun, May 24, 2009 at 11:23 AM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2009-05-24 at 10:23 +0200, Koen Kooi wrote:
>> Now, if people posting in this thread would bother to read the original
>> RFC (that got approved for .dev as well as stable/2009), we wouldn't be
>> having this discussion.
>
> I guess the RFC in question is this one:
>
> http://projects.linuxtogo.org/pipermail/openembedded-devel/2009-April/009=
578.html
>
> but it doesn't seem to really address the issues that have been raised
> in this thread. =A0Indeed, looking at the responses that were posted to
> the original RFC it doesn't seem at all obvious that there was a
> consensus in favour of the patch; Otavio Salvador said that he was
> "fully support[ive]" of it, but everybody else who posted seemed to have
> some or other reservations.
>

Can we use [HEADS UP] in the subject line when an intrusive patch has
landed in .dev, apart from the RFC?

I will write a RFC for this one. :-)

Regards,
--=20
Leon



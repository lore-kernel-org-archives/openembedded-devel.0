Received: from mail-iw0-f189.google.com ([209.85.223.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NffiZ-0001Eg-Gq
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 21:32:58 +0100
Received: by iwn27 with SMTP id 27so1622346iwn.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 12:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zyw3i7j+yXKiqeUm/6EkEeq4Lax+Z/Xt/jG1+nQI6Fc=;
	b=u8IrHR0MZe6FIYvi7m6TP6ygVU0lftmmoKVgIYPCy2c8/qPcVYmXHRxs34bR+lYZWa
	lKe+3yEV5M7gPXcvBkVIec5WEVuSVODTMa50gE+DbSCV5sxkfT0x8Cc4o6MvlowxhTqb
	lC7ReNvhe9rxoAVLKGh1XRcx7rRb+3ExPXR+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l+8Z+Z/CiXmTnbXq961rYpf1p81roIWniZ5jzmBrgcmtwsY4eO0R6al0ea8672GxZc
	U6FQqHgKSx1tz5fUUW9T1dE2uIwZ/me16PQX8qaay1R58iq7HjJt9cH5tg7M4miazJ/W
	SiKcfzaIASfpattO7a8VNblQYwL+mDDCpb1vM=
MIME-Version: 1.0
Received: by 10.231.149.10 with SMTP id r10mr558227ibv.63.1265920219373; Thu, 
	11 Feb 2010 12:30:19 -0800 (PST)
In-Reply-To: <hl0eb2$j9c$1@ger.gmane.org>
References: <alpine.LFD.2.00.1002101712580.4390@localhost>
	<19c1b8a91002101504g4a35ef13w50eb66548d8188b@mail.gmail.com>
	<19c1b8a91002101531v17e4421cp76126722c3f09f97@mail.gmail.com>
	<hl0eb2$j9c$1@ger.gmane.org>
Date: Thu, 11 Feb 2010 12:30:19 -0800
Message-ID: <19c1b8a91002111230n1fdca526r9d4b8a8ad0f8d97a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.189
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: freshly updated u-boot has malformed patch
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
X-List-Received-Date: Thu, 11 Feb 2010 20:33:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2010 at 12:15 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 11-02-10 00:31, Khem Raj wrote:
>> On Wed, Feb 10, 2010 at 3:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Wed, Feb 10, 2010 at 2:22 PM, Robert P. J. Day <rpjday@crashcourse.c=
a> wrote:
>>>>
>>>> =A0beagleboard image as usual:
>>
>> hmm I guess I should have read this line. Seems like beagle is using a
>> revision which already has
>> this patch applied. I will fix it.
>
> And a lot of other machines I maintain as well, so for the time being
> I'm going to revert this patch till someone actually boot tests this on
> all affected machines.
> I object to this untested patching of bootloaders.

indeed please go ahead.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLc7yjMkyGM64RGpERAmJqAJwMllh7QS+rKsxPJTqxleLh2JDDSACeNY7P
> H4BfSD/udzhExoEGSGorbeY=3D
> =3D2Wl9
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



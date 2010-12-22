Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVW7f-00089g-TE
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 22:21:24 +0100
Received: by iyj18 with SMTP id 18so4657664iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=m+jqMX4DY+kzBmQ2wJEv+zQsaaeiq/TfANYAL1gwa1E=;
	b=ghWUt4xEAqdaNeh+6lDwrcy2/4ujEgs/c6hNtMX/dbY2sEjI1iYARUp6bwRA4zjAgU
	SxjfP9jIx6zQ6F4CWS0mNBClGk0aX2cjjHwy29T5LtBPmTlajEZVpXH9SkUb72hdqSzs
	UwSkNcnvi6bIFPxy6BRLq/TYILVOWmeaz2/TU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vxQvb0sqcaxnSjQX2qs25q70ZceDSHEhPabMUtowzRTxG9znpswupY1wM/mietyM14
	no3qCc9jrlXtl97Mb+clhqcFHH2XuFbQTajj8BmYtPU5q7tEzwaFJOl2oGF0y+HiIgjU
	jYTvVBD8icsoyPFP3VAF1Lhdt1i/BRUDHU7V0=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr7459278ibc.7.1293052875416; Wed, 22
	Dec 2010 13:21:15 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 13:21:15 -0800 (PST)
In-Reply-To: <4D1259F7.9030905@mentor.com>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<ietk2q$jdr$1@dough.gmane.org> <4D1259F7.9030905@mentor.com>
Date: Wed, 22 Dec 2010 22:21:15 +0100
Message-ID: <AANLkTinDY14RwH=Sg8auvLmmpJ00u91jaY9aoXxaaCsC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 21:21:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/22 Tom Rini <tom_rini@mentor.com>:
> On 12/22/2010 12:38 PM, Koen Kooi wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 22-12-10 12:14, Koen Kooi wrote:
>>>
>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>> ---
>>> =A0conf/sanity.conf | =A0 =A02 +-
>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>>> index 0f53cb2..1c83c14 100644
>>> --- a/conf/sanity.conf
>>> +++ b/conf/sanity.conf
>>> @@ -3,7 +3,7 @@
>>> =A0# See sanity.bbclass
>>> =A0#
>>> =A0# Expert users can confirm their sanity with "touch conf/sanity.conf=
"
>>> -BB_MIN_VERSION =3D "1.8.18"
>>> +BB_MIN_VERSION =3D "1.10.0"
>>>
>>> =A0SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
>>> =A0SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
>>
>> If people are agreeing, can I get some Acked-by lines please?
>
> I agree with the concept but I want a patch that says 1.10.2 once Chris
> releases that hopefully later today.

I second this.
Frans



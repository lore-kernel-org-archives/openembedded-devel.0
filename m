Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1PFB1f-0006vJ-Vh
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 20:35:41 +0100
Received: by qyk7 with SMTP id 7so3979899qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9+PYTykLvU8MYySgAHquJvpaSGkHskQ3WOil+VzR4ds=;
	b=An6qqlIAvHydR9BKbb5Y3FjMLu4OYx0dlbR0rcpTaM95G6enkwwXu/OYVUxGu6pIwz
	5zzM2pXSeWBpWo8IddDJ90PT4u5SVm8vthFEuGrziqdQbm8KW/zLjo1qvRCQrsb77NsL
	s0fNWQElbzBYV/eE8jl4wdNvHGtXFgmGNE90o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=t/PY3I79BL5cgVN+re6L6zSHmQekBXYPUE9gpvVtxH58BxuWWIvC7xuo+FHnYf26j3
	o54lCPeyLUIKwkagRxZZXNO8leTjcJLZtNZjLmQlsFxk4Z1TbXLl+Xyx15RUkV5baLU7
	isIFkA5CCpxEVEoHBOxh2A1wIxrgMrpv2hKwA=
MIME-Version: 1.0
Received: by 10.224.200.135 with SMTP id ew7mr3003257qab.210.1289158480632;
	Sun, 07 Nov 2010 11:34:40 -0800 (PST)
Received: by 10.220.176.74 with HTTP; Sun, 7 Nov 2010 11:34:40 -0800 (PST)
In-Reply-To: <20101106140856.GF6691@excalibur.local>
References: <1270558697-19222-1-git-send-email-mchazaux@adeneo-embedded.com>
	<n2kbc36f8ed1004160804j3610d311k55c328811e1657e2@mail.gmail.com>
	<20101106140856.GF6691@excalibur.local>
Date: Sun, 7 Nov 2010 20:34:40 +0100
Message-ID: <AANLkTikGVk0nVTgzb+JnOnw0vubRj+coAui6h48ao8bg@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Sun, 07 Nov 2010 19:35:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/11/6 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Fri, 2010-04-16 at 17:04, Mickael Chazaux wrote:
>> 2010/4/6 Micka=C3=ABl Chazaux <mchazaux@adeneo-embedded.com>:
>> > From: Micka=C3=ABl CHAZAUX <mchazaux@adeneo-embedded.com>
>> >
>> > This patch adds support for the i.MX25 3Stack platform.
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0It is based on the patches released by Free=
scale as
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0part of LTIB.
>>
>> Any comments on this patch?
>
> Sorry for the late reply. I'm just going throught our patchwork backlog a=
nd
> found this patch. It does not apply anymore. Care to update and resend it=
? Will
> apply it then.
>

Wow, I forgot about this one. I no longer work for Adeneo and thus I
have no more access to the hardware, so I won't be able to test it.
I'll do the update when I have time.

Regards,

Mickael Chazaux



Received: from [209.85.219.212] (helo=mail-ew0-f212.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <methril@gmail.com>) id 1MaUZZ-0005Jc-6N
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Aug 2009 15:05:57 +0200
Received: by ewy8 with SMTP id 8so2338757ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bxW+vwJEtNGcfxpf2gNeMKsptT6D0tBb8LjibtzXDgo=;
	b=qrbLyvLSJtCnM5OwLO3BQUZHEqnpgvOyGlWexN7jzQCGj+UOB7Bpi4tKSRExZkaFv+
	UVAcui4izIkHNFj7iOfy23SmM7hK7n7KMyZmIEZYt2V9mm4QUkfGtS4el/cp3ogAvWvq
	C0i7gd0ma9ja3GTg69jcwpipzjA+KmkNZ8LWs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=sjQHSvJ1L3u7OPXrwQncfVvftE/cd6cimnGqL+JCVCHEshn3Gr+qR0yeIPnbULdzhJ
	eF0xW/0BpZoiJKGXa/jyAHiFB1MYSmjIHvYUrIskNMAVheIFIW6qbD3fPqK+7LoEu0CH
	EqspR0KzdhvCtVIoVBVAI+AX+E9LNIk8Qaa9w=
MIME-Version: 1.0
Received: by 10.216.88.6 with SMTP id z6mr912526wee.52.1249908583772; Mon, 10 
	Aug 2009 05:49:43 -0700 (PDT)
In-Reply-To: <200908091516.11483.holger+oe@freyther.de>
References: <1248208656-9496-1-git-send-email-methril@gmail.com> 
	<b84dee3a0908090342h2e6cecf7v812be48974d049ab@mail.gmail.com> 
	<200908091516.11483.holger+oe@freyther.de>
From: Rafael Campos <methril@gmail.com>
Date: Mon, 10 Aug 2009 14:49:23 +0200
Message-ID: <b84dee3a0908100549te9101a3l86b5b85b325f6dde@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] Update the em-x270 machine to work with linux_2.6.23.
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
X-List-Received-Date: Mon, 10 Aug 2009 13:05:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2009 at 3:16 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Sunday 09 August 2009 12:42:57 Rafael Campos wrote:
>> Ping
>>
>> have this message some issues =A0to not being included into the OE repo?
>
> No problem, just hard to review. Could you use git format-patch -MC --fin=
d-
> copies-harder? This should reduce the defconfig change and patch to a mov=
e?
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

New patch sended as you sugested.

Regards,

--=20
___________
Rafael Campos
o0 Methril 0o
http://openblog.methril.net/



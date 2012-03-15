Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S88nF-0001We-SB
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 12:24:29 +0100
Received: by vcbfl13 with SMTP id fl13so3381652vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 04:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Q1ySV3mzbrLJImyIozavxUig3T9w+mPquCCHzW93Mzs=;
	b=vGYerU63PyZEUisNvZgeOhllZM1tbOvyrBzXD5NvwYoBeUk0FmU0Ki/hghXe/a2HWn
	5157ua11OFKfYXBHhRabKfBPGzDpdp7sP6xoZ3O4Gs7eFkSM/KVcS9dG6dACwUDnyQVv
	lXiFTV1ZA5vawPzklKkV97+AAgZ+p/R+rYfoqnzzRfD2V0rkGNTg/VJ+I1J1AdjMarmS
	0Hqk62m8s3AFx5tlWoAhc+YSpi+l5V+VTVZuPXIeu6IrWWgvsyqpgYcB7F/U2aNrZBYk
	+T3nwYg9Wa5JceYJsMO4GEx8UqaWkqYEODL2yQYoN/aYvn9lQjVMpaXsM9irpyaaC/G9
	J5BQ==
MIME-Version: 1.0
Received: by 10.52.240.177 with SMTP id wb17mr4412476vdc.63.1331810142964;
	Thu, 15 Mar 2012 04:15:42 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 15 Mar 2012 04:15:42 -0700 (PDT)
In-Reply-To: <4F610B38.5060309@dynamicdevices.co.uk>
References: <4F610B38.5060309@dynamicdevices.co.uk>
Date: Thu, 15 Mar 2012 08:15:42 -0300
X-Google-Sender-Auth: 8JBhIsiCaguZJ_VpyKdtzour4OA
Message-ID: <CAP9ODKo_RMjJ1BsP9QQHJY8xwmRzBie3L0DuB1e7jr=N_kuekQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org, meta-fsl-arm@googlegroups.com
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 11:24:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

[ added meta-fsl-arm on CC ]

On Wed, Mar 14, 2012 at 18:18, Alex J Lennon
<ajlennon@dynamicdevices.co.uk> wrote:
> I'm trying to begin the migration from oe-classic to oe-core, focussing o=
n
> Freescale's
> i.MX28 and i.MX51. I recall there was i.MX28 kit being demo'd at FOSDEM b=
ut
> I can't
> seem to find support anywhere for the i.MX28, which I thought might be in
> meta-fsl-arm?
>
> Can anybody point me in the right direction? (I've half a mind to try add=
ing
> the support
> into meta-fsl-arm myself but that would seem somewhat wasteful if it's
> already been
> done)

I am working on that; my current work in progress can be seen at
https://github.com/OSSystems/meta-fsl-arm/tree/wip-imx28 and it
shouldn't be assumed to be working yet but once I get it more or less
finished I ask you guys to test it as well.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



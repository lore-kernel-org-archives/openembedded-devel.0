Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QMJ9U-0001nW-6s
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 14:13:28 +0200
Received: by bwz5 with SMTP id 5so457212bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2011 05:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K/4ZB60oRhz6XEWGagMkRNatp/qfzFzciPKWe82c51E=;
	b=x31hqT6lShT48wyOS2fUHTSS8CHLUxa94vm1iye20Y1R1EuNKPLAIpazsj0AlccanZ
	SqZ9gztuJIdw1xDUDjcp141sA6kllx4VedwsjWNsiGbxDgSlosDUPKBe13IKC9lAEY4s
	2gUZ5SK8F1Oq6hcImYhCLkAzCcUhT1APN4i7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=cE1qAWJdkLqeB5mnz4TjqTgxYrTooGJusEkDHrgbvQEGmfMUvNYA7gHABR0fIZ/rqN
	h6Gw4iRIrMZupo8b0ibBGQsJBPvJbcGNpOo74n+JmSHnv33pG6EviNYS8G/KKaedyZvF
	pGSLJTCI89DMOUY3/uRlcbsMRprQes/1zY2C8=
MIME-Version: 1.0
Received: by 10.204.7.209 with SMTP id e17mr585253bke.162.1305634234732; Tue,
	17 May 2011 05:10:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Tue, 17 May 2011 05:10:34 -0700 (PDT)
In-Reply-To: <iqt58k$59d$2@dough.gmane.org>
References: <1305578605-17041-1-git-send-email-otavio@ossystems.com.br>
	<iqt58k$59d$2@dough.gmane.org>
Date: Tue, 17 May 2011 09:10:34 -0300
X-Google-Sender-Auth: taa2_CxpG2SYqD-qYyBFQvqWIME
Message-ID: <BANLkTimb2BJc7jXqC5sHcaqjpQWUZ2dtMg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v1] freerdp: update to 2011-05-16 snapshot
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
X-List-Received-Date: Tue, 17 May 2011 12:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 17, 2011 at 03:40, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 16-05-11 22:43, Otavio Salvador wrote:
>> This version includes major improvements since last version
>> packages. It also had the plugins packages redone so they can be
>> choosen depending on the environment needs.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> This one doesn't have the colourbug you mentioned earlier? And it
> doesn't need xprop anymore, right?

Correct. Please merge it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



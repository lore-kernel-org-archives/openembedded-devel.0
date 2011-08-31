Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qyk4w-0000Ev-7b
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:39:38 +0200
Received: by bkbzu17 with SMTP id zu17so748264bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eIIifHGsZFqnaCU4ybqA/JIh0YjLgsptv3LhRQozn58=;
	b=LmjvSu0pPgibTXQv8V+xIlgrWV/kix4/uPdE7lAgQxhetnCUhf2SloKbUHOIpYeKKx
	SvztKPXP1DbCXJb0a3oRnEKBDozSaDKDHGnKj5+FKADvex5u/MV59Y/TfxwdCF6Gau09
	EyMUfIVO11LU0Ibwb/Z2L1jvaMN9SMQWrjlLs=
MIME-Version: 1.0
Received: by 10.204.138.138 with SMTP id a10mr209299bku.264.1314794083170;
	Wed, 31 Aug 2011 05:34:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.156.217 with HTTP; Wed, 31 Aug 2011 05:34:43 -0700 (PDT)
In-Reply-To: <j3l8ni$kr3$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
Date: Wed, 31 Aug 2011 09:34:43 -0300
X-Google-Sender-Auth: Tkp36XEqkK2BfIJBUx0DFwIr8sc
Message-ID: <CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:39:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2011 at 09:16, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>>>>> please remove PR in new recipes
>>>> Actually I would favor to leave them in.
>>> Well I don't, and atm I decide if it goes in or not.
>>
>> To sad. It's a lot easier to remember to bump the PR, when PR actually i=
s in the recipe. Thus, including PR=3D0 will often remove one issue with pa=
tches.
>
> That's what review is for, no?

Review is to check for mistakes and dropping PR from new recipes just
makes hard for new users and put more work for people to review.

Please accept PR =3D "r0" on new recipes since it makes it more
consistent and easy to new users.

Regarding you being the person who merge things does not make you the
only one who does it. Remember we can easily fork meta-oe and start
another layer and marketize it here for users. Besides, we (OE
community) can ask for your permission to be revoked and also fix the
issue. I prefer if you refrain of being so arrogant sometimes.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



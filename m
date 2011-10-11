Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDie9-0003E0-5a
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 22:09:53 +0200
Received: by wwf27 with SMTP id 27so9089188wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 13:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Fj7H3Gtl5cSchqr1lknfIsC+fSbDzR5n6yWps6zh/N8=;
	b=IAGiAKo0lUqEKKvOOTCNQKZN2qPgnLFH01kpVst6rSpxVmPUmQog+mcVSMMUu+m/No
	mcHpC2epXPSqmxTe9f1hs894AyB2TgG8fVyM87hqyfG/aAJ9CJ2pZh3o1fqQC2WNhXww
	fIh1/n0R3mjc3/b2dPvFdYTsi8SX7XqJ79vQ8=
MIME-Version: 1.0
Received: by 10.216.166.70 with SMTP id f48mr1583957wel.38.1318363451432; Tue,
	11 Oct 2011 13:04:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.138 with HTTP; Tue, 11 Oct 2011 13:04:11 -0700 (PDT)
In-Reply-To: <CAP9ODKoNWxn0yt8yc0sy0yyCKiH4LCSYUsibTA_4kX24cV7j=w@mail.gmail.com>
References: <cover.1318362324.git.otavio@ossystems.com.br>
	<2d40bd35a2ecf2ac49a66a09656c7319aa811c98.1318362324.git.otavio@ossystems.com.br>
	<j726u5$8ta$1@dough.gmane.org>
	<CAP9ODKoNWxn0yt8yc0sy0yyCKiH4LCSYUsibTA_4kX24cV7j=w@mail.gmail.com>
Date: Tue, 11 Oct 2011 17:04:11 -0300
X-Google-Sender-Auth: LKdzYuL1Kt14VaRBsTUhoGe2uN8
Message-ID: <CAP9ODKoxwRrbF-mhZtV-4UX=eieRLb+Sy2iff=qT8vWsLiEy=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] xserver-nodm-init: exit 1 only if systemd is installed
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
X-List-Received-Date: Tue, 11 Oct 2011 20:09:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2011 at 17:00, Otavio Salvador <otavio@ossystems.com.br> wr=
ote:
> On Tue, Oct 11, 2011 at 16:54, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>> While you're at it, please change it to ${base_bindir}
>
> I can do it but don't you want to do that and amend it? If you prefer
> I can send a new patch but dunno if it is worth it.

I fixed it on my github branch, you can pull it from there fixed.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



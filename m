Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUoqr-0007go-Mx
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 02:45:57 +0200
Received: by vbbfr13 with SMTP id fr13so1350886vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2012 17:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wDUhUri4d0F9aOc569sTaUU/xS9TXwV0O/aIzpiY5+k=;
	b=G8b57LMEUiVIfn8yPJfQByECs5iepxZCx/1WhsOPl2lIAEtwqI340cuB5wZX3PhZyk
	7Dnffn/oLpHfWPm5aCk2VRFX/iQf9jnSTCNZLoE12GgA2UJCcl1B1h34XI/7B8XI4iPy
	xwE2g/WXCJ3OxVLY9D7Iqcu6BNWtjz+jxkg/4vFcJeO56J9LmRMmLGdq04GpIXxEYc/3
	C7Gaxb6yB0wrml7BN1h9GIIAEBrbPd1LIzkfZK2q5irJz9smeSVwphg2ECuw/gX1uGUf
	x+31VdJYMDwxVCRqFSFDIIlg/SH1dZltNf5r9G1MNpogbsYQv9DOAnXyumrru/mlOTJM
	tkGQ==
MIME-Version: 1.0
Received: by 10.52.99.132 with SMTP id eq4mr3178963vdb.19.1337214955353; Wed,
	16 May 2012 17:35:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Wed, 16 May 2012 17:35:55 -0700 (PDT)
In-Reply-To: <CAMKF1srRxYjck6k5uTgBzvcpr7K1CqWAumqbD1vk3T20=Aa9Xg@mail.gmail.com>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
	<jove3h$7qg$1@dough.gmane.org>
	<CADZ6=auuzv9dF1p58wVXPFdckBUmgk6nmucnarWpqdxMbyHpaw@mail.gmail.com>
	<009001cd33a6$3cc91050$b65b30f0$@slingshot.co.nz>
	<CAMKF1srRxYjck6k5uTgBzvcpr7K1CqWAumqbD1vk3T20=Aa9Xg@mail.gmail.com>
Date: Wed, 16 May 2012 21:35:55 -0300
X-Google-Sender-Auth: xzVnOiyrzEgWiXreGd4nmLjQhco
Message-ID: <CAP9ODKqRVKEHmbDBVWF1rCt-qwH0_e45XVQOjj+bn3yPoVX+og@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Thu, 17 May 2012 00:45:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 6:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I have had systemd work with 2.6.34 Koen has some options he mentions
> you need to enable in kconfig

Which udev?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



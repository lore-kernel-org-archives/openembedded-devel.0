Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PltKr-0001Jh-Et
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 02:22:41 +0100
Received: by bwz10 with SMTP id 10so3699428bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 17:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TQ/lDoyWdqa2dY/UJFeTR/lWNAUxVYC+CcEgnYCu0Ok=;
	b=ewKtmHa7BW9TbXG+HQB2Tla3pjt9f4jlRXrJ8mNcy8jpfNM4FBt0cYmaD30ZgmuqcL
	w6Jo2PgDDQnymYHkCXCfN/nUufQR9daO4g4g23fPhKUPQ/AmZHn1+mlZzRtjvUqOsOEJ
	Bx3dpmahgrnkokT/Ix4aDHsV2MLJO4bZbpQQs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=g+0Et13eT4kISw4+hzkZGFzrsckGR6d1Cb0UsAf4f9La4tMMs2Wb9cd1dKpKyYvoo5
	92linnIdngW0SuFcYLAnxSn1vPmVnhFsvtThueUNLG+QXRkjcvodFuITC/rwSeMzP0cn
	BW2ZgIu90GG2IgcSkcGC2cdF3HxlxETrgYzwk=
MIME-Version: 1.0
Received: by 10.204.54.69 with SMTP id p5mr7929345bkg.82.1296955300305; Sat,
	05 Feb 2011 17:21:40 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.56.135 with HTTP; Sat, 5 Feb 2011 17:21:40 -0800 (PST)
In-Reply-To: <AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
	<AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
	<4D4C1464.4030609@mentor.com>
	<AANLkTi=o+QW-K2VG7WBFFTrshxhD1TDMbqx=EbTxDj5h@mail.gmail.com>
	<AANLkTimO7SQU7k=3ACn4K4wSOwRWkvoV-Tnvn2FFVW63@mail.gmail.com>
	<AANLkTikXULU=UyfomMr_GVx5o1GieZrRxDZET3QF30px@mail.gmail.com>
Date: Sun, 6 Feb 2011 01:21:40 +0000
X-Google-Sender-Auth: NUCbHc2t2mLGOq_1M4NOXTPpFg0
Message-ID: <AANLkTinwGvKALxGwacSnJhKf+7wWxwpn018fRD=EL7nZ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Sun, 06 Feb 2011 01:22:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 5, 2011 at 13:35, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/2/4 Otavio Salvador <otavio@ossystems.com.br>:
>> I can work on cups next week (I am on VAC right now).
>
> Actually the cups thing is the one I would feel fairly comfortable with.
> The question here is mainly when/how to drop the DP =3D -1.
> A pinning of 1.4.4 is already in my local.conf for quite a while.

In fact I have a more mature recipe in our company tree and I can
share it, for sure. It builds a splited cups package but I need to add
a meta-package to avoid breaking upgrades from other distros.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



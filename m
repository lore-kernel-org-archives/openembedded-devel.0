Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRTaC-0001uM-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 20:22:25 +0200
Received: by bwz5 with SMTP id 5so4453691bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 11:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JoFOniRD3I8gAhxMR0z57IZN1K9LObGIqr7ZXHr4jhk=;
	b=C8FBATsibi0isOHP6GO7KWnW8iqvPvi3m3/xQVLXwPwSJFbS/QSg4YfW/N7YoBUjv4
	lKRZQ4M+GPVtz0Dx/uDEwlcvYoRzyB3oRbPaMS4qlIqvEpyAIoq9eZ/6Ce31lBkQJaMO
	831J7nt9UIeTYAbURgPm7ett2Zpw0BkSuQNMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=J2mz7JZwiOcBCmBai+aFUTXl70VQQQanzxaMjvk5eZZ4njTxH01qQ5Sv4ESYl8UMVb
	Scqjpc3RJiqKIu1tFZG/lyZSqHYqlHdn4hR8eRauEdUXgFRVyU/0e/zbHM2OONNgLFJT
	p42UbGsTf5oNITYZ+ofWa+S2TAYB+jndbEdoI=
MIME-Version: 1.0
Received: by 10.205.82.67 with SMTP id ab3mr5680570bkc.166.1306865955119; Tue,
	31 May 2011 11:19:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Tue, 31 May 2011 11:19:15 -0700 (PDT)
In-Reply-To: <is38b0$k1j$1@dough.gmane.org>
References: <BANLkTi=qZLnR+PJX7yV+=MnD=rkNJAh9Cw@mail.gmail.com>
	<is31co$63t$1@dough.gmane.org>
	<BANLkTimE2Y=zrWtyWPKekDeUpcmdfFNENA@mail.gmail.com>
	<is38b0$k1j$1@dough.gmane.org>
Date: Tue, 31 May 2011 18:19:15 +0000
X-Google-Sender-Auth: 81j2hNssDbggQMZ09vMr0vi5GY8
Message-ID: <BANLkTi=C56_ztMy5NnWv9KyOgL2VbVrN7Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] udev 171 is broken
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
X-List-Received-Date: Tue, 31 May 2011 18:22:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 17:25, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
...
> I was thinking of putting it back in, could you try creating a rule with
...

I didn't try it yet but seems logical to support it out of box.
Otherwise udev could rrecomends udev-extra-rules so it also works by
default. If someone put it on bad-recomendation then he/she can handle
it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



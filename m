Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QB9Xz-0000PO-Lo
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 19:44:39 +0200
Received: by wwb17 with SMTP id 17so3625209wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=7AgB+HdPr77CmjMFAOoxw8zp3M75UO4yoRJF83rn1t0=;
	b=wxdZ+If43W5ZwROL3ezlpt7FvtfeJRwpAbUg2FySn/HhxM+Bq1BJFQdfyF5m8w9JYB
	Nyg7o1494dv0itNOI6fLiL7FYX19sOwto0xE4/PpljhXP82ZsWMJ2u5Qhl/GtoA03Xer
	rhChiA/HTWMkMcohrgXkiQAr3Np/FNyL+J234=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=DpWtk8UoyS0tOsGLXPLXJjNoOvPLZmVml4/i8SfhzrwzmE/iWSv1fO/Smk/bIlxwcd
	fEbuWTO8cMiUxe8QMK0aFPIqgVmZjBKH00dhONLzz5J+Wy4JfFbjzTy68fPkziK8cXsY
	j7+sF/N/p3csdw5uFjx9yodqzI2IVyy0JcPLw=
MIME-Version: 1.0
Received: by 10.216.159.141 with SMTP id s13mr3235960wek.17.1302975740953;
	Sat, 16 Apr 2011 10:42:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.46.207 with HTTP; Sat, 16 Apr 2011 10:42:20 -0700 (PDT)
In-Reply-To: <1302942561.8709.7.camel@mattotaupa>
References: <AANLkTimSjWURf8gMrVZGd==xCH3jnWEG_=G8EMfsdbW1@mail.gmail.com>
	<AANLkTimPz8ji6Lo-Yh2DmRUc0=A-EwePxre6GiTss2=V@mail.gmail.com>
	<AANLkTi=pcOHKF78X_uezE9Yqj9m=TLT5FPsWePp_Vs11@mail.gmail.com>
	<1302942561.8709.7.camel@mattotaupa>
Date: Sat, 16 Apr 2011 14:42:20 -0300
X-Google-Sender-Auth: WDZMYadhoSYYWMnjwo-YPBVSzxE
Message-ID: <BANLkTink-co5TWFr1nJF0cqPueXESs51xg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: Re: work flow with pull requests (was: Pull request from O.S. Systems tree)
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
X-List-Received-Date: Sat, 16 Apr 2011 17:44:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 16, 2011 at 05:29, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> So I would conclude that using both ways =96 as for example Otavio is
> doing right now =96 seems to be an optimal(?) solution.

I am trying but it has not worked so far. Most patches I sent mailing
list are still not applied or nacked.

If you check at
https://projetos.ossystems.com.br/git/?p=3Dusers/otavio/org.openembedded.de=
v.git;a=3Dsummary
you will see patches I sent two or three times here and that are not
merged/nacked yet.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



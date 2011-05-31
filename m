Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QRPS5-0004CX-6l
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 15:57:45 +0200
Received: by vxd7 with SMTP id 7so3659922vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=4ZUcdWgBRtZyZ2FQnmywn9ZeABSkxhG44xaIaLV99AI=;
	b=rfUW52EMGtLSrg/rwulzhLwf4Az4CbFH4872g9CBhBiyHpoyq6kFIlHQB3k7bE29xu
	dMmTr+kUtJ3ks7LDNojx72JznEfYP7TIy9aKD4gLFYdJs3fDyX0PfCtF6G4m8V7qD60K
	WHDJjWVoHJhKI3vsyunVbU95y85jCxFtYUiog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=d6bcvblNWO3zikzlPxgbIH28R9XylvQm8mycukxKgCCnOQ96kpbVlswfiMDXH6Z5kF
	jsr4ioFNOlaWzJ8lvDUXupoNLW9aSayPABxrdXl7QtPOZbsWM7LTSEqtK6T78mKjnlGb
	PX2lhWGp0KeXgBK2tcT/F9lTbdWymIzDKGchU=
Received: by 10.52.181.166 with SMTP id dx6mr873999vdc.35.1306850075039; Tue,
	31 May 2011 06:54:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.101.134 with HTTP; Tue, 31 May 2011 06:54:15 -0700 (PDT)
In-Reply-To: <1306848827.5488.18.camel@desktop.home>
References: <1306848827.5488.18.camel@desktop.home>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 31 May 2011 06:54:15 -0700
X-Google-Sender-Auth: IlkcEgJIJ8cfWh1VwGsX90SHXAs
Message-ID: <BANLkTim=p04=JHRP+cvnbifVcUx_a76e0A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core and mercurial
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
X-List-Received-Date: Tue, 31 May 2011 13:57:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 6:33 AM, Chris Elston <celston@katalix.com> wrote:
> So the question is, does the OEandYourDistro page need updating for
> oe-core? In which case, where do I request a wiki account to do so? =C2=
=A0Or
> alternatively, should oe-core include the mercurial-native recipe to
> cover this case? =C2=A0Discuss :-)

I would think oe-core should contain the recipe and use it as
appropriate when hg:// is in SRC_URI, personally.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics



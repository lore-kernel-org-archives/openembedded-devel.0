Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWp6y-0005TO-59
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 14:22:20 +0200
Received: by bwz5 with SMTP id 5so458113bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=T1LRfpxqgKYZK/qqa+gOAhRO8VrXce/Lzfd9LEPnwnE=;
	b=UAGmcFfba55WQx4LLGyY6+tg/cy7sf19DDpX4sYDROt6f4aGeWo6YFpR7ZLz+J5Kdy
	vXj9EHsQmKrNERNe3DzdS41PeNcHGcVOqX/uW8WJNaYe5ms16pu481dT/eo41dw94wiz
	xQ8YLQe9S53WnIjEOX+Bi9ZUs2+Q8rOskoKJA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=x5Y2b5HwbyZw+WDGPSd67k4lzUzFdJHK8rdhbrWYey4N47rruFcKSngm2cVbBx6B7n
	Orgak1CsQ5dpRXaV4eCh/9FxPZMK+oPIVG3G/eO36y7kvy06LGJTf2pRL/nqU+KKFKS3
	EoDSSoWdAk1nFknsliuwfbE8iL2qnwvTdRZM4=
MIME-Version: 1.0
Received: by 10.204.84.75 with SMTP id i11mr453673bkl.184.1308140333585; Wed,
	15 Jun 2011 05:18:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Wed, 15 Jun 2011 05:18:53 -0700 (PDT)
In-Reply-To: <1308132031.4304.9.camel@mattotaupa>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<7f3cc6bd9bc16d66b66f7fded64aff1b1f8c3820.1308070134.git.otavio@ossystems.com.br>
	<1308132031.4304.9.camel@mattotaupa>
Date: Wed, 15 Jun 2011 12:18:53 +0000
X-Google-Sender-Auth: RfDB25YRUkkyk8wipJLrcf3aEYg
Message-ID: <BANLkTi=Qkq50xcTwbC76wSiSKf1WR9AhKw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [[meta-oe][PATCH 3/3] freerdp-extension-xpunlimited: bump SRCREV due library renaming
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
X-List-Received-Date: Wed, 15 Jun 2011 12:22:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2011 at 10:00, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> nitpick: I think it is due *to*.

AFAIK Koen has already put it on his queue.

> Additionally it would be nice, if you could be more elaborate what
> library was renamed. An URL would be good enough.

FreeRDP has not a big refactoring and thus libfreerdp has been renamed
to libfreerdp-core.

> Additionally in my opinion it would be great if you could add a short
> note what build configuration you used for testing.

I don't see this on commit messages comming to the ml; why is it need
for this case?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



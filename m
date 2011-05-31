Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRS25-0003hj-Mt
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 18:43:05 +0200
Received: by bwz5 with SMTP id 5so4356731bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gXT0uLzN2V2BlcKBNSmRgEQVNJuz60tLd+8HEcHseTY=;
	b=f7aNFgCgL6pqiDtkzzidDfcl7sog3y95sfYlsh6EvfvDdJFAJMc3+7srqy6ryNOja3
	l/edQwFyr4wYkJ7N0jrVQs/R4QqQ8oFCkYxDIE6Mz+2YdjQt90lX5wOZZ2DInTTC4DK2
	RW8d1bYtoU/ckLnGyVjN9JNR/aSuyCB4jT2yg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kcLqBZV4iCYuG5kaZ/Vv6xPvV8+XU2bkVhcWkH4ThXBXyKFyu3ZGbA4qmT6qn9ZFEI
	dGkEMYdJUj7A09mOTeMIdp3OLnyvzT8XQyuQ/JkhNoxSXGQfeERdzp/HM4p4ZxWJoXaw
	EVX5zveIKBxQ3I1JZIzvRzzvGo/lBA39vqJO4=
MIME-Version: 1.0
Received: by 10.204.7.211 with SMTP id e19mr5705455bke.139.1306859996206; Tue,
	31 May 2011 09:39:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Tue, 31 May 2011 09:39:56 -0700 (PDT)
In-Reply-To: <is31co$63t$1@dough.gmane.org>
References: <BANLkTi=qZLnR+PJX7yV+=MnD=rkNJAh9Cw@mail.gmail.com>
	<is31co$63t$1@dough.gmane.org>
Date: Tue, 31 May 2011 16:39:56 +0000
X-Google-Sender-Auth: rPa7crlXLZZnzD3TmUbUsMGS1VY
Message-ID: <BANLkTimE2Y=zrWtyWPKekDeUpcmdfFNENA@mail.gmail.com>
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
X-List-Received-Date: Tue, 31 May 2011 16:43:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 15:27, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> Hmm, it works on all the platforms I tested. What kind of failures are
> you getting? And more importantly, which kernel versions are you using?

It doesn't load any module on the system. I am using 2.6.37 and it
does work fine with udev 164 and previous meta-oe one too.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



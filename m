Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWpe8-0006jV-8S
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 14:56:36 +0200
Received: by bwz5 with SMTP id 5so489372bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tewWAq8CznhMxIUKvbH8D6XlFvFyjLpEyGX2Ng0Szy4=;
	b=FlSzEBbMudZ/GZKkvVaxHWPRoGpFf1A/o1Qjy1BCnMasYusQgoSwoTKHDcNnq3NSnM
	JrYcNDIgwT8hrUplik0327psssawsxuvcb46drf7TNtCu2UzAYAECHBQyU2TE23BDwBx
	SSr7BlrVtfypjuEUnLY5V6jkMqhKF6l9W4R9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rpdgve5v8MMSLTozLdp31G4hlKKMNGiADwijQMwfwsgSyDhp8Pjfa//F5VJ37IT3XT
	qVX5DGhs3PRRg0Jfjz/LVNEUtQlzy5Or/YC7x2oUWIDju9eyG9BLDV3JJ7i4QoWinaFw
	YzLKOfTtV+eIyalByml8rQJlOuEQHfyuOhBew=
MIME-Version: 1.0
Received: by 10.204.38.88 with SMTP id a24mr469877bke.130.1308142389511; Wed,
	15 Jun 2011 05:53:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Wed, 15 Jun 2011 05:53:09 -0700 (PDT)
In-Reply-To: <ita8r9$61e$1@dough.gmane.org>
References: <cover.1308070134.git.otavio@ossystems.com.br>
	<7f3cc6bd9bc16d66b66f7fded64aff1b1f8c3820.1308070134.git.otavio@ossystems.com.br>
	<1308132031.4304.9.camel@mattotaupa>
	<BANLkTi=Qkq50xcTwbC76wSiSKf1WR9AhKw@mail.gmail.com>
	<ita8r9$61e$1@dough.gmane.org>
Date: Wed, 15 Jun 2011 12:53:09 +0000
X-Google-Sender-Auth: KdqG6mEmeRDUAQwDhXz_Az6TE0A
Message-ID: <BANLkTinQnDbfqW9CH3SJa9GKLX34qxB1yg@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Jun 2011 12:56:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2011 at 12:33, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> I haven't pushed it yet since there were other problems getting in the
> way of build testing, so feel free to update your branch :)

Please drop those 3 patches then. I will resend them on the end of
week or when I have more fixes. They're not urgent.

I fixed them locally already.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br



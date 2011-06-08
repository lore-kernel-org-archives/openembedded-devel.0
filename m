Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUDJD-0001C3-7r
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 09:36:11 +0200
Received: by pzk36 with SMTP id 36so122055pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2011 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:references:in-reply-to:mime-version
	:content-transfer-encoding:content-type:message-id:cc:x-mailer:from
	:subject:date:to;
	bh=fFb9wEoP692pPnPvPqpj+KebyIZ/TvmQlaDx+rv57sI=;
	b=ianBy+PIQO+occy5+HNkiN5GgP72DVMEyxeQN/8gBtbPuxiMhTHUnE0uOoC2R//s37
	FhsyPtvv3RZIt+Cu1trydC/QEJL48iQaakuJnLri2spErVD2MWCh1y58CMCoiH/6PNYL
	QAHhwg71WErkG6k44GkG0Vo2otOIbaRfBH4q8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	b=xshTRlCCfdY6Ha12BZUrvStpWxMwta2Lj6meMAKS6c3wjNcCqd4mpirXdj8BKB+DhW
	Pa8bL4q7jBoCl/p4QdBtl+ef3Rr54P6MMh/yjQakfmE/qkRxC/WeQioTgjXcGfuwQuKC
	cqjOhC3URzUZQ0ZoduGzIg/OZz6jnTRHl6ED8=
Received: by 10.68.65.77 with SMTP id v13mr526340pbs.442.1307518372030;
	Wed, 08 Jun 2011 00:32:52 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k9sm304000pbc.22.2011.06.08.00.32.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 00:32:51 -0700 (PDT)
References: <1307481663432021500@rkmorris.us>
In-Reply-To: <1307481663432021500@rkmorris.us>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <1349E329-09C7-4F49-8E9B-466687D453D9@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jun 2011 00:33:43 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Builds Failing
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
X-List-Received-Date: Wed, 08 Jun 2011 07:36:11 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jun 7, 2011, at 2:21 PM, Russell Morris <openembedded@rkmorris.us> wrote:=


> Hi,
>=20
> I am trying to build OE with the latest source (i.e. from MASTER) - but im=
ages that used to work are now failing (x11-gpe-image, console-image). The f=
ailure seems to be in bash, as you can see in the attached log files.
>=20
> Is this a known issue?
>=20

What's the version of patch you are using ? Or your host distro
> Thanks!
>=20
> ... Russell
>=20
> <x11-gpe-image.log>
> <console-image.log>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



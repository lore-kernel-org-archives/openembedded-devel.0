Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <adrianopallavicino@gmail.com>) id 1RiXnl-00062j-CE
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jan 2012 21:51:13 +0100
Received: by eeit10 with SMTP id t10so11600925eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 12:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=subject:references:from:content-type:x-mailer:in-reply-to
	:message-id:date:to:content-transfer-encoding:mime-version;
	bh=NNLdABFp5kTNO4px0dMbAuNaTWWcjz+pqKaU+447sRY=;
	b=nxgbd42T3GSavkWnN8TkFX1rCcGxarKlsMOAGEW54ElSRKhmEzNEQf1bbi75bjeeSa
	HJy4Xa9ZEO8/xtAPYyre4uLbdQBM7I2izBQcN+nU4J60RsXizzSu10cSCuCHtzko4Eze
	D8dsT8oVkkvtoLZh1XP4UIo/U33xd5Om9XLiM=
Received: by 10.213.110.12 with SMTP id l12mr1054347ebp.73.1325709831332;
	Wed, 04 Jan 2012 12:43:51 -0800 (PST)
Received: from [109.116.34.92] ([109.116.34.92])
	by mx.google.com with ESMTPS id
	t59sm224249254eeh.10.2012.01.04.12.43.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jan 2012 12:43:50 -0800 (PST)
References: <20120104181400.GD587@denix.org>
	<CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
From: Adriano Pallavicino <adrianopallavicino@gmail.com>
X-Mailer: iPhone Mail (9A405)
In-Reply-To: <CABcZAN=i6H+G_=v2KreWhzrOKe=fgVHv-vvrMhVMzKcefrXf2w@mail.gmail.com>
Message-Id: <C0EC035D-D055-4E49-A36C-F42AF03D232C@gmail.com>
Date: Wed, 4 Jan 2012 21:41:43 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] BlueZ old releases have new checksums
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
X-List-Received-Date: Wed, 04 Jan 2012 20:51:13 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Temporaly i've manually changed md5 and sha256sum. If needed i can prepare a=
 patch

Adriano Pallavicino

Il giorno 04/gen/2012, alle ore 21:14, Chris Larson <clarson@kergoth.com> ha=
 scritto:

> On Wed, Jan 4, 2012 at 11:14 AM, Denys Dmytriyenko <denis@denix.org> wrote=
:
>> The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally=

>> re-appeared after missing for long time since kernel.org compromise.
>> Unfortunately, all previous tarballs have new checksums, breaking builds f=
or
>> anyone w/o previous copy cached. Old copies were also extensively mirrore=
d,
>> so you never know which one you fetch next time...
>=20
> Heh, checksums changing after a security compromise, that's worrisome
> :) should diff their contents to see what's going on, or whether its
> just a gzip timestamp change or something.
> --=20
> Christopher Larson
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



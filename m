Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pmiscml@gmail.com>) id 1PjUco-0000bo-Ai
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 11:35:18 +0100
Received: by fxm17 with SMTP id 17so4778201fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jan 2011 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:in-reply-to
	:references:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=y0cWE5EMw/Yh5BdgR35KO+tnVt7CJKodLBIW+kit8EU=;
	b=HHtnkOgO+Y3Vs7dQNAeq9a/QFzafgVfch4dINuPU9hpHdTBjHyoDjkSC+taGA7bHpm
	lQyItVo1ynW4xweTL+tqC/ypKNfDaNt617dNK2PpmOaJrxYrVrWF7blx9Jlou4c2Yxtb
	wSu9m3Dva4xQ57SkRD87E+sNm2dCB0slH45xQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=N3MTWklIVqpaOuC7iEd3tFcUdpzqFjcqIUeLue6pBeoFsps5yBnkxFuSeVHqHG8Dbm
	mgSjv5yGR+4Yu/IS1c3ThSbId5i8lBbIhNA1eQwj+LQ6t1MpBHQqDyMwFSg/ASb4P8AV
	LooN+n7P/q3M1MMd1rRidLIPcnYM6XdxnrfwI=
Received: by 10.223.72.6 with SMTP id k6mr4599088faj.46.1296383663641;
	Sun, 30 Jan 2011 02:34:23 -0800 (PST)
Received: from widy.localdomain ([213.238.8.5])
	by mx.google.com with ESMTPS id n7sm6987241fam.11.2011.01.30.02.34.21
	(version=SSLv3 cipher=RC4-MD5); Sun, 30 Jan 2011 02:34:22 -0800 (PST)
Date: Sun, 30 Jan 2011 12:34:18 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110130123418.4e354145@widy.localdomain>
In-Reply-To: <4D44C015.9050700@xora.org.uk>
References: <20110130022818.1c15662c@widy.localdomain>
	<4D44C015.9050700@xora.org.uk>
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: Official git mirror on github/gitorious?
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
X-List-Received-Date: Sun, 30 Jan 2011 10:35:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, 30 Jan 2011 01:34:13 +0000
Graeme Gregory <dp@xora.org.uk> wrote:

> On 30/01/2011 00:28, Paul Sokolovsky wrote:
> > Hello,
> >
> > Searching for "openembedded" on both github and gitorious give
> > quite a few hits:
> >
> > http://github.com/search?langOverride=3D&q=3Dopenembedded&repo=3D&start=
_value=3D1&type=3DRepositories
> > http://gitorious.org/search?q=3Dopenembedded
> >
> > Was there a thought to provide official mirrors on both (or one)
> > services for the purpose of accounting forks?
> >
> There is an "official" =C3=85ngstrom mirror on gitorious.
>=20
> http://gitorious.org/+angstrom-distribution/angstrom/openembedded

Yes, seeing it made me think that it would be nice to fork it via site
means. Is there guarantee of upstream update time for it? Also, even
then it seems like a 2nd-level fork, not forking a pure OE repo
specially designed to keep track of offshots.

>=20
> Graeme
>=20

--=20
Best regards,
 Paul                          mailto:pmiscml@gmail.com



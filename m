Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1R289Y-00044a-IX
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 22:58:24 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so3761021pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-pgp-agent:x-mailer;
	bh=rChWY7CWsBmtEzgqbb1vkdPwwg7b7iGQwI/HuYgQobM=;
	b=mbjuy4QZY/yO7LAcRztxqCXTF5f0/fpV2I1NasVe6aQeO8JJmUgFcCzIxWyEMUQlHb
	D/MBSwR8qONKuBpNN0HERCs2Ww291CIzAw03NaDeev2tTyBsCu3Jpw7PFdToUmcXQ0SI
	Wfk5kNqmQu/QySjwUk/ory34dKaELQdQq+jQI=
Received: by 10.68.15.39 with SMTP id u7mr3076836pbc.476.1315601597899;
	Fri, 09 Sep 2011 13:53:17 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id e8sm22323064pbc.8.2011.09.09.13.53.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 13:53:17 -0700 (PDT)
References: <20110908202705.GA17405@edge>
In-Reply-To: <20110908202705.GA17405@edge>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <03C5E948-CDB2-4491-A9DC-FFE41B5A89F0@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Fri, 9 Sep 2011 13:53:16 -0700
To: openembedded-devel@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] Pull request 20110908
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
X-List-Received-Date: Fri, 09 Sep 2011 20:58:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sep 8, 2011, at 1:27 PM, Denys Dmytriyenko wrote:

> Tom,
>=20
> Please pull the following commit for gcc-4.5 that fixes ICE on i586 =
and adds
> new Linaro patches, one of which fixes crash in Qt browser when =
rendering
> JavaScript pages. This commit is a direct cherry-pick from OE.dev.
>=20
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>  Branch: 2011.03-maintenance
>  Browse: =
http://arago-project.org/git/people/?p=3Ddenix/openembedded.git;a=3Dshortl=
og;h=3Drefs/heads/2011.03-maintenance
>=20
> Thanks,
>    Denys Dmytriyenko <denys@ti.com>

Applied, thanks.

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk5qfLwACgkQdZngf2G4WwOt9ACfbCh5uSTFYxY9PBTV9S9l2blE
CCoAn0ba538gqBgXYdDqZ/jfXJ5bwuVV
=3DO7vT
-----END PGP SIGNATURE-----



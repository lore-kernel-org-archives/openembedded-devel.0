Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TrpbL-0005AK-F0
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 13:45:20 +0100
Received: by mail-pb0-f53.google.com with SMTP id jt11so10017163pbb.40
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 04:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XZsKO3AHKehX3v6nfS8KgJZBBXx9P6rW/pJVot33MWk=;
	b=bEOkcqYf0/g98gKLJpgR09LzgsPAGUIs+78m4sfJT4+2IERyKeJzso6LuX+5s5dRbw
	5SsiXPIWd2YaRzHECHJ1k/l1IKuyQAVMp3E3esBeAg0CKWPM32OQNywsXT2hzVy7dGW2
	ZdXXqbAJrFXmegHiypaT0Aff6No/0VGzAEfROiRI+GnWQaLlcS+hMOoC8gMw5SoyEbMc
	QYf5op20AF7fMH2cOHUny19YtwoWeoKRrbcawOl8X9iy3/T812Oe1DQ5W6i4CH3MSkaA
	K3Qn9V8y46ZxYerx6Xuc2RHiuXnABnziNZNkTRE/lYQ1qu2SVUIeUS/gU80Ewx76h5ym
	MbWw==
X-Received: by 10.68.143.100 with SMTP id sd4mr169036892pbb.107.1357475410947; 
	Sun, 06 Jan 2013 04:30:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t7sm2064061pax.17.2013.01.06.04.30.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 04:30:09 -0800 (PST)
Date: Sun, 6 Jan 2013 13:30:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130106123009.GI3272@jama>
References: <1357122081-20776-1-git-send-email-damien.rannou@diateam.net>
MIME-Version: 1.0
In-Reply-To: <1357122081-20776-1-git-send-email-damien.rannou@diateam.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] HostAP-daemon patch to make it compile with libnl 3.2
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
X-List-Received-Date: Sun, 06 Jan 2013 12:45:22 -0000
X-Groupsio-MsgNum: 42536
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MPkR1dXiUZqK+927"
Content-Disposition: inline

--MPkR1dXiUZqK+927
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 02, 2013 at 11:21:21AM +0100, Damien RANNOU wrote:
> Signed-off-by: Damien RANNOU <damien.rannou@diateam.net>
> ---
>  meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig |    2 =
+-
>  meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb        |    1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Merged, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MPkR1dXiUZqK+927
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpblEACgkQN1Ujt2V2gBzQigCeNcHIC9yMByC0qGYzIYgHGk7b
3xYAoKKtHkp/qGVemn6uDbpFSfzaX00t
=QRL+
-----END PGP SIGNATURE-----

--MPkR1dXiUZqK+927--

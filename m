Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SWCri-0004sU-70
	for openembedded-devel@openembedded.org; Sun, 20 May 2012 22:36:34 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id BAB07EA040;
	Sun, 20 May 2012 22:38:01 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 80B7D64387; Sun, 20 May 2012 22:13:39 +0200 (CEST)
Date: Sun, 20 May 2012 22:13:39 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120520201339.GR19142@hermes>
References: <1337120874-17531-1-git-send-email-apelete@seketeli.net>
	<1337120874-17531-2-git-send-email-apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <1337120874-17531-2-git-send-email-apelete@seketeli.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/1] libecj-bootstrap: Update SRC_URI to archive.eclipse.org
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
X-List-Received-Date: Sun, 20 May 2012 20:36:34 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Le 16-May-12, Apelete Seketeli a =E9crit:
> This updates SRC_URI to archive.eclipse.org since mirrors.ibiblio.org
> seems to be down.
>=20
> Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
> ---
>  recipes/ecj/libecj-bootstrap_3.6.1.bb |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes/ecj/libecj-bootstrap_3.6.1.bb b/recipes/ecj/libecj=
-bootstrap_3.6.1.bb
> index d5da24e..996ab33 100644
> --- a/recipes/ecj/libecj-bootstrap_3.6.1.bb
> +++ b/recipes/ecj/libecj-bootstrap_3.6.1.bb
> @@ -3,7 +3,7 @@ require libecj-bootstrap.inc
>  PR =3D "${INC_PR}.0"
> =20
>  SRC_URI =3D " \
> -	   http://mirrors.ibiblio.org/pub/mirrors/eclipse/eclipse/downloads/d=
rops/R-3.6.1-201009090800/ecjsrc-${PV}.zip \
> +	   http://archive.eclipse.org/eclipse/downloads/drops/R-3.6.1-2010090=
90800/ecjsrc-${PV}.zip \
> =20
>            "
> =20
> --=20
> 1.7.9.5
>=20

Once again, I need libecj-bootstrap to build muffinman-image in
oe-classic, can someone here please review this patch ?

http://patchwork.openembedded.org/patch/27791/

Regards.
--=20
        Apelete



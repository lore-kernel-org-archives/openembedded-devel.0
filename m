Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Uaksu-0004VZ-O1
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 May 2013 12:49:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9654B3141194
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 12:31:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ij6gPsoQ8X3X
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 12:30:57 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.35.30])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 9350E31406E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2013 12:30:57 +0200 (CEST)
Message-ID: <518CCC61.5080504@opendreambox.org>
Date: Fri, 10 May 2013 12:30:57 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
	<1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1367966513-12566-7-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [meta-oe/meta-gnome 06/15] poppler: remove unrecognized configure options
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
X-List-Received-Date: Fri, 10 May 2013 10:49:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08.05.2013 00:41, Andreas M=C3=BCller wrote:
> warning was:
>=20
> | configure: WARNING: unrecognized options: --disable-poppler-qt, --dis=
able-abiword-output
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/poppler/poppler.inc       |    1 -
>  meta-oe/recipes-support/poppler/poppler_0.18.4.bb |    2 --
>  2 files changed, 0 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/poppler/poppler.inc b/meta-oe/reci=
pes-support/poppler/poppler.inc
> index d0c0074..11286bc 100644
> --- a/meta-oe/recipes-support/poppler/poppler.inc
> +++ b/meta-oe/recipes-support/poppler/poppler.inc
> @@ -11,7 +11,6 @@ EXTRA_OECONF =3D "\
>      --enable-xpdf-headers \
>      --disable-gtk-test \
>      --disable-poppler-qt \
> -    --disable-poppler-qt4 \
>      --enable-zlib \
>  "

This hunk doesn't match the cited warning.

Regards,
Andreas




Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QPS4J-0003IS-KK
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 06:21:07 +0200
Received: by qwh5 with SMTP id 5so194542qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 21:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=fqmcreYska8aumpyrvs/E734RdbqT5czxF/bNA66qVw=;
	b=fXHf7rib+eLPyGxRM9GGZm+geXoapYVqV9eIURXMAgKWvJoqMUUdQdpk2eEZOevCO7
	IFrL4hDt94iPmQkFz3oLri7q7HkTWzopYR3qurmtEHQRq+mLqjZ8N7+8cwfSTSu9eiiE
	7eGLQ+Bq5hUeT0bQ3BUTAojGbbca2Y/jAfLBM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PRlr3mpt+sz39Uvc2kglfvozRORa2l6BDO3PR3LWi3h6++BIH91UBwJxGpV9giSgxi
	iQ8iQXw9Pj3Yl25fxclS4yUFHKY2Na84Aivinp6dz4gyr/1j98wAXQgkNXRzf9ffhROZ
	d192c6fMbq6Sv7gHDed/bPLgbt1/ds7WsYtKI=
MIME-Version: 1.0
Received: by 10.224.212.196 with SMTP id gt4mr258537qab.74.1306383483533; Wed,
	25 May 2011 21:18:03 -0700 (PDT)
Received: by 10.224.73.130 with HTTP; Wed, 25 May 2011 21:18:03 -0700 (PDT)
In-Reply-To: <1305173692-19917-3-git-send-email-heroor@gmail.com>
References: <1305173692-19917-1-git-send-email-heroor@gmail.com>
	<1305173692-19917-3-git-send-email-heroor@gmail.com>
Date: Thu, 26 May 2011 09:48:03 +0530
Message-ID: <BANLkTimmZrhueqYPBaxob7Ksd7T_Sauitg@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2 3/3] sysvinit: bump PR for ti816x serial console change
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
X-List-Received-Date: Thu, 26 May 2011 04:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 9:44 AM, Siddharth Heroor <heroor@gmail.com> wrote:
> From: Siddharth Heroor <heroor@ti.com>
>
> * A new inittab is needed, so bump PR to regenerate it.
>
> Signed-off-by: Siddharth Heroor <heroor@ti.com>

Ping. Has this been pushed?

> ---
> =A0recipes/sysvinit/sysvinit_2.86.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/sysvinit/sysvinit_2.86.bb b/recipes/sysvinit/sysvini=
t_2.86.bb
> index dacc397..7eba447 100644
> --- a/recipes/sysvinit/sysvinit_2.86.bb
> +++ b/recipes/sysvinit/sysvinit_2.86.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "System-V like init."
> =A0SECTION =3D "base"
> =A0LICENSE =3D "GPLv2+"
> =A0HOMEPAGE =3D "http://freshmeat.net/projects/sysvinit/"
> -PR =3D "r64"
> +PR =3D "r65"
>
> =A0# USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf=
.
> =A0# Set PACKAGE_ARCH appropriately.
> --
> 1.7.0.4
>
>



--=20
Sid



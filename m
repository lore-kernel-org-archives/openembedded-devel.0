Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJT4-0001gu-Mi
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:45:04 +0100
Received: by mail-pz0-f47.google.com with SMTP id e40so1018858dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hgEhxEtlnTrB3r09fE3TYovA6JE6iuryLrrVgbK0eCY=;
	b=nmKwfYEu+nW+u0jW+yJ+xY1cogsE6b1MliPt3fbxt8cERQggTW5Gqw71ldFl15kxeU
	gtIxM3WsYyNF6MeWI/JX9rcit2NKkmQUiI8x/jNT3o5VYl0Dsr84vvw9fGMid2MjKUKm
	iNN/HTiB4ofYT4EDeGlvw04YU6q7wRB3+YKN4=
MIME-Version: 1.0
Received: by 10.68.201.136 with SMTP id ka8mr19011794pbc.1.1325893058697; Fri,
	06 Jan 2012 15:37:38 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Fri, 6 Jan 2012 15:37:38 -0800 (PST)
In-Reply-To: <de6e7eb080c670b72c1e72a28f29bfd24dbf166e.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
	<de6e7eb080c670b72c1e72a28f29bfd24dbf166e.1325806595.git.andrea.adami@gmail.com>
Date: Sat, 7 Jan 2012 00:37:38 +0100
Message-ID: <CAAQYJAswAkTi=BasYBsk=7TrC2R8CAhG1HQj5idK1W=yj8GZcw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] xorg-driver: add xf86-video-fbdev from meta-openembedded
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
X-List-Received-Date: Fri, 06 Jan 2012 23:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 7, 2012 at 12:32 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../xorg-driver/xf86-video-fbdev_0.4.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
8 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev_=
0.4.2.bb
>
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb =
b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
> new file mode 100644
> index 0000000..a3a4796
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.2.bb
> @@ -0,0 +1,8 @@
> +require xorg-driver-video.inc
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8cbd99fff773f92e844948f74ef0=
df8"
> +
> +DESCRIPTION =3D "X.Org X server -- fbdev display driver"
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "53a533d9e0c2da50962282526bace074"
> +SRC_URI[sha256sum] =3D "93b271b4b41d7e5ca108849a583b9523e96c51813d046282=
285355b7001f82d5"
> --
> 1.7.3.4
>

please ignore

Andrea



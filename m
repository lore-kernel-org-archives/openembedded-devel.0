Received: from [74.125.78.150] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MgOpq-00028i-82
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 22:11:10 +0200
Received: by ey-out-1920.google.com with SMTP id 5so107778eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C2at0NxKnnDJGf/Tw/2AlxyvB2rCeRHBacCocpkJWM8=;
	b=f+iF9QFy7Pvoj2y3VVUdimBz7U8wGT+Olt4A1ODLs8w71fcHDztyuA7BPjSABTcO80
	QPelgUadAwF4REfhWbJdZs3QrXXIl1jFTIug2TG5Av1sI51qoRhiQjBuASR41jcVb6k6
	3LLHcPDWRZJhlxP60f0xo+sNXVQNhqdjBtoz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KFpFRXZn6iDzNuErXDpC0EPTIL5lXZTjP57MpR5hLs+ttOeViBx+r+QTwDRXajSuLe
	rEy6lJBQq77Zk+tCxKDDQyICUzQb2DAX4yZzPnIWuP//MHRpjCmxMidzQpT6iPY9yH30
	7/Ld9KDx+XAYiGc6ApRIAY30oCkcn6UwP5oXs=
MIME-Version: 1.0
Received: by 10.210.138.16 with SMTP id l16mr8373032ebd.72.1251316391697; Wed, 
	26 Aug 2009 12:53:11 -0700 (PDT)
In-Reply-To: <1251310467-24825-1-git-send-email-edoiron@cbnco.com>
References: <20090826170712.GH31371@gmail.com>
	<1251310467-24825-1-git-send-email-edoiron@cbnco.com>
Date: Wed, 26 Aug 2009 12:53:11 -0700
Message-ID: <19c1b8a90908261253w5af5a234o133b624d7f292739@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] usb-modeswitch: add v1.0.2
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
X-List-Received-Date: Wed, 26 Aug 2009 20:11:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2009 at 11:14 AM, Evan Doiron<edoiron@cbnco.com> wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A04 ++++
> =C2=A0recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb | =C2=A0 23 ++++++++=
+++++++++++++++
> =C2=A02 files changed, 27 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 2d9e843..29238ff 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -24526,6 +24526,10 @@ sha256=3Ddbc5d6921136711f08c197284ec67dc77232559=
e2e31429f8a30a1a102bd07f7
> =C2=A0md5=3D042c5243ce0253341fe920a8a863e37b
> =C2=A0sha256=3D6d2ae5d70609df7d2c2b518eca0624c4a59328b277ed114b9e5b57dd03=
0e6e94
>
> +[http://www.draisberghof.de/usb_modeswitch/usb_modeswitch-1.0.2.tar.bz2]
> +md5=3D4f896ed631f9be0338df9c5a2145ef82
> +sha256=3Df1b9388f4507185a4ac30bae3383d9e9bbb95075a14dd188c904cacdd8cf4e6=
6
> +
> =C2=A0[http://www.rpsys.net/openzaurus/patches/archive/usb_pxa27x_udc-r0.=
patch]
> =C2=A0md5=3Dc8193bc27642fa446d702cfdb9464c2a
> =C2=A0sha256=3D2101f292449cbacc277aecc5c649de895d501057f299e8e48a7ec50cfb=
0a200d
> diff --git a/recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb b/recipes/usb=
-modeswitch/usb-modeswitch_1.0.2.bb
> new file mode 100644
> index 0000000..3919106
> --- /dev/null
> +++ b/recipes/usb-modeswitch/usb-modeswitch_1.0.2.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "A mode switching tool for controlling 'flip flop' (mult=
iple device) USB gear"
> +SECTION =3D "base"
> +PRIORITY =3D "required"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "virtual/libusb0"
> +
> +SRC_URI =3D "http://www.draisberghof.de/usb_modeswitch/usb_modeswitch-${=
PV}.tar.bz2"
> +
> +S =3D "${WORKDIR}/usb_modeswitch-${PV}"
> +
> +PACKAGES =3D "${PN}"
> +FILES_${PN} =3D "${bindir} ${sysconfdir}"
> +
> +do_compile() {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake
> +}
> +
> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}
> + =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/usb_modeswitch ${D}${bindir}/=
usb_modeswitch
> + =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/usb_modeswitch.conf ${D}${sys=
confdir}/usb_modeswitch.conf
> +}
> --
> 1.6.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



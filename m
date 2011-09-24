Received: from nm35-vm7.bullet.mail.ne1.yahoo.com ([98.138.229.103])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <juhsis@yahoo.com>) id 1R7X0i-0007kA-Gq
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Sep 2011 20:31:37 +0200
Received: from [98.138.90.56] by nm35.bullet.mail.ne1.yahoo.com with NNFMP;
	24 Sep 2011 18:24:19 -0000
Received: from [98.138.88.236] by tm9.bullet.mail.ne1.yahoo.com with NNFMP;
	24 Sep 2011 18:24:19 -0000
Received: from [127.0.0.1] by omp1036.mail.ne1.yahoo.com with NNFMP;
	24 Sep 2011 18:24:19 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 326053.46091.bm@omp1036.mail.ne1.yahoo.com
Received: (qmail 39672 invoked by uid 60001); 24 Sep 2011 18:24:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1316888659; bh=14wfA8oIofAyxIGDlF0oGRJx9F4DFv+OdNAe1YMu6xE=;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=YsrIJTmhd123BJ/+34sQRR3pDZ4ikwH6fYjgfB8sppop8exg61T/F8DnzjDUA/EeMpW78Wt3SZpw6YzX6JuWXgu1gF8uW/9i4rTwaUSowCqT3kFdtWXzWQBB75aoOgQOqfrWl+uA6nYWecxGOCeQ0zs7D1VGNIl24yODi9KyN2A=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=KpxRFlhkH8TmnXLHkKpPet5JfLe6k1HAn4RdMvBN0klKiwzbloGSO0U2Q2l4YouWBWn/H9NHiGWWKRPIUItCgQ+wnuSQerHGz17+Z/3wK7zXujlOqUTkv2MeXrtH9wcjG9rESp2sdefut2Ug1I9J0NgKHZGvVtHNGO8qlDmHLqI=;
X-YMail-OSG: KjlNjisVM1n2maTuE0c_PNIHKr94ELQf2cnlgF7dhiGybh5
	v90PR2mnzQscMyEcjsy0S8ePrUoPIjTieqAu4Cvah4bERB8RUj8YMTlsyYtI
	MNE43fVu38U0win4KWDQ7YqhVZVisWr05XPa5Ih.uoDu_hMkuzKfUAXXk4rQ
	_RhzSCmi_eEzGBnIPPcZZ1cg8Ho_IjYjfdAHwS1Gmt6bf_qzDez1RaML_4Ht
	XXdE2J8SbijxjHql6Pcd.I_hPKthLL3pFNKQk7cQ4KgnymPTTxnKlgs0InQN
	CYctNsQUpol2sdWHFbiIooMiu6cmD3Ufx4N0c6yPU.yjZ1pBkCT9PoHmBtWr
	HXZUVxIsuZJxcxQyT98sm1dkGj3EdH3QW9phzjT_cwtJbdkbNYZ4z2VlM2hW
	_Xq6uTlePQzKSg0dOtQV7HfJ7TfuY48g7ryoYzqGPn9r9OO.4R8jP.2dA4Xa
	7IEDrr_sliTifzSla2VA8IVvWw9_S.kdjgHMo5UUG03WsFyL60yMQLcvCpIT
	Iqgttt3G2g4DzS.WQPDh6aFmI38tWv7OTRCyVm3XCJ6aiNvQjEvPFXKKq9Oc
	s.5U5.1_vwjoLcqERuiEsaqyXmv6EhgyvmFzw6mU_Sifj0lEh1tIfZmo5ndj
	7SqeQZjZSLf83aOwI29shkfcMrv0LEroibNw8TVHWPoT5U8_wTLB8t2eF42W
	mAgLo9DZ8aeRGVGdy9xe.sMWMkD0rFQ--
Received: from [178.233.181.71] by web121520.mail.ne1.yahoo.com via HTTP;
	Sat, 24 Sep 2011 11:24:19 PDT
X-Mailer: YahooMailWebService/0.8.114.317681
References: <1316770597.99899.YahooMailNeo@web121512.mail.ne1.yahoo.com>
	<4E7C63C8.3050900@mlbassoc.com>
	<CAOU-OA+uKFYL4nJutdTHsUCYnGy9=NiYW65jGbRk76+GL6iocg@mail.gmail.com>
	<4E7DB4E4.5090202@mlbassoc.com>
Message-ID: <1316888659.32599.YahooMailNeo@web121520.mail.ne1.yahoo.com>
Date: Sat, 24 Sep 2011 11:24:19 -0700 (PDT)
From: ibrahim demir <juhsis@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4E7DB4E4.5090202@mlbassoc.com>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: ti_cgt_c6000_6.1.17_setup_linux_x86.bin error while installing ti-codec-engine
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
X-List-Received-Date: Sat, 24 Sep 2011 18:31:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Actually i copy them from /opt/ti manually and paste them where they must b=
e.. And i can basically say: no it is not known and it is not easy problem =
to fix if you are beginner at both bitbake and openembedded. There was no-a=
nswer for this situation. but i added a reply to a forum which has the same=
 problem with me and waiting for the reply..

On 2011-09-23 14:46, Michael Poole wrote:
> On Fri, Sep 23, 2011 at 6:47 AM, Gary Thomas wrote:
>> Check to make sure that you don't have write permission to /opt
>> If you have write permission in the directory /opt, the installer
>> fails to put the tools where they belong in your OE build.
>
> Is it generally known that this limitation is due to a bug in
> ti-eula-unpack.inc?&#65533; (Python's print automatically adds a newline=
,
> which the code's author apparently did not expect.)&#65533; My local rep=
o has
> these changes to allow in-tree installs by users with write access to
> /opt; please pardon Gmail's mangling of leading whitespace:

>I don't know if this is a generally known fact; it should be, I reported =
it to
>this list more than a year ago and was basically ignored [actually told I=
 just
>shouldn't have write access to /opt so the issue was my own fault...]

>Does the unpack work with your patches if /opt is not writeable?

>
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr=
-driv
> index ab4b248..5acc4da 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -19,7 +19,8 @@ SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_publi=
c_sw/sd
>&#65533;  S =3D "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
>
>&#65533;  # Logic to unpack installjammer file
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS=3D"Y:workdir"
> +TI_BIN_UNPK_WDEXT =3D "/Graphics_SDK_${SGXPV}"
>&#65533;  require ../ti/ti-eula-unpack.inc
>
>&#65533;  BINLOCATION ?=3D "${S}/gfx_rel"
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/=
recip
> index 216b3ae..be4b7a1 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
> @@ -5,7 +5,8 @@ LICENSE =3D "GPLv2"
>&#65533;  # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/gfxsdk/
>&#65533;  # see libgles-omap3.inc for detailed installation instructions
>
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS=3D"Y:workdir:"
> +TI_BIN_UNPK_WDEXT =3D "/Graphics_SDK_${SGXPV}"
>&#65533;  require ../ti/ti-eula-unpack.inc
>
>&#65533;  SGXPV =3D "4_03_00_02"
> diff --git a/recipes/ti/ti-eula-unpack.inc b/recipes/ti/ti-eula-unpack.i=
nc
> index 3b79c24..82ea785 100644
> --- a/recipes/ti/ti-eula-unpack.inc
> +++ b/recipes/ti/ti-eula-unpack.inc
> @@ -53,7 +53,7 @@ python ti_bin_do_unpack() {
>&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;  wdext =3D=
 bb.data.getVar('TI_BIN_UNPK_WDEXT', localdata)
>&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;  wdext =3D=
 bb.data.expand(wdext, localdata)
>&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533;  cmd =3D w=
orkdir+wdext
> -&#65533; &#65533; &#65533; &#65533; print>>f, "%s\n" % cmd
> +&#65533; &#65533; &#65533; &#65533; print>>f, "%s" % cmd
>&#65533; &#65533; &#65533;  f.close()
>
>&#65533; &#65533; &#65533;  # Expand the tarball that was created if requ=
ired
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
------------------------------------------------------------
Gary Thomas&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#65533; =
&#65533;  |&#65533; Consulting for the
MLB Associates&#65533; &#65533; &#65533; &#65533; &#65533; &#65533; &#6553=
3; |&#65533; &#65533; Embedded world
------------------------------------------------------------

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
From schnitzeltony@gmx.de Sun Sep 25 15:08:24 2011
Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R7oRU-0007Ve-QU
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Sep 2011 15:08:24 +0200
Received: (qmail invoked by alias); 25 Sep 2011 13:03:01 -0000
Received: from p5B0A37B6.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.182]
	by mail.gmx.net (mp007) with SMTP; 25 Sep 2011 15:03:01 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18lYuUb6A8l1gMi7YdWdI8ld8OuLO0KHq0UdVHRid
	AUApxFq1AtOJ/S
From: Andreas

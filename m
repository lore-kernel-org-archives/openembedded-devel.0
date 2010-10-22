Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9DQn-0003H2-0N
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:57:07 +0200
Received: by gxk22 with SMTP id 22so434314gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=C2795dKG2VnFg1YJ1BCo3q90o0CpbHHHyb+M5UpGjo4=;
	b=VyQWEd2WSGhtjizrFnkNiHBQcrjsGQbaVxkooWrK+mbNP7HVNhGROC8mcxcXGHOFYO
	b7zLSv3naxdBrZKc5D5cxxpmXocDGhAXeegXDvyxA/zgA22GfHrgKOxxut4Qp/JooTTt
	4Zhyt/0rQOGrpCHR2uRvmxlI4oL6D6zdtP/iU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RroC338dRGPZiRZ3Sjg5bbKYVTOGdxYRXaFDoWayUbQOxKlC+ZMWC5jdiclLet14fU
	RbMpNl+powyqwSsG+C/hhDE1nK4QOCtMQJ4jBFkDJUpnEg1ryPOKNQtmcBh81ZGyyPlG
	BUNocEu7V5e20aF9oFJQemk26z17mWmb4XCaM=
MIME-Version: 1.0
Received: by 10.42.228.10 with SMTP id jc10mr1624323icb.421.1287737778837;
	Fri, 22 Oct 2010 01:56:18 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 01:56:18 -0700 (PDT)
In-Reply-To: <1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
References: <1287074146-3705-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-3-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-4-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-5-git-send-email-fransmeulenbroeks@gmail.com>
	<1287074146-3705-6-git-send-email-fransmeulenbroeks@gmail.com>
Date: Fri, 22 Oct 2010 10:56:18 +0200
Message-ID: <AANLkTi=u3fQWjo=BwpSXhZr_0JTf=0Le46J+6a2rxaft@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 6/7] kaffe-gtk_1.1.5.bb: remove useless EXTRA_OECONF += ""
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
X-List-Received-Date: Fri, 22 Oct 2010 08:57:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

ping; i know this is a fairly trivial patch but as it is a recipe I am
not familiar with, I would appreciate it if e.g. the recipe maintainer
would send an ack

2010/10/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/kaffe/kaffe-gtk_1.1.5.bb | =A0 =A02 --
> =A01 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/kaffe/kaffe-gtk_1.1.5.bb b/recipes/kaffe/kaffe-gtk_1=
.1.5.bb
> index f4e9b93..c58aa41 100644
> --- a/recipes/kaffe/kaffe-gtk_1.1.5.bb
> +++ b/recipes/kaffe/kaffe-gtk_1.1.5.bb
> @@ -6,7 +6,5 @@ require kaffe.inc
>
> =A0DEPENDS +=3D "glib-2.0 gmp gtk+ pango zlib libxtst kaffeh-native"
>
> -EXTRA_OECONF +=3D ""
> -
> =A0SRC_URI[md5sum] =3D "928c578d4808012fe5ba5587071d2aa2"
> =A0SRC_URI[sha256sum] =3D "f4ed45720d76f5182f2dede135c1856ad01bdf9875f544=
59b6baa1071af67280"
> --
> 1.6.4.2
>
>



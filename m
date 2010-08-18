Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Olrrd-0003Wk-QG
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 01:16:13 +0200
Received: by iwn38 with SMTP id 38so1093550iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 16:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MAPSu4vHZzXxRs4PxGGL/bGJTdXK7e81cWFDpjN8LJM=;
	b=E1A5Xwdpqpxxk0KZBcvKTuPT4NXMbTN3TP6/wF+KEQtO832InVY2vsSpwieopuoHci
	QW/54R/0EcdxCFK3z8crRGJzGLg2jzLeij/Jp3XVBN+q4T6uuZWqqJr/BZ8215babKgP
	AZEz2k0Hw/lf35iYJ0qWikzUM9Hg8Eiw/emE0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bzqxkkq722sVEXhKsZrqWfVFXowRLLYWWI5RngnM1Nu2M5+g8cLGwa/xJkZ7do2gp2
	4AQYTKhT+d8hVvPYrZSwBET1FPiltAQuUoILbaH8Mvgdp+upGq4scIQ8mNnBRT4Ti4PV
	bTMKYXjAEjZBiufprUg7jgj2ip1HRDvicvOFc=
MIME-Version: 1.0
Received: by 10.231.32.200 with SMTP id e8mr9987668ibd.66.1282173343269; Wed,
	18 Aug 2010 16:15:43 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Wed, 18 Aug 2010 16:15:43 -0700 (PDT)
In-Reply-To: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
References: <811234B8-DFDF-42A4-9064-757210CE3CE5@chumby.com>
Date: Thu, 19 Aug 2010 08:45:43 +0930
Message-ID: <AANLkTinni2gtb_fb=Z_xp8ju3OhPtYf_dtAuzbXpOpxM@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] Add falconwing machine config
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
X-List-Received-Date: Wed, 18 Aug 2010 23:16:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 19 August 2010 08:33, Sean Cross <sean@chumby.com> wrote:
>
> Signed-off-by: Sean Cross <sean@chumby.com>
> ---
> =A0conf/machine/chumby-falconwing.conf | =A0 24 ++++++++++++++++++++++++
> =A01 files changed, 24 insertions(+), 0 deletions(-)
> =A0create mode 100644 conf/machine/chumby-falconwing.conf
> diff --git a/conf/machine/chumby-falconwing.conf b/conf/machine/chumby-fa=
lconwin
> g.conf
> new file mode 100644
> index 0000000..ed48cdb
> --- /dev/null
> +++ b/conf/machine/chumby-falconwing.conf
> @@ -0,0 +1,24 @@
> +#@TYPE: Machine
> +#@Name: chumby Falconwing machine config.+#@DESCRIPTION: Machine configu=
ration for chumby Falconwing-based boards, such a

You seem to have a missing newline in this part of the patch...

-Graham



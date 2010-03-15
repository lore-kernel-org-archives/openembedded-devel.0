Received: from mail-yx0-f201.google.com ([209.85.210.201])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nr4os-0001La-Oi
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 08:34:39 +0100
Received: by yxe39 with SMTP id 39so1430874yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KawzJEJ7X0GbJ8jInvP+XIBblhCP6R/h03G/I9vT/1w=;
	b=chA9HDMl5jmCCY+AWBaPei2pMhHxrQloPyh3qmWMZa2Vg6Bp+JxGQs7yGxg45NGTPm
	zTrShBiKDq10gdwFaLwQP7yRPbEZXww8l9UVvenP4CJUGykOQyUjbfLmpM7+HD7fEphI
	CsqvL3f+j5F1qRfZ2h7clUa774yCYE+jX8nuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Jyg+p8uDdyLJ3WFSZBx3LKlDgKJXOG5fu6uZ4Jvw1ybPVOnJND4FOZQCAkqnC4us2C
	Fi9qqKXFpdmOktk2QSxJ1KfqzRi4W7FASQ3Nqx3Rgp6PImwy/u0vAWf2C4xnwVSjHj7B
	8QrL2MykAW2n/JMif/HiU5GsT6NbULDLq1YiY=
MIME-Version: 1.0
Received: by 10.101.194.19 with SMTP id w19mr880703anp.157.1268638292346; Mon, 
	15 Mar 2010 00:31:32 -0700 (PDT)
In-Reply-To: <1268608696-31002-2-git-send-email-ulf.samuelsson@atmel.com>
References: <1268608696-31002-1-git-send-email-ulf.samuelsson@atmel.com>
	<1268608696-31002-2-git-send-email-ulf.samuelsson@atmel.com>
Date: Mon, 15 Mar 2010 08:31:32 +0100
Message-ID: <ac9c93b11003150031mb45becaiaac15de577f90bfe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.201
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] conf/checksum.ini: at91 linux + u-boot-2009.11
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
X-List-Received-Date: Mon, 15 Mar 2010 07:34:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/15 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
> Add checksums for:
> 2.6.30-exp.2.patch.bz2
> u-boot-2009.11.tar.bz2
>
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> ---
> =A0conf/checksums.ini | =A0 =A08 ++++++++
> =A01 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 70346bf..ba3b697 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -74,6 +74,10 @@ sha256=3D7a960180e7873b1bdb522e76b0423b5c2c1b8efe1d30d=
7ca80c41eb97d822b2d
> =A0md5=3Df13ab353b11329ce3d605b6f40e77fa6
> =A0sha256=3D41991e8aa2e5fe8e5dfd47b1e5c446fa03c3ee96a5eae54fd6ec15d1d9afe=
f30
>
> +[ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2]
> +md5=3D770c7a2bfb925111a8c0e0d4c8c4764e
> +sha256=3D58894965b253eae0c4caacedc3463cf186c18431ca0d71b767a3b36aa40ec38=
8
> +
> =A0[http://maxim.org.za/AT91RM9200/2.6/2.6.31-at91.patch.gz]
> =A0md5=3Dbf420f0340e30b0a2c42b2b36d0b2577
> =A0sha256=3D738b88daa31e1a033646900813a5f1ce40ba21e2836500fd848a984565f27=
584
> @@ -27022,6 +27026,10 @@ sha256=3Db0037cf21b67779ef5a0c585b32e46bde3b78df=
889484c78bb4318c9b448f560
> =A0md5=3Dcd4788ea1c6ac4f9b100b888a1063a6b
> =A0sha256=3D858fd04efd5b98e99fd1a074998b1a8ac5fbd07b176de1d20d8eb148492d9=
49d
>
> +[ftp://ftp.denx.de/pub/u-boot/u-boot-2009.11.tar.bz2]
> +md5=3Dd94700614225f53c853dfe714eb5fa47
> +sha256=3D066615314fc90a314823ac975ca2a525a51fdad41802f4088a3a21ce073e8de=
6
> +
> =A0[http://linux.omap.com/pub/bootloader/2430sdp/source/u-boot-SEP1106.ta=
r.gz]
> =A0md5=3D49c07dec9e1be69fd01d46f47ec03731
> =A0sha256=3Da090786113b02647413ebc15888af269f2e6d50f73cbb94b0619cc1702911=
dae
> --
> 1.6.0.2


Isn't nowadays the preferred policy to have the checksums in the recipe?
If so, shouldn't we stop adding checksums to the ini file?

Frans



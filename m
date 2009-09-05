Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mk54D-0002ot-46
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 01:53:13 +0200
Received: by bwz6 with SMTP id 6so1258226bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 16:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iaTiOVuOGJ4TSLvZIO9c4/mbzjjlyrIuOwfz2c2+srE=;
	b=wuW3KhqZpUoRLx02hXadA4ARTUr1HqhcEIltlKbr5Z7AzgIOJxArFIVatLpVxysbVu
	Ya0ODvSQ7pAalvenWVSVvuXxsgUex7VAE091h6YXa0vfT7DHlNH7+DjHwQwl/Yp0RloN
	9wFOTOSYTeO1uyudxPIZKNM1RuFmB4HnuQIEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XGnSsISbf5H0R1C795WscXglaGSvP4ENdlzVgjQrCq9jm7XKoBn5MzRv7ZGpji88i1
	gR1I5jhuTZS38QYOjJbnTrwmtIdIGeo+15Hvr5Wiu3gAOErrf0IEdO5l6MqVkQ6eqbVz
	va+gPyD0xjLnQ2PCRMosEsK+fs12ulQ5Cb6ZY=
MIME-Version: 1.0
Received: by 10.239.168.203 with SMTP id l11mr1165188hbe.85.1252193644535; 
	Sat, 05 Sep 2009 16:34:04 -0700 (PDT)
In-Reply-To: <4A8BF9FB.9040003@gefanuc.com>
References: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
	<b6ebd0a50908181024p6ad06490q108638a35c0dca82@mail.gmail.com>
	<4A8BB046.9030206@gefanuc.com> <h6gr4a$kj6$1@ger.gmane.org>
	<4A8BF9FB.9040003@gefanuc.com>
Date: Sun, 6 Sep 2009 01:34:04 +0200
Message-ID: <c384c5ea0909051634m7f5c26d5wcc425e634e2a30d4@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: introduce OE source mirror network as last resort for do_fetch
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
X-List-Received-Date: Sat, 05 Sep 2009 23:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Aug 19, 2009 at 3:11 PM, Martyn Welch<martyn.welch@gefanuc.com> wro=
te:
> Rolf Leggewie wrote:
>> Martyn Welch wrote:
>>> On that note we just ran a "quick" test on OE
>> Thanks for testing. =A0Did you test this against the stable or the dev
>> branch?
> I believe it was the stable branch,
>
Do you still have the disk usage numbers for the (almost) complete
downloads/, so that I can see into running a mirror here?

Also, the contrib/witpa/ package allows to Google for a package by
name and sha256 and md5sum. I use it for the really hard to find
packages in case of 404.


Regards,
--=20
Leon



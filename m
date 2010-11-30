Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNUfH-0002Lo-CF
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:10:56 +0100
Received: by gwj16 with SMTP id 16so2555497gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vEpGKvUK969mQsfcg+20r328UWzc7jBKtYVFjnv/ym0=;
	b=EWq+bWczzFRU4/YOOo/Kc+ybegmLD/SvggBkc8N36lwTrMMs+YvMiE8lWzks1m/BfR
	nIOveNvdQ8IHGIcBOL6qgLWo7j/OpNFJTjwmlL9JUyivKaEZi8QyMcXL0+M2e7zNp8rX
	WICG7Oddk9LaRbHyfaHJVQi9UBFN57iFAH86w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=cz30TkJbXsOpCH+gBxyV/bvVHWkJMiH8t9y47bjGkh4Ma7+dzFrulqM86whTJL7Shc
	yTnm6xdnvI484SFnLm7UgGgRIGjApFPftv0CvGN6qromtepjekmky2kiWwU5HIm/yj3h
	oh3EYCvUGGx6QSfvQ7uImqj+mhqqVBfjI5XuM=
Received: by 10.91.10.21 with SMTP id n21mr66550agi.75.1291140573692; Tue, 30
	Nov 2010 10:09:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 10:09:13 -0800 (PST)
In-Reply-To: <AANLkTinqmryB1Ofe2gDV959h2cLbLkrC-ZohbgrPMicA@mail.gmail.com>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<AANLkTinqmryB1Ofe2gDV959h2cLbLkrC-ZohbgrPMicA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 10:09:13 -0800
Message-ID: <AANLkTindqEO8F9+zZDZbR_yoxENTZJi7cERUUTnHYFOf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Tue, 30 Nov 2010 18:10:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2010 at 11:56 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> I thought I already mentioned this, but we need from master
> =C2=A0 =C2=A0 =C2=A0 =C2=A095035fb93f662b8036e1083a7a834030b4b98041
> f2a9c8045666402811c4e5adeccb62ee2042e0c9
> =C2=A0 =C2=A0 =C2=A0 =C2=A0f7403d0b48339483fa02e4042d2c70b992228beb
>
> Without these the underlying recipes (and my test image) do not build.
>

cherry-picked these three patches

Thx
-Khem



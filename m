Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvD1m-0006BI-HL
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 19:41:15 +0200
Received: by gya6 with SMTP id 6so2315069gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gkpUihW2EcQfx58RSf9XaHGJ/64WaFY8CLfNqCsxiak=;
	b=Wr51oGhB1aWxl7UVxDlIM6oH21esUC6Y3NhJyV42ACKWOq+A1DT3jcan+Vxhap2MDh
	cnaDqwV7NzW3A/4choIqSC27CJZvfYaizC6tbBdua1kjRM4eqFIBMKA3tgTrHSAdul1D
	ctt0UlLKKRTPV6nZWCh8daEGBN+INAXQj5PHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HvgIDzNN0dMVQrsbipCalV5+Sl3jjHVNy9/jwpTyBRch0qD81Q4qXQAR7VYM6PsEN9
	hCZZ3lr9ruHOn8hdeZfElFJaicSouzp3uOv2ML8c6rFaixpYqaJblXCGYCkZvBgn3OJY
	rwaQaouh+gcWibQ7Rje3tDGz0mFOT6/38Mh94=
MIME-Version: 1.0
Received: by 10.151.103.12 with SMTP id f12mr600201ybm.386.1284399626523; Mon,
	13 Sep 2010 10:40:26 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 13 Sep 2010 10:39:56 -0700 (PDT)
In-Reply-To: <1284397376-29968-1-git-send-email-tom_rini@mentor.com>
References: <1284397376-29968-1-git-send-email-tom_rini@mentor.com>
Date: Mon, 13 Sep 2010 19:39:56 +0200
Message-ID: <AANLkTinZhG8PBu6KBBENEJzUsGUkfuqOyim1D229qtHY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] apr, apr-util: Remove 1.2.* versions
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
X-List-Received-Date: Mon, 13 Sep 2010 17:41:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/13 Tom Rini <tom_rini@mentor.com>:
> These don't patch and aren't pinned by anyone.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =A0recipes/apr/apr-util_1.2.12.bb | =A0 33 ------------------------------=
---
> =A0recipes/apr/apr-util_1.2.7.bb =A0| =A0 28 ----------------------------
> =A0recipes/apr/apr_1.2.12.bb =A0 =A0 =A0| =A0 36 ------------------------=
------------
> =A0recipes/apr/apr_1.2.7.bb =A0 =A0 =A0 | =A0 33 ------------------------=
---------
> =A04 files changed, 0 insertions(+), 130 deletions(-)
> =A0delete mode 100644 recipes/apr/apr-util_1.2.12.bb
> =A0delete mode 100644 recipes/apr/apr-util_1.2.7.bb
> =A0delete mode 100644 recipes/apr/apr_1.2.12.bb
> =A0delete mode 100644 recipes/apr/apr_1.2.7.bb
>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



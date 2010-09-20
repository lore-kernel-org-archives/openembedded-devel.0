Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OxbJ2-0004c5-QH
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 10:00:57 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so4150389iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Sep 2010 01:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JWJNz7d+A2eC2C6WWZH3ulIzGW6jsFudMKR3kgubtkc=;
	b=Vm/bJCQC1oXsGRrT1kPI9FObGybBd21ksxxHxCCY8P0bGxbb31+Dz7Wqmb0GqKF9fS
	a6gwAlJoad+ETdxVurr6AhJiGz/hOLWT1ReCBcmBVhfxdmB1ZS55Fp8LrUK3cICCcw6p
	kpi7V1XgKmc1Iiq/mUMcKzLZA+GKFiTQE5H0A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XxZjOQX6CF7g1fWqulS+6QWMSjo874KW7kPIW20YuK2Utveh3rUSwV8Ke//Zo1bzzN
	yWjZEcaJnhWYtcN4N4qTX1GwcMm0RczzmcVbQ6Vs6L53NuNjHm8y6wktM/8UPS9vwrxU
	q056lzdfFdVICeqtRXMOiZlrXIAvpKsvZaPmA=
MIME-Version: 1.0
Received: by 10.231.170.13 with SMTP id b13mr10024352ibz.62.1284969604530;
	Mon, 20 Sep 2010 01:00:04 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 20 Sep 2010 01:00:04 -0700 (PDT)
In-Reply-To: <1284048433-20991-3-git-send-email-eric@eukrea.com>
References: <AANLkTi=KDR=mtuVUiQE-5_-FL4oR+meQssfeUgz6bBLq@mail.gmail.com>
	<1284048433-20991-1-git-send-email-eric@eukrea.com>
	<1284048433-20991-2-git-send-email-eric@eukrea.com>
	<1284048433-20991-3-git-send-email-eric@eukrea.com>
Date: Mon, 20 Sep 2010 10:00:04 +0200
Message-ID: <AANLkTi=NcRgW-5LFV+VO_AkBQGJgKaNbeN2bcwkrznDR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] python_2.6.5: tune python-distutils
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
X-List-Received-Date: Mon, 20 Sep 2010 08:00:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/9 Eric B=E9nard <eric@eukrea.com>:
> removing config/libpython2.6.a and distutils/command/win*
> as suggested by cdricjulien.
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>



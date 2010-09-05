Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsAnh-0005Wx-PU
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 10:42:10 +0200
Received: by iwn2 with SMTP id 2so3060937iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=x1zeTI+dDfYcTp2s8nerAL3ph7VbazubK5xrXvM51D8=;
	b=OsD53BG1L6K+obz3rz4nQcjp9CMnEOOgfJtYLZq/GI0vn4BjiKWUrrRXZ5xaCED93Y
	ZVB2Z6Aa719HVXKO7xpEMeelkn6wP+GoTxFKXQ6FilCisG8cZqe4X8X5MXpzMbrQ+D8/
	/MDyKsZN+bN4RLCmZv70dkz+iXhStaAEzVG34=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dYLFaSainMbf9A7h3JMXlnhbcC2jSOqDtDyiz2FTSpYEojPNfN7ZsaGE1Ty9Ri0UIq
	FXdwygEhUqG3THrrN6lf9WOTyIx1IgyTaEJ0iCG0nlDT8oLSof+Vusfzb/Yr2MNVKxBR
	UjE26FtN/AyBFCoFZEII7Ln6kPJvfsxlCsb00=
MIME-Version: 1.0
Received: by 10.231.174.136 with SMTP id t8mr4044154ibz.158.1283676092173;
	Sun, 05 Sep 2010 01:41:32 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 5 Sep 2010 01:41:32 -0700 (PDT)
Date: Sun, 5 Sep 2010 10:41:32 +0200
Message-ID: <AANLkTi=j4E6ZLet=qemx-Ec1CaySKLCuzZMDriX9WQ=T@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ushare_hg (the leading ushare recipe) does not fetch
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
X-List-Received-Date: Sun, 05 Sep 2010 08:42:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

I tried to build ushare, but it fails to fetch the source.
This source is at http://hg.geexbox.org/ushare/summary

II'm not a mercurial wiz, still tried a few things, but can't seem to
be able to resolve it.
Can someone with more hg knowledge peek into this?

Meanwhile, I suggest adding a DP of  -1 to the hg version. The 1.1a
version still builds properly.

Frasn



Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1ODUtS-0001Nr-Up
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 05:52:01 +0200
Received: by pxi14 with SMTP id 14so1833765pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 20:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=DbxDd/wStiKLYqI7A5e7ICMMTqVSJEhpZqnI6eLDTVc=;
	b=goh9JvdTx6BwAD0Z4zlaSaI9344FtnczL7v2S3AAp2aGadVVVQ1cABuy0zB6HDsOdB
	RR0iGlNhVvfozbC2xVKyc5/Vj0xLrfBb00lJl+srV7V1QvKy8tRoq6SGed4GnGpsMt8b
	wQ0HfxwUn/o3pwC/2NI1e4skpo8TS/PxUtg3g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=oF5qsilBSx9NdzyeEEhiJEF3u2prkLBuPhrUTBp5eEf8RtkgsOSYMyNk/69t009QiC
	ICFLSb0UlaUGcnCBwXDoUwcz3uEx2wamgk0A7dBk2PGO2euu2wBWGF0MgA4YbSo4IXo9
	3/MG+UrjTek+kIQUCG8Hpv4KNseVMJT3qhvXE=
MIME-Version: 1.0
Received: by 10.140.56.14 with SMTP id e14mr2283933rva.158.1273981677133; Sat, 
	15 May 2010 20:47:57 -0700 (PDT)
Received: by 10.141.51.17 with HTTP; Sat, 15 May 2010 20:47:57 -0700 (PDT)
Date: Sun, 16 May 2010 00:47:57 -0300
Message-ID: <AANLkTiksiXOV_Pjyc64dgslTY9MOFGuji7D6zn7zo7Rp@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: ncurses-sdk problem
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
X-List-Received-Date: Sun, 16 May 2010 03:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Anybody have a trouble with ncurses-sdk when using meta-toolchain?

I can't figure what happens. Maybe ncurses-sdk recipe need a update?

Thanks.

--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br



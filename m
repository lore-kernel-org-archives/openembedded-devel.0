Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OuOLf-0002Ud-Dp
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 13:34:26 +0200
Received: from [192.168.1.2] (e180150026.adsl.alicedsl.de [85.180.150.26])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id D90535841A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 13:39:09 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100910183714.GE28148@denix.org>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
	<AANLkTikLhZ-vsO34S30T5RekoaKJpwyECmjyryY8d6wV@mail.gmail.com>
	<20100910183714.GE28148@denix.org>
Organization: Vanille-Media
Date: Sat, 11 Sep 2010 13:33:35 +0200
Message-ID: <1284204815.9036.8.camel@saphir>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Sat, 11 Sep 2010 11:34:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 10.09.2010, 14:37 -0400 schrieb Denys Dmytriyenko:
> Unfortunately, the original discussion about SOC_FAMILY vs. MACHINE_CLASS 
> never came to any fruition - Graeme explained his motives behind MACHINE_CLASS 
> and said that it is now deprecated.

Which applies to the work he did while he worked for Openmoko. I brought
back MACHINE_CLASS for other models (EZX, HTC, etc.) and it is in use
and its use will be enhanced - so, not deprecated.

-- 
:M:




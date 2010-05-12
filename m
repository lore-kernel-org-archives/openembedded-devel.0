Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OC9xP-00077m-Q3
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 13:18:32 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 5DF5568416
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 15:14:17 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 May 2010 15:14:26 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <20100510232720.GA13708@gmail.com>
	<201005111239.57770.khimov@altell.ru>
	<AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
In-Reply-To: <AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201005121514.26204.khimov@altell.ru>
X-Altell-MailScanner-ID: 5DF5568416.50B1E
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move gcc 4.4.3 recipes in favour of 4.4.4
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
X-List-Received-Date: Wed, 12 May 2010 11:18:32 -0000
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F3=D2=C5=C4=C1 12 =CD=C1=D1 2010 13=
:39:02 =C1=D7=D4=CF=D2 Martin Jansa =CE=C1=D0=C9=D3=C1=CC:
> what about updating
> conf/distro/include/sane-toolchain.inc
> to 4.4.4 if we don't find any new issue with it?

No objections.
=20
> I haven't found any new issue with 4.4.3 (using it since it was
> added), rebuilding images with 4.4.4 now.

Just built mine, works like charm. Thanks, Khem!



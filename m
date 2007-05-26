Received: from [212.247.154.129] (helo=swip.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ulf@atmel.com>) id 1Hpsjr-0000q1-6p
	for openembedded-devel@openembedded.org; Sun, 20 May 2007 23:14:52 +0200
X-Cloudmark-Score: 0.000000 []
Received: from [81.233.24.250] (account mz80686@tele2.se HELO aeglos)
	by mailfe05.swip.net (CommuniGate Pro SMTP 5.1.7)
	with ESMTPA id 394877795 for openembedded-devel@openembedded.org;
	Sun, 20 May 2007 23:14:04 +0200
Message-ID: <00b801c79fd9$ee494f90$0302a8c0@atmel.com>
From: "Ulf Samuelsson" <ulf@atmel.com>
To: <openembedded-devel@openembedded.org>
Date: Sat, 26 May 2007 23:07:51 +0200
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3028
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Subject: OpenEmbedded insist on downloading existing package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 May 2007 21:14:57 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have defined the download location to and
I have linux-2.6.21.1.tar.bz2 in this directory.

OpenEmbedded seems to ignore this and insists on *downloading*
linux-2.6.21.1.tar.bz2 before use.

- This is no fun.

Anything that can be done?


Best Regards
Ulf Samuelsson




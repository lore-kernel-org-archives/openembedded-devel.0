Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QHvEm-0005TC-90
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 May 2011 11:52:48 +0200
Received: from koontz.localnet ([10.115.0.175]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 5 May 2011 11:54:59 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 May 2011 11:50:06 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-9-generic; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201105051150.06842.sgh@sgh.dk>
X-OriginalArrivalTime: 05 May 2011 09:54:59.0140 (UTC)
	FILETIME=[7EC63840:01CC0B0A]
Subject: perl-native fails on Ubuntu 11.04
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
X-List-Received-Date: Thu, 05 May 2011 09:52:48 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please apply this patch to make perl-native build on Ubuntu 11.04

https://gist.github.com/raw/925006/4217f358fb00b5b7f1dfbd1ce5f4afa4f64b0bb0=
/0001-perl-native-multilib-patch-for-ubuntu-11.04.patch

=2D=20
S=F8ren Holm



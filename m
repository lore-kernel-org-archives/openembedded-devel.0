Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QCSbS-0003iO-55
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 10:17:38 +0200
Received: from koontz.localnet ([10.115.0.175]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 20 Apr 2011 10:11:46 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 10:07:04 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201104201007.04378.sgh@sgh.dk>
X-OriginalArrivalTime: 20 Apr 2011 08:11:46.0921 (UTC)
	FILETIME=[97BA5590:01CBFF32]
Subject: Please pull 'to-upstream' of http://sgh.dk/~sgh/oe.git
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
X-List-Received-Date: Wed, 20 Apr 2011 08:17:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


commit 59c811aaebd84424451058f019aaa32c257e4fc1
Author: S=F8ren Holm <soeren.holm@mikrofyn.com>
Date:   Wed Apr 20 09:48:43 2011 +0200

    wvstreams: Added patch to fix compilation.

 .../files/0001-Fixed-missing-header-includes.patch |   37=20
++++++++++++++++++++
 recipes/wvstreams/wvstreams_4.6.bb                 |    1 +
 2 files changed, 38 insertions(+), 0 deletions(-)


=2D-=20
S=F8ren Holm



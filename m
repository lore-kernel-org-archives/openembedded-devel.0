Received: from qmta04.westchester.pa.mail.comcast.net ([76.96.62.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <buckleyassoc@comcast.net>) id 1NGKHN-0001Cc-B6
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 23:36:08 +0100
Received: from OMTA19.westchester.pa.mail.comcast.net ([76.96.62.98])
	by QMTA04.westchester.pa.mail.comcast.net with comcast
	id Cbbq1d00327AodY54mZTk4; Thu, 03 Dec 2009 22:33:27 +0000
Received: from sz0029.wc.mail.comcast.net ([76.96.58.79])
	by OMTA19.westchester.pa.mail.comcast.net with comcast
	id CmZa1d00E1iZpPQ3fmZaCP; Thu, 03 Dec 2009 22:33:34 +0000
Date: Thu, 3 Dec 2009 22:33:27 +0000 (UTC)
From: John Buckley <buckleyassoc@comcast.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <1986479129.867281259879607562.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
In-Reply-To: <1757300216.864531259879236175.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
MIME-Version: 1.0
X-Originating-IP: [130.132.225.4]
X-Mailer: Zimbra 5.0.18_GA_3076.RHEL5_64 (ZimbraWebClient - IE7
	(Win)/5.0.18_GA_3076.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.62.40
X-SA-Exim-Mail-From: buckleyassoc@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: minimal xwindows
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
X-List-Received-Date: Thu, 03 Dec 2009 22:36:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Hello,=20

I am doing simple USB video streaming using XWindows, Gstreamer and GTK+.=
=C2=A0 The build that I am currently running on is the full-featured Angst=
rom GPE Palmtop.=20



I would like to keep the build intact since it contains all the components=
 and libraries I need.=C2=A0 However, I would like to strip the XWindows bo=
ot-up so that only my Xwindow application runs for now so I can see if ther=
e are any significant performance improvements in my video streaming.=20



Does anyone know how I can prevent the GPE from starting?=C2=A0 And, how I=
 can launch my GTK+/Xwindows application on bootup.=20



John
From paulepanter@users.sourceforge.net Thu Dec 03 23:48:12 2009
Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NGKT6-0003ZT-3Q for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 23:48:12 +0100
Received: from g225082251.adsl.alicedsl.de ([92.225.82.251]
	helo

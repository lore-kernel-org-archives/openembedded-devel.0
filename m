Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1R0eqD-00026l-Rn
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 21:28:22 +0200
Received: (qmail 7860 invoked by uid 502); 5 Sep 2011 12:23:19 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 487) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13552. avast: v3.2.1/110904-1. sophie:
	3.06/3.23.2/4.69. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.034591 secs); 05 Sep 2011 19:23:19 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 5 Sep 2011 12:23:19 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 6 Sep 2011 07:23:17 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04CE2F5D@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Error building gnome image ... xsltproc
Thread-Index: AcxsAUPc+JKQqR95Ql+Rwt2hyPyGZA==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Error building gnome image ... xsltproc
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
X-List-Received-Date: Mon, 05 Sep 2011 19:28:22 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi Guys,

Am trying to build the systemd-gnome-image and I get a error when
executing xsltproc on docbook.xsl, error is:

 xsltproc -nonet
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
udisks-daemon.xml
I/O error : Attempt to load network entity
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
warning: failed to load external entity
"http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
"
cannot parse
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl

I suspect this is a proxy issue: Anyone have a solution for this.

Regards,
Bernie







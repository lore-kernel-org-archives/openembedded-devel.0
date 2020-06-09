Received: from mailout08.rmx.de (mailout08.rmx.de [94.199.90.85])
 by mx.groups.io with SMTP id smtpd.web11.2315.1591688942323407201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 00:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.85, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout08.rmx.de (Postfix) with ESMTPS id 49h2Lf0y6NzMqyT
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 09:48:58 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49h2Ld2FS3z2xbl
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2020 09:48:57 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Tue, 9 Jun 2020 09:48:56 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.29) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 9 Jun
 2020 09:48:56 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 0/4] Extend graphviz and mscgen for nativesdk
Date: Tue, 9 Jun 2020 09:48:40 +0200
Message-ID: <20200609074844.6139-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.29]
X-OriginalArrivalTime: 09 Jun 2020 07:48:56.0828 (UTC) FILETIME=[6DF83BC0:01D63E32]
X-RMX-ID: 20200609-094857-49h2Ld2FS3z2xbl-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

doxygen (which is already available for native/nativesdk), is often used
together with the 'dot' tool (graphviz package) and mscgen.


________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRA 57918
Pers=F6nlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRB 54477
Gesch=E4ftsf=FChrer: Dr. Michael Neuh=E4user; Stephan Schenk; Walter Trauni=
nger; Markus Zeiler

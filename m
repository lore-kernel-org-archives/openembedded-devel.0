Received: from [194.138.37.40] (helo=gecko.sbs.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1J2qCC-0005gM-R6
	for openembedded-devel@openembedded.org; Thu, 13 Dec 2007 16:41:56 +0100
Received: from mail1.sbs.de (localhost [127.0.0.1])
	by gecko.sbs.de (8.12.6/8.12.6) with ESMTP id lBDFbUcm010399
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 16:37:30 +0100
Received: from fthw9xoa.ww002.siemens.net (fthw9xoa.ww002.siemens.net
	[157.163.133.201])
	by mail1.sbs.de (8.12.6/8.12.6) with ESMTP id lBDFbUQo004857
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Dec 2007 16:37:30 +0100
Received: from stgw002a.ww002.siemens.net ([141.73.158.150]) by
	fthw9xoa.ww002.siemens.net with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 13 Dec 2007 16:37:29 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 13 Dec 2007 16:37:09 +0100
Message-ID: <D7810733513F4840B4EBAAFA64D9C6A401A27E91@stgw002a.ww002.siemens.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: xfce-image
Thread-Index: Acg9ngWxeukC3a+qQ7CkYDe2LIyMgQ==
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 13 Dec 2007 15:37:29.0875 (UTC)
	FILETIME=[12274630:01C83D9E]
Subject: xfce-image
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
X-List-Received-Date: Thu, 13 Dec 2007 15:41:57 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

DISTRO=3Dangstrom
MACHINE=3Dx86

I built xfce-image, and installed the rootfs on the target.

Unfortunately, XFCE does not start, but matchbox seems to be the default
window manager.

- How can I start xfce4?
- Is it normal that matchbox is the default window-manager for
xfce-image?

Best regards,
Fabrice Aeschbacher



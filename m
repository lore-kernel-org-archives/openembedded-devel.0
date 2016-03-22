Return-Path: <matt.schuckmann@planar.com>
X-Greylist: delayed 592 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 22 Mar 2016 23:24:01 UTC
Received: from us-smtp-delivery-105.mimecast.com
	(us-smtp-delivery-105.mimecast.com [216.205.24.105])
	by mail.openembedded.org (Postfix) with ESMTP id 14D4C60125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:24:01 +0000 (UTC)
Received: from msxbvt03.planar.net (mail.planar.com [199.244.172.52]) (Using
	TLS) by us-smtp-1.mimecast.com with ESMTP id
	us-mta-54-7mToFsElRgiQqyyBMuF_iQ-1; Tue, 22 Mar 2016 19:07:02 -0400
Received: from MSXBEBVT28.planar.net (172.16.10.28) by msxbvt03.planar.net
	(172.16.10.5) with Microsoft SMTP Server (TLS) id 8.3.406.0;
	Tue, 22 Mar 2016 16:07:00 -0700
Received: from MSXBEBVT28.planar.net (172.16.10.28) by MSXBEBVT28.planar.net
	(172.16.10.28) with Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Tue, 22 Mar 2016 16:07:00 -0700
Received: from MSXBEBVT28.planar.net ([::1]) by MSXBEBVT28.planar.net ([::1])
	with mapi id 15.00.1156.000; Tue, 22 Mar 2016 16:07:00 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Specify GCC version for building native applications
Thread-Index: AQHRhI8GuVa20H2q1EetRTqn/WGtng==
Date: Tue, 22 Mar 2016 23:06:59 +0000
Message-ID: <1458688019763.44680@planar.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.15.0.87]
MIME-Version: 1.0
X-MC-Unique: 7mToFsElRgiQqyyBMuF_iQ-1
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Specify GCC version for building native applications
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2016 23:24:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

My Ubuntu system has GCC 5.x installed but our Fido based OE build has erro=
rs unless I use GCC 4.9 for building native recipes.

I can install both gcc 4.9 and gcc 5.0 on my system and use update-alternat=
ives to switch back and forth when I need to but it would be nice if I coul=
d just configure bitbake/OE to use gcc 4.9 directly.

So is there a way to tell bitbake/OE what version of GCC on the host to use=
 to build native applications?


Thanks,

Matt S.


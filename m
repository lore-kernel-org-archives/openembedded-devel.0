Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id BC3327226D
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 18 Apr 2015 03:48:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3I3mmCB025192
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 22:48:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3I3mlZZ014020
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 22:48:47 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Fri, 17 Apr 2015 22:48:47 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java] Query on fetch issue with rhino_1.7r4.bb
Thread-Index: AdB5io2a7ndSETd1Qdmi/tJZD8orTA==
Date: Sat, 18 Apr 2015 03:48:47 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058189466@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] Query on fetch issue with rhino_1.7r4.bb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Apr 2015 03:48:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am seeing following fetch error when trying to build  rhino_1.7r4.bb.
Anybody else seeing this?  Appreciate any help on this.

WARNING: Failed to fetch URL https://github.com/downloads/mozilla/rhino/rhi=
no1_7R4.zip, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 4, output:
OpenSSL: error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert han=
dshake failure
Unable to establish SSL connection.


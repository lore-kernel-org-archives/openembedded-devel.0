Return-Path: <sander.visser.2@consultant.volvo.com>
X-Greylist: delayed 616 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 31 Oct 2016 20:01:41 UTC
Received: from mail-gw3.it.volvo.com (mail-gw3.it.volvo.com [192.138.110.232])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDCE719AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 20:01:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.31,428,1473112800"; 
	d="scan'208,217";a="693965541"
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-oe] packagegroup-core-eclipse-debug
Thread-Index: AdIzr+KWVDZdBsc6TJmmK5SbGhzFlw==
Date: Mon, 31 Oct 2016 19:51:21 +0000
Message-ID: <4d4b2776807f4f6e8480ea33a3a71c89@SEGOTNC5112-N6.vcn.ds.volvo.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [131.97.199.99]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-oe] packagegroup-core-eclipse-debug
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
X-List-Received-Date: Mon, 31 Oct 2016 20:01:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

meta/recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb RDEPENDS=
 on gdbserver but that is no longer provided. Should RDEPENDS on gdb instea=
d?

/Regards Sander


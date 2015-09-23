Return-Path: <erkka.kaaria@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 934E073CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 08:37:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2015 01:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; 
	d="scan'208,217";a="811043863"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2015 01:37:42 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.168]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.126]) with mapi id
	14.03.0248.002; Wed, 23 Sep 2015 09:37:41 +0100
From: "Kaaria, Erkka" <erkka.kaaria@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java] Commit duplication
Thread-Index: AdD12vC/dgxUVv4cQVGMR5W1ZsgkFA==
Date: Wed, 23 Sep 2015 08:37:40 +0000
Message-ID: <17C19527BD855F428F22685986FD58BEA01C37@IRSMSX103.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-java] Commit duplication
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
X-List-Received-Date: Wed, 23 Sep 2015 08:37:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

There seem to have been a bad merge commit made December 17 2014 (http://gi=
t.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=3D12a0b10b35b1829eec1=
1ea653af53d127a8b6fd1). This commit introduced duplicate commits into the g=
it history (for example, http://git.yoctoproject.org/cgit/cgit.cgi/meta-jav=
a/commit/?id=3D8042dd1f8e3ccee2ddb31e792e3f88c6e2583847 and http://git.yoct=
oproject.org/cgit/cgit.cgi/meta-java/commit/?id=3D7b66b4940804b72150b33248b=
16b582ae6a48751). These duplications are causing issues with certain tools.

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


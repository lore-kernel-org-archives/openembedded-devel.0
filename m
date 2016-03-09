Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EC8576080F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 03:23:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Mar 2016 19:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,559,1449561600"; d="scan'208";a="666210016"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2016 19:22:53 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.21]) by
	KMSMSX154.gar.corp.intel.com ([169.254.12.32]) with mapi id
	14.03.0248.002; Wed, 9 Mar 2016 11:22:48 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Martin.Jansa@gmail.com"
	<Martin.Jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe] [jethro] Additional version supported in stable
	branch
Thread-Index: AdF5sdaaPeyHAmLVSleNXXFfg8Q42g==
Date: Wed, 9 Mar 2016 03:22:47 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D191C80FE@PGSMSX103.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: [meta-oe] [jethro] Additional version supported in stable branch
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
X-List-Received-Date: Wed, 09 Mar 2016 03:23:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear maintainers,

I would like to collect inputs from all of you whether is it possible to ha=
ve 2 versions of libvpx supported in Jethro branch.

I have recently submitted libvpx v1.5 upgrade to master branch. I do unders=
tand that stable branch is mainly used for security updates/fixes.
So this is why I'm proposing to support 2 versions instead of upgrading in =
Jethro.

The reason behind is, we are enabling video decode/encode feature to custom=
ers but our target BSP components are still based on Jethro.

Please let me know your concern whether this is feasible. Thank you very mu=
ch.

Regards,
Rebecca


Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 226AF73617
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Feb 2015 20:58:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2015 12:54:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,610,1418112000"; 
	d="scan'208,217";a="668809556"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2015 12:58:10 -0800
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 19 Feb 2015 12:58:09 -0800
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.201]) by
	FMSMSX154.amr.corp.intel.com ([169.254.6.133]) with mapi id
	14.03.0195.001; Thu, 19 Feb 2015 12:58:09 -0800
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][meta-oe][dylan]opencv: master->dylan backport
Thread-Index: AdBMhlisNtPIO8QFRTG9GjpwWr5OGA==
Date: Thu, 19 Feb 2015 20:58:08 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B490C6648@fmsmsx116.amr.corp.intel.com>
Accept-Language: en-GB, pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [meta-oe][dylan]opencv: master->dylan backport
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
X-List-Received-Date: Thu, 19 Feb 2015 20:58:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Paul, please cherry-pick a commit from master to dylan:
fe81c0e5af2df3890f2ab0f267562fdce5b5b166
right now opencv on dylan has a broken download URI.

Thanks,
Krzysztof Sywula


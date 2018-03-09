Return-Path: <zyong@qti.qualcomm.com>
Received: from alexa-out-tai-02.qualcomm.com (alexa-out-tai-02.qualcomm.com
	[103.229.16.227])
	by mail.openembedded.org (Postfix) with ESMTP id DC8887828D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 02:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
	s=qcdkim; t=1520560835; x=1552096835;
	h=from:to:subject:date:message-id:mime-version;
	bh=8NAbL+gvTzfG0VjbXeTZHsukl+v9dNHpwp7aihQcJNw=;
	b=aJanrLbn11na0szXez9SxROJCDdx9/i2amyB+eUZUVIZYTs0mYVki9bn
	Lx05/waFgLYKpmJPmLGFKhf2hv0/aRu13qXzhT2ClMP8YmDOsM+Ioj8lu
	KRXM2qvQ6cZEDm0hPMPggtt0A8kOKzWXpsCS7jGazwcm+rOgeF7MIW5RD Q=;
X-IronPort-AV: E=Sophos;i="5.47,443,1515427200"; d="scan'208,217";a="42186"
Received: from ironmsg03-tai.qualcomm.com ([10.249.140.8])
	by alexa-out-tai-02.qualcomm.com with ESMTP; 09 Mar 2018 10:00:33 +0800
X-IronPort-AV: E=McAfee;i="5900,7806,8826"; a="3277684"
Received: from aptaiexm02b.ap.qualcomm.com ([10.249.150.12])
	by ironmsg03-tai.qualcomm.com with ESMTP/TLS/AES256-SHA;
	08 Mar 2018 18:00:30 -0800
Received: from aptaiexm02b.ap.qualcomm.com (10.249.150.12) by
	aptaiexm02b.ap.qualcomm.com (10.249.150.12) with Microsoft SMTP Server
	(TLS) id 15.0.1365.1; Fri, 9 Mar 2018 10:00:28 +0800
Received: from aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d]) by
	aptaiexm02b.ap.qualcomm.com ([fe80::d4db:8980:a041:2e5d%19]) with mapi
	id 15.00.1365.000; Fri, 9 Mar 2018 10:00:28 +0800
From: "Yong Zhang (AUTO-BI)" <zyong@qti.qualcomm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: The license of hostapd v2.6
Thread-Index: AdO3SmTWwqkzEwuaSOCd9D2p82ldBg==
Date: Fri, 9 Mar 2018 02:00:28 +0000
Message-ID: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.249.136.10]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: The license of hostapd v2.6
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
X-List-Received-Date: Fri, 09 Mar 2018 02:00:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi openembedded team,

I am doing Yocto2.3 upgrade which also update meta-openembedded layer. I fi=
nd that the version of package hostapd is updated from 2.5 to 2.6. And the =
license is updated from "BSD" to "GPLv2 | BSD" in hostapd recipe. As I know=
, There is no change in the hostapd licensing terms between 2.5 and 2.6 rel=
eases or anything that has happened since 2.6; nor are there plans of chang=
ing the license in the future. Why do you put dual license in hostapd recip=
e?

Thanks,
Yong


Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=2986cc8aa=Myke.Smith@palm.com>)
	id 1RSBNx-00037k-6S for openembedded-devel@lists.openembedded.org;
	Sun, 20 Nov 2011 18:40:57 +0100
X-IronPort-AV: E=Sophos;i="4.69,543,1315206000"; d="scan'208";a="10071139"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	20 Nov 2011 09:33:18 -0800
Received: from ushqwmh02.palm1.palmone.com (ushqwmh02.palm1.palmone.com
	[148.92.223.143])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id pAKHXIIR018495
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:33:18 -0800
Received: from ushqwmb03.palm1.palmone.com ([148.92.223.140]) by
	ushqwmh02.palm1.palmone.com ([148.92.223.143]) with mapi;
	Sun, 20 Nov 2011 09:33:18 -0800
From: "Myke Smith (Palm GBU)" <Myke.Smith@palm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 20 Nov 2011 09:33:17 -0800
Thread-Topic: recipe (or directions) for mm-common
Thread-Index: AQHMp6p8IYOPTXi9REuTwYZU7sF9Fw==
Message-ID: <B1B7C556AEB297419157DBF4C0C054F54F467C95E8@ushqwmb03>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: recipe (or directions) for mm-common
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
X-List-Received-Date: Sun, 20 Nov 2011 17:40:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Morning,

I am trying to move our current version of glibmm from 16.6 to 24.2 but ran=
 into the need to have "mm-common" installed when building glibmm. Looking =
at the recipe for glibmm_2.24.0 I saw there was an additional DEPENDS on mm=
-common. I found the source for mm-common on the gnome site but I have not =
found a recipe in  the current OE for this component.  I am assuming I can =
just "install" everything into the STAGING directory but if someone has alr=
eady written  a recipe that I can start with so much the better or someway =
to eliminate the need to install this component.

thank you,

-myke smith=



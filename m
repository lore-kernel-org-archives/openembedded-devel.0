Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Q6l95-0001pQ-FU
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 16:52:47 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p34Eog6f017116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Apr 2011 09:50:42 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p34EofIZ010161
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Apr 2011 09:50:41 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p34EofOI016351
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Apr 2011 09:50:41 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Mon, 4 Apr 2011 09:50:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Apr 2011 09:50:30 -0500
Thread-Topic: Unused patches in x-load-git directory
Thread-Index: Acvy16R5X8Ym+0YeSgSvCCjqTiP8BQ==
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340C6812C@dlee06.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Unused patches in x-load-git directory
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
X-List-Received-Date: Mon, 04 Apr 2011 14:52:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,

I noticed that there are 5 patches in the recipes/x-load/x-load-git directo=
ry that do not seem to be used by any recipes.  At least one of the patches=
 seems to have been merged into the upstream project (http://gitorious.org/=
x-loader/x-loader/commits/master).  Is anyone using the patches below?  If =
not then I'll submit a patch to remove them.

0001-OMAP4-clocks-Enable-only-required-clks.patch
0002-OMAP4-Select-DPLL-PER-Clock-as-source-for-SGX-FCLK.patch
0003-MUX-Configure-SYS_NIRQ2-pin-in-safe-mode.patch
0004-OMAP4-clocks-Disable-slimbus-and-pad_clks.patch
0005-omap4-Make-1GHz-as-default-MPU-clock.patch =20

Sincerely,
Chase Maupin
Open Platforms
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/




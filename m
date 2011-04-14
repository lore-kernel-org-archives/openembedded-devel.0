Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QASoU-0001WB-Od
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 22:06:51 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p3EK4TUZ003017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 15:04:29 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p3EK4TqT014746
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 15:04:29 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p3EK4R6o016202
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 15:04:28 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 14 Apr 2011 15:04:13 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Apr 2011 15:04:11 -0500
Thread-Topic: [oe] [2011.03-maintenance] Pull request for TI matrix-gui,	ipc
	and	sgx/gles
Thread-Index: Acv620GzrhUNlVTISui5c94vyxBvoAAA8rwQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080340D399EC@dlee06.ent.ti.com>
References: <20110414193436.GA26286@denix.org>
In-Reply-To: <20110414193436.GA26286@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request for TI matrix-gui, ipc and	sgx/gles
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
X-List-Received-Date: Thu, 14 Apr 2011 20:06:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Thanks a lot for this.  It is really appreciated.

Sincerely,
Chase Maupin
Open Platforms
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Thursday, April 14, 2011 2:35 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [2011.03-maintenance] Pull request for TI matrix-gui, ipc
> and sgx/gles
>=20
> Tom,
>=20
> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
> new ti-ipc version and sgx/gles fixes for ti816x.
> All are cherry picked from oe.dev
>=20
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-
> project.org/git/people/?p=3Ddenix/openembedded.git;a=3Dshortlog;h=3Drefs/=
heads/2
> 011.03-maintenance
>=20
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>
> ---
>=20
>=20
> Jeff Lance (1):
>   matrix-gui: Bump up SRCREV
>=20
> Siddharth Heroor (4):
>   ti-ipc: Add version 1.22.05.27
>   omap3-sgx-modules: Update TI816x Module Location and Platform
>     variables.
>   libgles-omap3: Correct libraries for TI816x.
>   libgles-omap3: Remove SGX Fixup for TI816x.
>=20
>  recipes/powervr-drivers/libgles-omap3/rc.pvr       |   10 +++-------
>  .../powervr-drivers/libgles-omap3_4.03.00.01.bb    |    4 +++-
>  .../omap3-sgx-modules_1.6.16.3977.bb               |    4 ++--
>  recipes/ti/matrix-gui-common_1.4.bb                |    4 ++--
>  recipes/ti/matrix-gui-e_1.3.bb                     |    4 ++--
>  recipes/ti/matrix-gui_1.3.bb                       |    4 ++--
>  recipes/ti/ti-ipc_1.22.05.27.bb                    |    6 ++++++
>  7 files changed, 20 insertions(+), 16 deletions(-)
>  create mode 100644 recipes/ti/ti-ipc_1.22.05.27.bb
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



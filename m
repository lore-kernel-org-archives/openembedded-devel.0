Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1REQMS-0007KW-0Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 20:50:32 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9DIiXM2025697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 13 Oct 2011 13:44:36 -0500
Received: from dbde71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9DIiVHB011218;
	Fri, 14 Oct 2011 00:14:32 +0530 (IST)
Received: from dbde02.ent.ti.com ([172.24.170.145]) by dbde71.ent.ti.com
	([172.24.170.149]) with mapi; Fri, 14 Oct 2011 00:14:32 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Oct 2011 00:14:29 +0530
Thread-Topic: [oe] Patches to add support for TI Linux GraphicsSDK
	release04.04.00.02
Thread-Index: AcyIxU/u7cA2Qp7dR964/F+LGrR2/gAARzWwAAFPnhAAAh10gABA49wA
Message-ID: <5A47E75E594F054BAF48C5E4FC4B92AB038595A738@dbde02.ent.ti.com>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com><0C757E680E33864AB113392C7E83F910BE520F@GSX300A.mxchg.m.corp>
	<5A47E75E594F054BAF48C5E4FC4B92AB038595A171@dbde02.ent.ti.com>
	<0C757E680E33864AB113392C7E83F910BE521C@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE521C@GSX300A.mxchg.m.corp>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Patches to add support for TI Linux GraphicsSDK	release04.04.00.02
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
X-List-Received-Date: Thu, 13 Oct 2011 18:50:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
The graphics SDK has been validated with 2.6.32 kernel in OE angstrom envir=
onment.
The graphics SDK is also validated in standalone environment as well. In st=
andalone validation it has been validated with 2.6.37 kernel as mentioned i=
n the release notes.

Thanks,
Prathap.

-----Original Message-----
From: Hauser, Wolfgang (external) [mailto:Wolfgang.Hauser.external@cassidia=
n.com]=20
Sent: Thursday, October 13, 2011 9:12 PM
To: openembedded-devel@lists.openembedded.org
Subject: AW: [oe] Patches to add support for TI Linux GraphicsSDK release04=
.04.00.02

Ping ?
Hello,


>This depends on 2.6.37 kernel.
>http://processors.wiki.ti.com/index.php/RN_4_04_00_02#Kernel.28Linux_PS
P.29_versions_used_for_validation

which OpenEmbedded (2011.03-maintenance) kernel recipe builds this
kernel ?

Regards
Wolfgang



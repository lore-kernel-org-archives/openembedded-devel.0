Received: from dub0-omc4-s30.dub0.hotmail.com ([157.55.2.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@hotmail.it>) id 1S4qF2-00060f-H6
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 09:59:32 +0100
Received: from DUB107-W44 ([157.55.2.71]) by dub0-omc4-s30.dub0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 6 Mar 2012 00:49:55 -0800
Message-ID: <DUB107-W44EE86246B83196B29212098510@phx.gbl>
X-Originating-IP: [78.6.111.196]
From: Luca Bolognini <l.bolognini@hotmail.it>
To: Openembedded Mailing List <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Mar 2012 09:49:55 +0100
Importance: Normal
In-Reply-To: <20120305225422.GD2030@denix.org>
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>,
	<20120305225422.GD2030@denix.org>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Mar 2012 08:49:55.0548 (UTC)
	FILETIME=[1A74D9C0:01CCFB76]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Disable GNU Hash check ?
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
X-List-Received-Date: Tue, 06 Mar 2012 08:59:32 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



And what if I want to disable this check only for a specific executable/lib=
rary inside a package (not a complete package)?

-------------------------Luca Bologninil.bolognini@hotmail.it


> Date: Mon=2C 5 Mar 2012 17:54:22 -0500
> From: denis@denix.org
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Disable GNU Hash check ?
>=20
> On Mon=2C Mar 05=2C 2012 at 06:53:05PM +0100=2C Hauser=2C Wolfgang (exter=
nal) wrote:
> > Hello=2C
> >=20
> > I have to create a package containing static and dynamic libraries and
> > some files.
> > The libraries are delivered by a vendor and we have to use(install) the=
m
> > as they are.
> >=20
> > While bitbaking the QA procedure complains about missing GNU Hashes.=20
> >=20
> > Is there a possibility to disable this check for a single recipe ?
> >=20
> > I am using bitbake 1.10.2 and an OE mainenance-2011.03 based tree.
>=20
> INSANE_SKIP_${PN} =3D "True"
>=20
> --=20
> Denys
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
 		 	   		  =


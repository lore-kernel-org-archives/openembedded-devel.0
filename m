Received: from bay0-omc4-s18.bay0.hotmail.com ([65.54.190.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1OM0u0-0007fB-12
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 17:39:44 +0200
Received: from BAY127-W19 ([65.54.190.199]) by bay0-omc4-s18.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 8 Jun 2010 08:34:18 -0700
Message-ID: <BAY127-W19ADD48625F491474C8E31D8D60@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jun 2010 21:34:17 +0600
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 08 Jun 2010 15:34:18.0282 (UTC)
	FILETIME=[0F0980A0:01CB0720]
X-SA-Exim-Connect-IP: 65.54.190.220
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: path error in bitbake file
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
X-List-Received-Date: Tue, 08 Jun 2010 15:39:45 -0000
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable



If there are too many files in directory then I have to mention each file o=
ne by one? Is there no option to give path of directory?
Saleh
>Chris Larson <clarson <at> kergoth.com> writes:

>=20
> As you'd know if you'd read the manuals=2C local paths are specified with
> file://.  file:///sdr/GPP_node is what you want.



> On Tue=2C Jun 8=2C 2010 at 8:05 AM=2C saleh usman <salehusman <at> hotmai=
l.com> wrote:
>=20
> >
> > I want to give a path of a directory /sdr/GPP_node in bitbake recipe in
> > which source files are placed. I did this as
> >
> > SRC_URI =3D "/sdr=3Bmodule=3DGPP_node"
> >
> > But it is showing error as shown below. kindly tell me the exact format=
 for
> > this path.
> >
> >
> > NOTE: Running task 1783 of 3200 (ID: 1081=2C
> > /sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_svn.bb=2C
> > do_fetch)
> > NOTE: Task failed: Malformed URL: /sdr=3Bmodule=3DGPP_node
> > ERROR: TaskFailed event exception=2C aborting
> > ERROR: Build of /sdr/ossie_collection/packages/ossie-nodes/
> > ossie-gpp-node_svn.bb do_fetch failed
> > ERROR: Task 1081 (/sdr/ossie_collection/packages/ossie-nodes/
> > ossie-gpp-node_svn.bb=2C do_fetch) failed
> > NOTE: Tasks Summary: Attempted 1782 tasks of which 1782 didn't need to =
be
> > rerun and 1 failed.
> > ERROR: '/sdr/ossie_collection/packages/ossie-nodes/ossie-gpp-node_svn.b=
b' 		 	   		 =20
_________________________________________________________________
Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
https://signup.live.com/signup.aspx?id=3D60969=


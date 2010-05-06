Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OA7BZ-0001zH-NC
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 21:56:52 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OA77f-0006HY-BM from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:52:39 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 6 May 2010 12:52:38 -0700
Received: from 172.30.80.24 ([172.30.80.24]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  6 May 2010 19:52:38 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	06 May 2010 12:52:36 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1273104883.457.56.camel@trini-m4400>
References: <1273102999.5743.49.camel@rex>
	<1273104883.457.56.camel@trini-m4400>
Organization: Mentor Graphics Corporation
Date: Thu, 06 May 2010 12:52:35 -0700
Message-ID: <1273175555.457.296.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 06 May 2010 19:52:38.0902 (UTC)
	FILETIME=[AE7EA960:01CAED55]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The rpurdie/work-in-progress branch has been merged
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
X-List-Received-Date: Thu, 06 May 2010 19:56:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-05-05 at 17:14 -0700, Tom Rini wrote:
> On Thu, 2010-05-06 at 00:43 +0100, Richard Purdie wrote:
> > I finally felt the time was right so I've merged the work-in-progress
> > branch I've been talking about to OE.dev. This contains various
> > architecture improvements and legacy staging cleanups that have been
> > used in Poky for a while with great benefit.
>=20
> I've started testing DISTRO=3Dminimal with the machines and images I said
> earlier.  Will report eventually (it's a lotta stuff).

For DISTRO=3Dminimal, mpc8315e-rdb and calamari fail, both before and
after these changes.  For qemux86, qemuarm, qemumips and db1200,
minimal-image builds and for the QEMU boards, x11-image builds as well.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation



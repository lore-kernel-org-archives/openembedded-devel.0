Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OrAZR-0002D6-FV
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 16:15:45 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o82EEb43006209
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 09:14:37 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o82EEbVo005704
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 09:14:37 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o82EEb5N009176
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 09:14:37 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 2 Sep 2010 09:14:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Sep 2010 09:14:35 -0500
Thread-Topic: [oe] git issues
Thread-Index: ActKojTTj2Bx9fptQzu4WhANK7mglgABs5yQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08031075458D@dlee06.ent.ti.com>
References: <AANLkTinhxdSG3M3ddEa6Bgtbkp4Pg8H5MSxkUAgWGZUk@mail.gmail.com>
	<4C7FA54D.5070908@mlbassoc.com>
In-Reply-To: <4C7FA54D.5070908@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git issues
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
X-List-Received-Date: Thu, 02 Sep 2010 14:15:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Gary Thomas
> Sent: Thursday, September 02, 2010 8:23 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] git issues
>=20
> On 09/02/2010 06:59 AM, Frans Meulenbroeks wrote:
> > For some reason recently every once in a while on a git pull or git
> > clone I get an error like this:
> >
> > git clone git://git.openembedded.net/openembedded openembedded
> > Initialized empty Git repository in
> > /home/frans/workspace/Linux/openembedded-test/openembedded/.git/
> > fatal: The remote end hung up unexpectedly
> > make: *** [all] Error 128
> >
> > Repeating the command often makes it work.
> >
> > Also I notice that the transfer rate is about 100-120 KB/s
> > I seem to recall Leon also reported something like this with irc.
> >
> > Is this something others see as well?
> > Especially the hangup does not really help to set up an automated test
> system.
>=20
> I've seen this on a number of sites, not just OE.  As you say, trying
> again makes it happy.
>=20
> I think it's a generic GIT problem (at least that's my experience)
>=20

I've been noticing this only with openembedded so far.  I'm not sure about =
the transfer rate issue but I have had my git pull fail the first time and =
succeed the second time.

> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



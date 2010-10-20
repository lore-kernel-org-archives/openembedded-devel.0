Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P8dOs-0000MR-0o
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:28:35 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9KIRuql024945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 13:27:56 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9KIRtci029531
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 13:27:55 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9KIRtK6014702
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 13:27:55 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 20 Oct 2010 13:27:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Oct 2010 13:27:54 -0500
Thread-Topic: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
Thread-Index: ActwgxZA9tNIjvjVTmy+wO1mLlee2wAARMYg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B3388@dlee06.ent.ti.com>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<i8vln6$njo$1@dough.gmane.org>
	<AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA314@dlee06.ent.ti.com>
	<20101020181558.GN11514@denix.org>
In-Reply-To: <20101020181558.GN11514@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 18:28:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Wednesday, October 20, 2010 1:16 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
>=20
> On Mon, Oct 11, 2010 at 02:53:59PM -0500, Maupin, Chase wrote:
> > >
> > > I'm not sure if it is a policy. Haven't seen it being pulished as suc=
h.
> > > Having said that, I have no problems with it (although there is no
> > > problem with enforcing patents or so for v2+ , as that still falls
> > > under the v2 umbrella).
> > >
> > > I guess most of our recipes that say GPLv2 are wrong and are v2+.
> > > It might be hard to distinguish between these though, it could well b=
e
> > > that the license file says v2 and a comment in the code says v2+.
> > > Glad I do not have to deal with this any more....
> >
> > Frans,
> >
> > That is exactly the issue that is so annoying.  The COPYING file usuall=
y
> > says the standard GPLv2, but if you go and read the license text in the
> code
> > that is where it says GPLv2 (or later) so GPLv2+.  This patch was
> modified
> > to go off the license in the code since that is more likely what the
> > developer actually intended and not an auto-generated file.
> >
> > Koen,
> >
> > What about GPLv3 licensed files with an exception?  Right now I have
> that as
> > GPLv3+exception.  Was there ever any discussion about how to handle
> these?
> > I am trying to indicate that it is not a standard GPLv3 license.
>=20
> Chase,
>=20
> Does it say what kind of exception it is? If it has a name, it's better t=
o
> specify it. For libgcc/libstdc++ I ended up specifying "GPLv3 with GCC
> RLE",
> which stands for GCC Runtime Library Exception:

Denys,

The COPYING.EXCEPTION file has the title "AUTOCONF CONFIGURE SCRIPT EXCEPTI=
ON".  Would you like this changed to "GPLv3 with Autoconf CSE"?

>=20
> http://www.gnu.org/licenses/gcc-exception.html
>=20
> --
> Denys
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



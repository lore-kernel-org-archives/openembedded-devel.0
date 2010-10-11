Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P5OS7-0008Uf-Mt
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 21:54:37 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9BJs1EK019471
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 14:54:01 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9BJs1gX009820
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 14:54:01 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9BJs1TT029786
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 14:54:01 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Mon, 11 Oct 2010 14:54:01 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Oct 2010 14:53:59 -0500
Thread-Topic: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
Thread-Index: Actpdqf5LCobLafoTSSBHhu+uG4gMwABvPqg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA314@dlee06.ent.ti.com>
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>
	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>
	<i8vln6$njo$1@dough.gmane.org>
	<AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>
In-Reply-To: <AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Oct 2010 19:54:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>=20
> I'm not sure if it is a policy. Haven't seen it being pulished as such.
> Having said that, I have no problems with it (although there is no
> problem with enforcing patents or so for v2+ , as that still falls
> under the v2 umbrella).
>=20
> I guess most of our recipes that say GPLv2 are wrong and are v2+.
> It might be hard to distinguish between these though, it could well be
> that the license file says v2 and a comment in the code says v2+.
> Glad I do not have to deal with this any more....

Frans,

That is exactly the issue that is so annoying.  The COPYING file usually sa=
ys the standard GPLv2, but if you go and read the license text in the code =
that is where it says GPLv2 (or later) so GPLv2+.  This patch was modified =
to go off the license in the code since that is more likely what the develo=
per actually intended and not an auto-generated file.

Koen,

What about GPLv3 licensed files with an exception?  Right now I have that a=
s GPLv3+exception.  Was there ever any discussion about how to handle these=
?  I am trying to indicate that it is not a standard GPLv3 license.

Chase
>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



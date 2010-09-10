Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Ou83F-0001PF-7n
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:10:19 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id o8AI9W1M015219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:09:32 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8AI9VoH012101
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:09:32 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o8AI9VxL012307
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 13:09:31 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Fri, 10 Sep 2010 13:09:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Sep 2010 13:09:30 -0500
Thread-Topic: [oe] [PATCH] jpeg_8b: Allow using older versions of automake
Thread-Index: ActREx3WPUlc8LR6Sbe2udl6kV0fAwAACOjg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAE9C@dlee06.ent.ti.com>
References: <1282924252-22046-1-git-send-email-chase.maupin@ti.com>
	<AANLkTik_1G5-zR7CXWnho4nfkFJAap4OkRp10iKphL2t@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310753C8F@dlee06.ent.ti.com>
	<20100910180449.GD28148@denix.org>
In-Reply-To: <20100910180449.GD28148@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.153
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] jpeg_8b: Allow using older versions of automake
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
X-List-Received-Date: Fri, 10 Sep 2010 18:10:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Enricos change is on my list.  I will resubmit this.

Sincerely,
Chase Maupin
Software Applications
Catalog DSP Products
e-mail: chase.maupin@ti.com
phone: (281) 274-3285

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Friday, September 10, 2010 1:05 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] jpeg_8b: Allow using older versions of automake
>=20
> On Mon, Aug 30, 2010 at 08:24:30AM -0500, Maupin, Chase wrote:
> > Khem,
> >
> > I'd be happy to make the patch but in this case the resulting
> differences in
> > configure appear to be just changes to line numbers in the script
> because my
> > patch caused a new comment line to be inserted.  I'm not sure if this
> patch
> > to configure would add anything but clutter.  However, if you still wan=
t
> it
> > I'll add it to the patch and resend.  The changes to configure would be
> (and
> > sorry for any outlook mangling):
>=20
> Ping.
>=20
> While the patch is not required, but it's nice to have. I'd vote to apply
> the
> original version w/o changes to configure script, but with change propose=
d
> by
> Enrico.
>=20
> Acked-by: Denys Dmytriyenko <denis@denix.org>
>=20
> --
> Denys
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



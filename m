Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Q78HH-00013a-JY
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:34:47 +0200
Received: by vws2 with SMTP id 2so381143vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:32:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.72.5 with SMTP id z5mr7220745vdu.43.1302017561246; Tue, 05
	Apr 2011 08:32:41 -0700 (PDT)
Received: by 10.220.192.1 with HTTP; Tue, 5 Apr 2011 08:32:41 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <20110405172059.50829132.ospite@studenti.unina.it>
References: <1301967081-14512-1-git-send-email-robert@erafx.com>
	<20110405143320.GE30816@jama.jama.net>
	<20110405143634.GF30816@jama.jama.net>
	<20110405172059.50829132.ospite@studenti.unina.it>
Date: Tue, 5 Apr 2011 11:32:41 -0400
Message-ID: <BANLkTiksYsGVCr7HH_WM_47kkz-+d6R_DQ@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: Antonio Ospite <ospite@studenti.unina.it>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 15:34:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 5, 2011 at 11:20 AM, Antonio Ospite <ospite@studenti.unina.it>wrote:

> On Tue, 5 Apr 2011 16:36:34 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > On Tue, Apr 05, 2011 at 04:33:20PM +0200, Martin Jansa wrote:
> > > On Mon, Apr 04, 2011 at 09:31:20PM -0400, Bob Foerster wrote:
> > > > Signed-off-by: Bob Foerster <robert@erafx.com>
> > > > ---
> > > >  ...code-native_2011d.bb => tzcode-native_2011e.bb} |   11
> ++++++-----
> > > >  1 files changed, 6 insertions(+), 5 deletions(-)
> > > >  rename recipes/tzcode/{tzcode-native_2011d.bb =>
> tzcode-native_2011e.bb} (51%)
> > >
> > > Hi,
> > >
> > > Can you please add LICENSE and LIC_FILES_CHKSUM fields? The same for
> tzdata.
> > >
> > > Something like this:
> > > OE nokia900@shr ~/shr-core $ grep LIC
> > > openembedded-core/meta/recipes-extended/tzdata/tzdata_2010o.bb
> > > LICENSE = "PD"
> > > LIC_FILES_CHKSUM =
> "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
> > > OE nokia900@shr ~/shr-core $ grep LIC
> > > openembedded-core/meta/recipes-extended/tzcode/tzcode-native_2009r.bb
> > > LICENSE = "Public Domain"
> > > LIC_FILES_CHKSUM =
> "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
> >
> > or a bit newer tzcode :)
> >
> > OE nokia900@shr ~/shr-core $ grep LIC meta-shr/recipes-extended/tzcode/
> tzcode-native_2011d.bb
> > LICENSE = "PD"
> > LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
> >
>
> Bob tell us if you are interested about adding those yourself and if so,
> if you are going to send incremental patches on top of your v2, so we
> separate the version update from the recipe upgrade about LICENSE, and
> I can merge your v2 as it is now.
>
>

Commit v2 as it as.  I will submit new patches later today with the LIC
info.



> Regards,
>    Antonio
>
> --
> Antonio Ospite
> http://ao2.it
>
> PGP public key ID: 0x4553B001
>
> A: Because it messes up the order in which people normally read text.
>   See http://en.wikipedia.org/wiki/Posting_style
> Q: Why is top-posting such a bad thing?
>


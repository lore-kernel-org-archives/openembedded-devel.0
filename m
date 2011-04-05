Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@erafx.com>) id 1Q76dA-0003Mv-IF
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 15:49:16 +0200
Received: by vws2 with SMTP id 2so271906vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 06:47:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.73.105 with SMTP id k9mr11699836vdv.83.1302011230267; Tue,
	05 Apr 2011 06:47:10 -0700 (PDT)
Received: by 10.220.192.1 with HTTP; Tue, 5 Apr 2011 06:47:10 -0700 (PDT)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <20110405153424.35cdac31.ospite@studenti.unina.it>
References: <1302002906-16491-1-git-send-email-robert@erafx.com>
	<20110405153424.35cdac31.ospite@studenti.unina.it>
Date: Tue, 5 Apr 2011 09:47:10 -0400
Message-ID: <BANLkTi=Y0OeeWJvs2hn+YJ5MweXBej7J8Q@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: Antonio Ospite <ospite@studenti.unina.it>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] tzcode-native: update to 2011e
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
X-List-Received-Date: Tue, 05 Apr 2011 13:49:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 5, 2011 at 9:34 AM, Antonio Ospite <ospite@studenti.unina.it>wrote:

> On Tue,  5 Apr 2011 07:28:25 -0400
> Bob Foerster <robert@erafx.com> wrote:
>
> > Signed-off-by: Bob Foerster <robert@erafx.com>
>
> Acked-by: Antonio Ospite <ospite@studenti.unina.it>
>
> Bob, do you want me to push those?
>

Yes, that'd be great. Thanks.


>
> > ---
> >  ...code-native_2011d.bb => tzcode-native_2011e.bb} |   10 +++++-----
> >  1 files changed, 5 insertions(+), 5 deletions(-)
> >  rename recipes/tzcode/{tzcode-native_2011d.bb => tzcode-native_2011e.bb}
> (51%)
> >
> > diff --git a/recipes/tzcode/tzcode-native_2011d.bb b/recipes/tzcode/
> tzcode-native_2011e.bb
> > similarity index 51%
> > rename from recipes/tzcode/tzcode-native_2011d.bb
> > rename to recipes/tzcode/tzcode-native_2011e.bb
> > index 1cc7757..2bf4f4c 100644
> > --- a/recipes/tzcode/tzcode-native_2011d.bb
> > +++ b/recipes/tzcode/tzcode-native_2011e.bb
> > @@ -6,11 +6,11 @@ require tzcode-native.inc
> >  # Also, tzdata (and it is needed to build tzcode) version can differ
> from
> >  # tzcode version, thus this variable
> >
> > -TZDATA_PV = "2011d"
> > +TZDATA_PV = "2011e"
> >
> >  PR = "${INC_PR}.0"
> >
> > -SRC_URI[tzcode-2011d.md5sum] = "95095242ee368e6a7e107f154590ac11"
> > -SRC_URI[tzcode-2011d.sha256sum] =
> "68f2c07471c5390199c09fe9fee6a22f8a4dac24713af88b92da17b33ad98cc7"
> > -SRC_URI[tzdata-2011d.md5sum] = "03c5793502b7c41985edd73146bf7e36"
> > -SRC_URI[tzdata-2011d.sha256sum] =
> "415a54774094e8dcdc9ba141fafbee4b3b2f2140a5b8cf012eea4b37fb9a23bd"
> > +SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
> > +SRC_URI[tzcode-2011e.sha256sum] =
> "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
> > +SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
> > +SRC_URI[tzdata-2011e.sha256sum] =
> "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
> > --
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


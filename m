Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 84411 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Jul 2018 01:43:21 UTC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF2578D84
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:43:20 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B371260004;
	Tue, 31 Jul 2018 01:43:19 +0000 (UTC)
Message-ID: <1533001396.1225.4.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 18:43:16 -0700
In-Reply-To: <CAMKF1sofxPet_J6jLsAHuJhFv+wDs5aDGjM02+UK9YdoDGwxkg@mail.gmail.com>
References: <20180730021613.26889-1-robert.joslyn@redrectangle.org>
	<20180730021613.26889-4-robert.joslyn@redrectangle.org>
	<CAMKF1sofxPet_J6jLsAHuJhFv+wDs5aDGjM02+UK9YdoDGwxkg@mail.gmail.com>
X-Mailer: Evolution 3.24.6 
Mime-Version: 1.0
X-Spam-Level: 
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH 4/5] python-parse-type: Add Python 3 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2018 01:43:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-07-29 at 21:04 -0700, Khem Raj wrote:
> 
> 
> On Sun, Jul 29, 2018 at 8:37 PM Robert Joslyn <robert.joslyn@redrecta
> ngle.org> wrote:
> > ---
> >  meta-python/recipes-devtools/python/python-parse-type.inc   | 11
> > +++++++++++
> >  .../recipes-devtools/python/python-parse-type_0.4.2.bb      | 13
> > ++-----------
> >  .../recipes-devtools/python/python3-parse-type_0.4.2.bb     |  2
> > ++
> >  3 files changed, 15 insertions(+), 11 deletions(-)
> >  create mode 100644 meta-python/recipes-devtools/python/python-
> > parse-type.inc
> >  create mode 100644 meta-python/recipes-devtools/python/python3-
> > parse-type_0.4.2.bb
> > 
> > diff --git a/meta-python/recipes-devtools/python/python-parse-
> > type.inc b/meta-python/recipes-devtools/python/python-parse-
> > type.inc
> > new file mode 100644
> > index 000000000..a4d9c0719
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-parse-type.inc
> > @@ -0,0 +1,11 @@
> > +SUMMARY = "Simplifies building parse types based on the parse
> > module"
> > +LICENSE = "BSD"
> 
> Can you make is specific here as to which bsd license is in effect
> here ? Now that you are at it 

Sure, it's BSD-3-Clause. I'll also add HOMEPAGE and resend the series.

Thanks,
Robert


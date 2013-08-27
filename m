Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6EC736BA72
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 07:23:30 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 27 Aug 2013 09:23:29 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 7475428B66D;
	Tue, 27 Aug 2013 09:23:29 +0200 (CEST)
Date: Tue, 27 Aug 2013 09:23:29 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130827072329.GA59842@sestofb10.enea.se>
MIME-Version: 1.0
In-Reply-To: <2418237.2zCjuWRh6q@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] log4cplus: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2013 07:23:31 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 07:59:57PM +0100, Paul Eggleton wrote:

Hi Paul,

> Hi Maxin,
> On Monday 26 August 2013 13:06:19 maxin.john@enea.com wrote:
> > From: "Maxin B. John" <maxin.john@enea.com>
> > log4cplus provides a simple C++ logging API for log management.
> > Signed-off-by: Maxin B. John <maxin.john@enea.com>
> > ---
> >  .../recipes-devtools/log4cplus/log4cplus_1.1.1.bb    |   18
> > ++++++++++++++++++ 1 file changed, 18 insertions(+)
<snip>
> If you're setting a short description only, please set it in SUMMARY rath=
er=B7
> than DESCRIPTION.
Ok, I will set it in SUMMARY.

> > +SECTION =3D "libs"
> > +HOMEPAGE =3D "http://sourceforge.net/projects/liblog4cplus/"
> This HOMEPAGE value is incorrect.
ouch. Will correct it.

Thank you very much for reviewing this. I will send the updated
version soon.
> Cheers,
> Paul

Thanks and Regards,
Maxin


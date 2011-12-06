Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RXpyx-0000Y6-3h
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 09:02:55 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pB67tUY1018673
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 6 Dec 2011 08:55:35 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Tue, 6 Dec 2011 08:55:30 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Pull request for libpam
Thread-Index: AQHMs2zS+vIjg8Dblk6vPcxGVI57oJXNlnGAgADZT48=
Date: Tue, 6 Dec 2011 07:55:30 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A4A69@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C401A486D@post.tritech.se>,
	<CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
In-Reply-To: <CA+M6bXnrw7p=5ACg99REKASR4L+0yzgunJ6xDWWSwcFeR82hww@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request for libpam
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
X-List-Received-Date: Tue, 06 Dec 2011 08:02:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.co=
m]=0A=
> Sent: Monday, December 05, 2011 8:49 PM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] [2011.03-maintenance] Pull request for libpam=0A=
> =0A=
> On Mon, Dec 5, 2011 at 9:42 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> =
wrote:=0A=
> > Hello Tom,=0A=
> >=0A=
> > Please pull this commit from here:=0A=
> >=0A=
> > git://github.com/mkarrman/openembedded=0A=
> > Branch: maintenance=0A=
> >=0A=
> > Mats K=E4rrman (1):=0A=
> >      368c68a  libpam_1.1.1: remove directory preventing /var/run from b=
eing volatile.=0A=
> =0A=
> Where is this a backport from?  Thanks!=0A=
> =0A=
> --=0A=
> Tom=0A=
=0A=
My local project...=0A=
Maybe I went ahead of myself but the solution is ~equivalent to the solutio=
n applied in libpam recipes of oe-core but 1.1.1 does not exist there and t=
he corresponding fix was a part of the original recipes for later versions.=
=0A=
=0A=
BR // Mats=0A=



Return-Path: <prvs=4975d639f8=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC147321C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 13:32:20 +0000 (UTC)
X-AuditID: 0a00029b-f79436d000000d21-d5-5762aa6323ff
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	A2.2D.03361.36AA2675; Thu, 16 Jun 2016 08:32:20 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0235.001;
	Thu, 16 Jun 2016 08:32:19 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser] Browser blacklists
Thread-Index: AQHRx54BDcuXWgr4ykSYbf2mE2cP+p/sIeWAgABJsQA=
Date: Thu, 16 Jun 2016 13:32:19 +0000
Message-ID: <3500964.FV5XFluSRj@localhost.localdomain>
References: <57625081.8000304@mlbassoc.com> <20160616090833.GA2563@jama>
In-Reply-To: <20160616090833.GA2563@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.137]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRmVeSWpSXmKPExsWyRiBPQzdlVVK4wd/FnBa//k5htrh4eCmz
	A5PHzll32T3ObVzBGMAUxW2TlFhSFpyZnqdvl8CdMaG5l61gFnvF/qmv2BoYL7F2MXJySAiY
	SHStuMwOYYtJXLi3nq2LkYtDSOAoo8Sj9wfZIZxZjBJPT/4B62ATMJI4d30TI4gtIhArMW/T
	TCYQm1lAU+Le419gk4QFjCUaOnZA1ZhIrD5zEijOAWRbSWy7ywESZhFQldi0YTFYCa+AmcSv
	1yeYQWwhAQ+JRUeWsoHYnEAjp779AWYzAh33/dQaqFXiEreezGeCOFpAYsme88wQtqjEy8f/
	WEFWSQjISfzf4gFRriOxYPcnNgjbSuL8192MELa2xLKFr5khThCUODnzCcsERvFZSDbMQtI+
	C0n7LCTts5C0L2BkXcXIl2ukl1pcXJZfkqqXnJ+7iREYYVwMTLN3MO6Z4HCIUYCDUYmH98LB
	xHAh1sSy4srcQ4zSHCxK4rwqQkrhQgLpiSWp2ampBalF8UWlOanFhxiZODgPMUpwcEmJFKfm
	paQWJZaWZMSDYja+GBi1Ug2Mdv9Ni6NiX/+/8Tvz496ZSu19/tlXdu86Us62YU+frc9/nVtc
	GvNP59xqnFfm53wy2PNd4t6wJQfvnvA+zpbBsb7t0PZbYlt6V3bXcyWsZXy6RNgpvSqzyJD1
	/u9whphrHeuXtRd6sHld/hftMNlP7I/9cdGnLq3BM1/1Hd5YHiGlVbtOuV5MiaU4I9FQi7mo
	OBEAR7xn6qwCAAA=
Subject: Re: [meta-browser] Browser blacklists
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
X-List-Received-Date: Thu, 16 Jun 2016 13:32:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A847FB635B8B714CB2319D1D0BF656DE@essvote.com>
Content-Transfer-Encoding: quoted-printable

I ran into this as well and had to spend some time figuring out how to get =
around it.
Some sort of note in the readme or even commit message about how to get aro=
und it would have been nice.

On a related side note it would be nice to get krogoth branch/tag before th=
is blacklist.
I saw there isn't one currently and it would give people a working tag that=
 isn't as old as jethro.


On Thursday, June 16, 2016 11:08:33 AM Martin Jansa wrote:
> On Thu, Jun 16, 2016 at 09:08:49AM +0200, Gary Thomas wrote:
> > I notice that both firefox and chromium are currently blacklisted
> > as "fails to build with gcc-6".  What about those of us that aren't
> > using gcc-6?  This seems an overly broad blacklisting :-(
>=20
> You can easily unblacklist them in your configuration where you also
> change the gcc version, but they are broken in default configuration, so
> they are blacklisted.
>=20
> =


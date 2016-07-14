Return-Path: <prvs=80039eedd9=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 4E8146AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 14:55:06 +0000 (UTC)
X-AuditID: 0a00029b-f79dd6d00000338a-df-5787a7c91fda
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	B8.C2.13194.9C7A7875; Thu, 14 Jul 2016 09:55:06 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Thu, 14 Jul 2016 09:55:05 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] nodejs: newer npm?
Thread-Index: AQHR3NmxfJRA5kqUrEazkUEVribB2aAWVlKAgABY6wCAAXgVgIAAMjQA
Date: Thu, 14 Jul 2016 14:55:05 +0000
Message-ID: <3133651.lLCjRHXOa2@localhost.localdomain>
References: <5785F022.8030404@mlbassoc.com>
	<2056819.lo3LDqAOXZ@localhost.localdomain>
	<57877DAB.9090906@mlbassoc.com>
In-Reply-To: <57877DAB.9090906@mlbassoc.com>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.158]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsWyRiBPQ/fU8vZwg+VneC0u9U5gt7h4eCmz
	A5PHuY0rGD2+bp7EEsAUxW2TlFhSFpyZnqdvl8CdMX3XH9aCfq6KpotXWBsYmzi6GDk5JARM
	JGYfW8cMYYtJXLi3nq2LkYtDSOAoo8SN/08ZQRJCArMYJd4/tAWx2QSMJM5d3wQWFxGIlZi3
	aSYTiM0soCzxbc9VNhBbWEBFomHtdyaIGlWJeS+2MkPYbhKr900Gq2EBiu/4soYVxOYVMJNY
	8f4ZK8SuComlq+eygNicAjoSP/81M0HEzSTaHr4EizMCHfr91BqoveISt57MZ4J4QEBiyZ7z
	UM+ISrx8/A9oJgeQLSfx/YsnRLmOxILdn9ggbCuJX00TmCFsbYllC18zQ5wjKHFy5hOWCYwS
	s5BsmIWkfRaS9llI2mchaV/AyLqKkS/XSC+1uLgsvyRVLzk/dxMjMPK4GJhm72DcM8HhEKMA
	B6MSD++F1W3hQqyJZcWVuYcYpTlYlMR5VYSUwoUE0hNLUrNTUwtSi+KLSnNSiw8xMnFwHmKU
	4OCSEilOzUtJLUosLcmIB8VyfDEwmqUaGDffT/yy68b5BHkR2YfWYep3L72UX/QxlOmU+Y7G
	74x+yYf/a/9bHcLhdzh2XSFX6uwGn5yzijGXTxjPvfuz/wuTjM0L3uzAla5xsnp83b3WzLX8
	F6O5hTb+3H7CQuPT+smeWr8329l37or3bOWw4j749k5ck2JVeGr91GSjE3znuNetMZ+wToml
	OCPRUIu5qDgRAAOehjm4AgAA
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: nodejs: newer npm?
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
X-List-Received-Date: Thu, 14 Jul 2016 14:55:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04E7547F6DFDC445BE877F9CBC154B8D@essvote.com>
Content-Transfer-Encoding: quoted-printable

Angular JS 1.5



On Thursday, July 14, 2016 01:55:23 PM Gary Thomas wrote:
> On 2016-07-13 15:29, Davis, Michael wrote:
> > I am currently using angular from a different meta layer.
> > https://github.com/imyller/meta-nodejs
> > It maintains newer versions of nodejs.
> > It might be something you want to try.
>=20
> Are you using AngularJS-1 or AngularJS-2?
>=20
> > On Wednesday, July 13, 2016 10:11:05 AM Gary Thomas wrote:
> >> On 2016-07-13 09:39, Gary Thomas wrote:
> >>> The current (at least 4.4.4) nodejs recipe also creates nodejs-npm
> >>> which is npm version 2.15.1.  I'm trying to run angularjs that needs
> >>> npm >=3D 3.3.x.  I've not yet tried the update to 4.4.5, so if this
> >>> fixes the issue just let me know.
> >>>=20
> >>> What needs to be done to get a newer npm?
> >>>=20
> >>> BTW, the current one segfaults when trying to install the
> >>> attached package file.
> >>=20
> >> I have now tried nodejs-4.4.5 which has npm-2.15.5  It no longer
> >> segfaults on the install step, but it doesn't really work :-(
> >> Any access just returns 'Cannot GET /'
> >>=20
> >> Anyone have suggestions on how I might debug this?  It's a known
> >> working (simple) application I got from
> >> https://angular.io/docs/ts/latest/quickstart.html=


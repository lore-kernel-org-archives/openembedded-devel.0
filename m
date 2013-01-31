Received: from [8.20.30.154] (helo=mx1.devonhealth.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <igeiser@devonit.com>) id 1U0u7k-00080r-63
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 14:24:25 +0100
Received: from emfserver.devonintlgroup.com (10.0.7.48) by mx1.devonhealth.com
	(10.0.20.154) with Microsoft SMTP Server id 8.3.213.0;
	Thu, 31 Jan 2013 08:08:14 -0500
Received: from [10.0.2.240] by emfserver.devonintlgroup.com over TLS secured
	channel with ESMTP (Devon Health Services, Inc Email Firewall SMTP Relay
	(Email Firewall v6.5)); Thu, 31 Jan 2013 08:08:07 -0500
X-Server-Uuid: 6CB55748-6642-4D3C-9211-397BC4E7A815
Received: from SOUTHSIDE.devonintlgroup.com ([10.0.2.2]) by
	kingston.devonintlgroup.com ([10.0.2.240]) with mapi; Thu, 31 Jan 2013
	08:08:08 -0500
From: Ian Geiser <igeiser@devonit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Jan 2013 08:08:05 -0500
Thread-Topic: [oe] MACHINE_KERNEL_PR vs recipe PR
Thread-Index: Ac3/qT5fHfIRlPvETpW895daUTpcpgACoKZA
Message-ID: <B57A220D1EE1644685BA9AD5C790D20526BE045E73@SOUTHSIDE.devonintlgroup.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045E71@SOUTHSIDE.devonintlgroup.com>
	<20130131114949.GB2102@jama.dyndns-home.com>
In-Reply-To: <20130131114949.GB2102@jama.dyndns-home.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-WSS-ID: 7D14B33D4CW1011502-01-01
Subject: Re: MACHINE_KERNEL_PR vs recipe PR
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
X-List-Received-Date: Thu, 31 Jan 2013 13:24:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Thursday, January 31, 2013 6:50 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] MACHINE_KERNEL_PR vs recipe PR
>=20
> On Thu, Jan 31, 2013 at 06:20:25AM -0500, Ian Geiser wrote:
> > I am curious about the machine_kerne_pr class.  What is the
[...snip...]
>=20
> OEBasicHash was only rebuilding external modules, but that does not
> upgrade them on target device.
>=20
> Now with PR service it's not so important, but still useful because
> it's more reliable.
Okay, that makes sense.  For consistency's sake is there a best practices h=
ere?  Or is it left up to the preference of the kernel recipe maintainer?  =
Thanks!=20




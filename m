Return-Path: <amber_sarosh@hotmail.com>
Received: from COL004-OMC4S3.hotmail.com (col004-omc4s3.hotmail.com
	[65.55.34.205])
	by mail.openembedded.org (Postfix) with ESMTP id C40C9723B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2015 09:53:14 +0000 (UTC)
Received: from COL131-W58 ([65.55.34.200]) by COL004-OMC4S3.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Wed, 25 Mar 2015 02:53:15 -0700
X-TMN: [oLJ5jVe0b2wnyJN7crf+jYu20p+tL2Xb]
X-Originating-Email: [amber_sarosh@hotmail.com]
Message-ID: <COL131-W583C16DDE3D412EBE156B9FD0B0@phx.gbl>
From: Amber and Sarosh <amber_sarosh@hotmail.com>
To: Philip Balister <philip@balister.org>, "alejandro.delcastillo@ni.com"
	<alejandro.delcastillo@ni.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Mar 2015 14:53:15 +0500
Importance: Normal
In-Reply-To: <5502F8D3.3080304@balister.org>
References: <OF26342078.F1FD6810-ON86257E06.00722A98-86257E06.007286FD@ni.com>,
	<5502F8D3.3080304@balister.org>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Mar 2015 09:53:15.0759 (UTC)
	FILETIME=[83BC87F0:01D066E1]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Installing packages - opkg
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
X-List-Received-Date: Wed, 25 Mar 2015 09:53:17 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi
We have waited for the feed server to be up again but it's still not workin=
g. Can you please provide us with the contact address of someone from Angst=
rom so we may ask them to check their server? Thanks.

Regards=2C
Amber=2C Sarosh & Naheed


> Date: Fri=2C 13 Mar 2015 10:48:51 -0400
> From: philip@balister.org
> To: amber_sarosh@hotmail.com
> Subject: Fwd: Re: [oe] Installing packages - opkg
>=20
> I was late seeing this. I think you can install a version of sqlite3 for
> the E100 from the Ettus feeds by running:
>=20
> opkg install libsqlite3-dev
>=20
> We showed openbts running an E100 ages ago=2C before it needed sqlite3.
>=20
> Hopefully this helps.
>=20
> Philip
>=20
>=20
> -------- Forwarded Message --------
> Subject: Re: [oe] Installing packages - opkg
> Date: Thu=2C 12 Mar 2015 15:50:54 -0500
> From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> Reply-To: openembedded-devel@lists.openembedded.org
> To: openembedded-devel@lists.openembedded.org
> CC: openembedded-devel-bounces@lists.openembedded.org
>=20
> >From your opkg.conf file=2C looks like you are using Ettus & Angstrom fe=
eds.=20
> I didn't see sqlite on the ettus feed server=2C so it must be coming from
> Angstrom. Unfortunately=2C the Anstrom feed server is currently down=2C
> according to http://wp.angstrom-distribution.org/?p=3D101 . You can eithe=
r
> ping the Angstrom guys to get an ETA on when their server is going to up
> again=2C or you are going to have to build the sqlite package yourself.
>=20
> cheers=2C
>=20
> -Alejandro
>=20
>=20
>=20
>=20
> From:   Amber and Sarosh <amber_sarosh@hotmail.com>
> To:     "openembedded-devel@lists.openembedded.org"
> <openembedded-devel@lists.openembedded.org>=2C
> Date:   03/11/2015 12:26 AM
> Subject:        Re: [oe] Installing packages - opkg
> Sent by:        openembedded-devel-bounces@lists.openembedded.org
>=20
>=20
>=20
> We are trying to install sqlite3 using opkg install sqlite command. The
> output of the command is as in the screenshot attached. Moreover=2C we ha=
ve
> tried adding source URLs to opkg.conf =2C but running opkg install or opk=
g
> update commands yield errors. This file is also attached for reference.
> Please let us know if any other detail is required.
>=20
> Regards=2C
> Amber & Sarosh
>=20
>=20
> > Date: Tue=2C 10 Mar 2015 06:20:47 -0600
> > From: gary@mlbassoc.com
> > To: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] Installing packages - opkg
> >=20
> > On 2015-03-10 04:20=2C Amber and Sarosh wrote:
> > > Hi
> > > Can someone please guide us how can we install any packages on an=20
> openembedded system? We are unable to do this using opkg. Maybe our syste=
m
> lack appropriate sources or something like that. We have tried adding
> sources in opkg.conf but still opkg update or any other trial for
> installing other packages is not successful. Please guide if anything els=
e
> is to be done.
> > > Any help in this regard is much appreciated.
> >=20
> > More data will help yield an answer.
> >=20
> > What have you done/tried?
> > What errors are you getting?
> >=20
> > --=20
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
>=20
 		 	   		  =


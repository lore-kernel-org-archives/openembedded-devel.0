Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RIbf8-0006Vz-7S
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Oct 2011 09:43:06 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9P7b3cr021114
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2011 09:37:08 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Tue, 25 Oct 2011 09:37:03 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Pull request for binutils
Thread-Index: AcyQMHd1oo4wdREbRK2n4Yh64exBfwCfpyUAAA3woVk=
Date: Tue, 25 Oct 2011 07:37:02 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013D8A9@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013D181@post.tritech.se>,
	<8721E570-6C63-4CC6-AC4A-854409FFF3E6@gmail.com>
In-Reply-To: <8721E570-6C63-4CC6-AC4A-854409FFF3E6@gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.89.227.239]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request for binutils
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
X-List-Received-Date: Tue, 25 Oct 2011 07:43:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tom,=0A=
I'm sorry for the slow progress but I'm working 100% on something else so t=
his is overtime...=0A=
What is the correct practice; to fork the oe repository at GitHub or to cre=
ate a "username/maintenance" branch in the same repo?=0A=
BR // Mats=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Tom Rini [tom.rini@gmail.com]=
=0A=
Sent: Tuesday, October 25, 2011 4:43 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [2011.03-maintenance] Pull request for binutils=0A=
=0A=
-----BEGIN PGP SIGNED MESSAGE-----=0A=
Hash: SHA1=0A=
=0A=
On Oct 21, 2011, at 1:38 PM, Mats K=E4rrman wrote:=0A=
=0A=
> Hello Tom,=0A=
>=0A=
> Please pull this commit from here:=0A=
>=0A=
> URI: git://git.openembedded.org/openembedded=0A=
> Branch: org.openembedded.dev (master)=0A=
>=0A=
> Paul Menzel (1):=0A=
>      binutils-{canadian,cross}-sdk_2.18: Remove checksums and implicitly =
update them=0A=
=0A=
Sorry if it wasn't clear on the wiki page but what I'm asking for is a git =
branch you've created somewhere (github, gitorious, whatever, is fine) and =
tested that you've got all of the changes you need cherry-picked in or othe=
rwise applied.  Thanks!=0A=
=0A=
- --=0A=
Tom=0A=
=0A=
-----BEGIN PGP SIGNATURE-----=0A=
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)=0A=
Comment: GPGTools - http://gpgtools.org=0A=
=0A=
iEYEARECAAYFAk6mIkMACgkQdZngf2G4WwNWIwCfdDRM8w8ouqgCV4h7az5a797N=0A=
dxQAnjsK4/yvXOsbAxUJoCW95GdBQaqk=0A=
=3DSxUa=0A=
-----END PGP SIGNATURE-----=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=



Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RrSQV-0003pn-OG for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 11:56:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0TAmA1r008693;
	Sun, 29 Jan 2012 10:48:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07750-02; Sun, 29 Jan 2012 10:48:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0TAlxuZ008687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 29 Jan 2012 10:48:00 GMT
Message-ID: <1327834082.7807.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sun, 29 Jan 2012 10:48:02 +0000
In-Reply-To: <2431052.r2DnJ7okSu@helios>
References: <ED3E0BCACD909541BA94A34C4A164D4C40237014@post.tritech.se>
	<2431052.r2DnJ7okSu@helios>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q0TAmA1r008693
Cc: yocto@yoctoproject.org,
	Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] exmap-console access forbidden
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
X-List-Received-Date: Sun, 29 Jan 2012 10:56:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-01-28 at 14:58 +0000, Paul Eggleton wrote:
> On Friday 27 January 2012 09:34:26 Mats K=C3=A4rrman wrote:
> > Does anyone know why the downloads server at yoctoproject.org has the=
 source
> > tars of exmap-console as "Access Forbidden"? Other tars from the same
> > server is OK to download.
>=20
> I seem to be able to download the tarballs from=20
> http://downloads.yoctoproject.org/releases/exmap-console/... are you st=
ill=20
> experiencing this problem?

I did forward the email to Michael and Beth who looked into it and did
find and resolve a permissions problem. I think they were trying to
figure out the root cause before replying.

Anyhow, it should be resolved now.

Cheers,

Richard




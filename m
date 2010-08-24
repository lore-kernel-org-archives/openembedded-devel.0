Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1OnzGg-0006HH-43
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 21:34:59 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7O00BM867S5QF0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	24 Aug 2010 13:33:28 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 213959; Tue, 24 Aug 2010 13:33:17 -0500
Received: from [192.168.1.2] by rkmorris.us with HTTP; Tue,
	24 Aug 2010 13:33:16 -0500
From: <openembedded@rkmorris.us>
Date: Tue, 24 Aug 2010 13:33:16 -0500
X-Mailer: Axigen WebMail
To: openembedded-devel@lists.openembedded.org
Message-id: <1282674796964487500@rkmorris.us>
In-reply-to: <AANLkTimHMk2JCmk-f7v+f20oOCLimFmvmMOXHNAXWbZV@mail.gmail.com>
References: <1282619507633564500@rkmorris.us>
	<AANLkTim+-=cuW25MrceDNWwExvw+gHcs=jdaw8LCo17L@mail.gmail.com>
	<1282668095790087500@rkmorris.us>
	<AANLkTimHMk2JCmk-f7v+f20oOCLimFmvmMOXHNAXWbZV@mail.gmail.com>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 4
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Build Directory inside conf
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
X-List-Received-Date: Tue, 24 Aug 2010 19:34:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

That makes sense - thanks!
One more question then, as this isn't mentioned in the "Getting Started" s=
ection of the Wiki - do I need to configure this? I ask because I'm having =
issues with my build results right now (kernel is fine, initrd is hanging).
Thanks again,... Russell

On Tue, Aug 24, 2010 01:21  PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Aug 24, 2010 at 9:41 AM, <openembedded@rkmorris.us> wrote:
>=20
> > Hi,
> > Maybe we're not talking about the same thing ... but to confirm - insi=
de
> > the conf directory there is a build directory, with the file "Power
> > Macintosh-darwin.conf" inside. Is this really supposed to be part of t=
he
> > "official" build?
>=20
>=20
> No, we're talking about exactly the same thing.  "build" in this context=
 is
> referring to the *build machine*, not a "build" as in the output from
> running bitbake.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
From dp@xora.org.uk Tue Aug 24 22:18:32 2010
Received: from www.xora.org.uk ([80.68.91.202] helo

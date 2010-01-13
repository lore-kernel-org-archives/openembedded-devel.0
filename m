Received: from bay0-omc2-s3.bay0.hotmail.com ([65.54.190.78])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <salehusman@hotmail.com>) id 1NV42K-0005uZ-An
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 15:17:31 +0100
Received: from BAY127-W27 ([65.54.190.125]) by bay0-omc2-s3.bay0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 13 Jan 2010 06:14:13 -0800
Message-ID: <BAY127-W27A372814070C4B6AFAFB9D86B0@phx.gbl>
X-Originating-IP: [203.82.49.5]
From: saleh usman <salehusman@hotmail.com>
To: <gary@mlbassoc.com>, Openembedded Discussion
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2010 19:14:13 +0500
Importance: Normal
In-Reply-To: <4B4D0AB4.1020402@mlbassoc.com>
References: <BAY127-W199A6B7DA19A55E32E8648D86C0@phx.gbl>
	<d1b08f941001120644q1a82954bhc3e867abadc9fa66@mail.gmail.com>
	<loom.20100112T154902-934@post.gmane.org>,
	<4B4D0AB4.1020402@mlbassoc.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 13 Jan 2010 14:14:13.0886 (UTC)
	FILETIME=[AF1559E0:01CA945A]
X-SA-Exim-Connect-IP: 65.54.190.78
X-SA-Exim-Mail-From: salehusman@hotmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbaking helloworld
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
X-List-Received-Date: Wed, 13 Jan 2010 14:17:31 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I've a board on which linux is actually running then I think I only need ex=
ecutables.Is it so?
What console-image actually does.Which functionality executables of console=
-image will perform?
Saleh  =20

> Date: Tue=2C 12 Jan 2010 16:50:12 -0700
> From: gary@mlbassoc.com
> To: openembedded-devel@lists.openembedded.org
> CC: salehusman@hotmail.com
> Subject: Re: [oe] bitbaking helloworld
>=20
> On 01/12/2010 07:50 AM=2C Saleh Usman wrote:
> > Andrea Adami<andrea.adami<at>  gmail.com>  writes:
> >
> >>
> >> Saleh=2C the ipk can be opened with ar -x
> >> Usually one *installs* the ipk...otherwise you can have hard time with
> >> the dependencies.
> >> (not for helloworld=2C happily :)
> >>
> >> Regards
> >>
> >> Andrea
> >>
> > and which ipk I should extract that contains executable to be run on my=
 platform
>=20
> I think there's a bit of confusion here.  Building 'helloword'
> does not create a useful embedded environment=2C i.e. you can't
> run it on target/embedded hardware directly.  IIRC you are
> trying to deploy (keyword!) this on an OMAP platform.  This
> means that you'll need to build something more substantial
> that has all the base pieces required to get Linux running
> on that hardware.
>=20
> I'd suggest that you try building something like 'console-image'
> This *will* create files in the tmp/deploy/... tree that you've
> been told to use.  Once you figure out how to get those files
> onto your target and run them=2C then you can experiment with
> adding additional packages=2C etc.
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
 		 	   		 =20
_________________________________________________________________
Windows Live Hotmail: Your friends can get your Facebook updates=2C right f=
rom Hotmail=AE.
http://www.microsoft.com/middleeast/windows/windowslive/see-it-in-action/so=
cial-network-basics.aspx?ocid=3DPID23461::T:WLMTAGL:ON:WL:en-xm:SI_SB_4:092=
009=


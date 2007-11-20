Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1IuWYL-00043e-PU
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 18:06:25 +0100
Received: from home.lan (c62-222.icpnet.pl [62.21.62.222])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 708DC10CC198
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 12:27:51 -0500 (EST)
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2007 18:04:06 +0100
User-Agent: KMail/1.9.7
References: <20071119120819.GA17788@lenovo>
	<1195551213.6337.9.camel@localhost.localdomain>
	<008f01c82b8a$89c8ab50$6e01a8c0@twilight>
In-Reply-To: <008f01c82b8a$89c8ab50$6e01a8c0@twilight>
MIME-Version: 1.0
Message-Id: <200711201804.08660.openembedded@haerwu.biz>
Subject: Re: Getting Started -Makefile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2007 17:06:26 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 20 listopada 2007, Mike (mwester) napisa=B3:

> I ask the OE team why are they are philosophically opposed to driving
> bitbake with make? =20

I am ok with something like "make update" or "make setup" which will=20
update BitBake/OE and prepare environment to do builds. But "make=20
build-package-with-this-name" scares me as this overcomplicate things for=20
me.

In time when OpenMoko used own makefile (OM-2007.1) I used it because it=20
took all "you need this overlay" etc crap from me. But only to setup and=20
update - I did builds with calling BitBake by hand (after sourcing=20
generated "setup-env" script).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        What a strange game. The only winning move is not to play.
        		-- WOPR, "War Games"



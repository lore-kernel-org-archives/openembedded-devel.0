Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mfu5S-00050c-4b
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 13:21:17 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1F3451B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 11:07:44 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 13:03:12 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A937831.2000304@4d-electronics.co.nz> <4A93A9E3.7090605@epfl.ch>
In-Reply-To: <4A93A9E3.7090605@epfl.ch>
MIME-Version: 1.0
Message-Id: <200908251303.12718.holger+oe@freyther.de>
Subject: Re: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 11:21:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 August 2009 11:07:47 Valentin Longchamp wrote:
> Matthew Dombroski wrote:
> > It is possible to make cmake use a toolchain file that defines flags,
> > search
> > paths and any other cmake options.
> >
> > The main reason for making openembedded generate a toolchain file is
> > to enable the building of complex packages. Without it a package
> > requiring Qt4 or boost (or one of many other packages) probably wont find
> > the right libs and won't build properly.
>
> I have had no problem with boost and with Qt4, I have been able to
> achieve similar results without the toolchain file, only by using a
> qt.conf file as Zecke had suggested to me.

Hey,

could you come up with a patch or help me to work on a patch?

z.




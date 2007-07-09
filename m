Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1I7tcO-0001Cx-Bc
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 15:49:36 +0200
Received: from xora.org.uk ([::ffff:87.246.78.27])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Mon, 09 Jul 2007 14:44:00 +0100
	id 00030909.46923BA0.000052CE
Date: Mon, 9 Jul 2007 14:42:56 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070709134256.GD2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
Mime-Version: 1.0
In-Reply-To: <1005211919.20070709153513@vanille-media.de>
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 13:49:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 09, 2007 at 03:35:13PM +0200, Dr. Michael Lauer wrote:
> I agree with Paul's "they provide *some default* screen resolution and
> orientation.". Almost all our screen devices can be rotated on-the-fly
> anyway. The MACHINE_DISPLAY_ namespace is mainly UI frameworks and
> applications, as much as native framebuffer rotations and stuff are
> important to know, they're less relevant here.
> 
But this argument makes the variables useless as if you support on the fly
rotate then the UI framework must support dynamic resize.

So are we adding these global variables solely in order to tell opie what
size backgrounds to ship?

Graeme




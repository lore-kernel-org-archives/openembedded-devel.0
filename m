Received: from [137.79.94.127] (helo=s383.jpl.nasa.gov)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ehovland@s383.jpl.nasa.gov>) id 1Gl9cY-0005VH-TO
	for openembedded-devel@openembedded.org; Fri, 17 Nov 2006 20:43:31 +0100
Received: from mage.jpl.nasa.gov (mage [137.78.15.62])
	by s383.jpl.nasa.gov (8.12.10/8.12.10) with ESMTP id kAHJf6d7022147
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2006 11:41:06 -0800 (PST)
Received: by mage.jpl.nasa.gov (Postfix, from userid 4960)
	id AFE6F300016B; Fri, 17 Nov 2006 11:41:06 -0800 (PST)
Date: Fri, 17 Nov 2006 11:41:06 -0800
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@openembedded.org
Message-ID: <20061117194106.GA25171@mage.jpl.nasa.gov>
References: <d46153c40611170647m2be6b5f6jd7cbe86ccdfc5dc@mail.gmail.com>
	<41e5b4c20611170737p4b1138c0m8798ea67e67d449@mail.gmail.com>
	<d46153c40611170917k1dd90d89ob384306caeada009@mail.gmail.com>
	<74d0deb30611170944j7b93a8ecm3b2b036111a0b6dd@mail.gmail.com>
	<d46153c40611170953g28ddc98dp91bcd1944f171ede@mail.gmail.com>
	<455DF8E8.4060801@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <455DF8E8.4060801@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.9i
Subject: Re: Problem building dbus-glib-0.72
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
X-List-Received-Date: Fri, 17 Nov 2006 19:43:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 17, 2006 at 07:01:12PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Andrew Paulsen schreef:
> >> I think dbus-glib 0.72 needs dbus >= 0.94.
> >> The dbus-1.0 in the include path only denotes the protocol version.
> >>
> >> regards
> >> Philipp
> >
> > Ok, I'll rephrase my question then.  How do I change the package
> > versions that are being built?
> >
> > Again, my local.conf contains:
> > MACHINE = "compulab-pxa270"
> > DISTRO = "familiar-unstable"
> >
> > and I'm trying to "bitbake gpe-image"
> 
> Familiar is unmaintained in OE, so your error messages don't surprise us.

I try to keep up, but I am afraid I have too many chores to keep
familiar as fresh as I would like in OE.

It is maintained here though:
http://familiar.handhelds.org/#build

E

-- 
Erik Hovland
mail: erik AT hovland DOT org
web: http://hovland.org/
PGP/GPG public key available on request



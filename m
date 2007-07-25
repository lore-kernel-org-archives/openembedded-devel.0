Received: from [216.215.6.39] (helo=ice.mudshark.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <jack@ice.mudshark.org>) id 1IDjKf-0000z2-9R
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2007 18:03:25 +0200
Received: by ice.mudshark.org (Postfix, from userid 1000)
	id E129D13404D; Wed, 25 Jul 2007 09:02:08 -0700 (PDT)
Date: Wed, 25 Jul 2007 09:02:08 -0700
From: jack-oe@mudshark.org
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070725160208.GY3604@ice.mudshark.org>
References: <E1IDL1e-0002ro-9i@linuxtogo.org>
	<46A60832.30203@dominion.kabel.utwente.nl>
	<46A7230E.6000707@kernelconcepts.de>
	<46A7262F.1080406@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <46A7262F.1080406@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.1i
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Why many small commits are better than one big one.
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
X-List-Received-Date: Wed, 25 Jul 2007 16:03:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 25, 2007 at 12:30:07PM +0200, Koen Kooi wrote:
 
> You are right that it's more productive to fix small errors than to disapprove, but:
> I did that the first few times with PACKAGE_ARCH = "${MACHINE}", and people still keep
> adding it, so now I'm doing dissaprove + mail to oe-devel to raise awareness.
> Fixing errors afterwards is only productive if people learn from it and stop making the
> same error again, which wasn't the case here.

"disapprove" is a useful command. 

If you commit your changes in multiple orthogonal commits, it is possible to
disapprove only the controversial parts. Prevents throwing the baby out with
the bathwater.

Cheers, 

--Jack 

--
Jack (John) Cummings                           http://mudshark.org/
PGP fingerprint: F18B 13A3 6D06 D48A 598D  42EA 3D53 BDC8 7917 F802



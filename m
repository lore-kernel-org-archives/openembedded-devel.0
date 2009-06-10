Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MEQeo-0007bV-Os
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 18:28:10 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MEQVP-0002ux-GU
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 17:18:27 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1MEQVP-0001rk-De
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 17:18:27 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <h0ok27$3ue$1@ger.gmane.org>
References: <h0ok27$3ue$1@ger.gmane.org>
Date: Wed, 10 Jun 2009 17:18:27 +0100
Message-Id: <1244650707.21585.72.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: fortran problem on hardy build machine (gcc-cross fails do_compile)
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
X-List-Received-Date: Wed, 10 Jun 2009 16:28:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The error message contains good advice:

configure: error: GNU Fortran is not working; please report a bug [...]
attaching /export/oe/tmp/angstrom/org.openembedded.dev/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.3.3-r4.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgfortran/config.log

What does the config.log file in question say?

p.

On Thu, 2009-06-11 at 00:38 +0900, Rolf Leggewie wrote:
> Hi,
> 
> I've been struggling with gcc-cross failing do_compile on my hardy build
> machine for about half a year now.  It has something to do with fortran.
> I have installed every fortran package I could find in aptitude, yet
> the issue is unresolved.  I'd appreciate if you'd take a look at the
> compile log in http://oss.leggewie.org/oe/gcc-cross-4.3.3-r4.1/temp/ and
> let me know if you have any suggestion.
> 
> Regards
> 
> Rolf
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




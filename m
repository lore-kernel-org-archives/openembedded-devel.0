Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MKDnL-0002zr-8s
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 17:56:55 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MKDKz-0002gm-AA
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 16:27:37 +0100
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1MKDKz-0002QE-0p
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 16:27:37 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1246027189-26894-1-git-send-email-msmith@cbnco.com>
References: <1246027189-26894-1-git-send-email-msmith@cbnco.com>
Date: Fri, 26 Jun 2009 16:27:36 +0100
Message-Id: <1246030056.6690.291.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 
Subject: Re: [PATCH] Add fping 2.4b2_to, plus patch from SourceForge.
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
X-List-Received-Date: Fri, 26 Jun 2009 15:56:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-26 at 10:39 -0400, Michael Smith wrote:
>  conf/checksums.ini                              |    4 +
>  conf/licenses.conf                              |    2 +-
>  recipes/fping/files/sourceforge-truckload.patch |  257 +++++++++++++++++++++++
>  recipes/fping/fping_2.3+2.4b2to.bb              |   12 +

Thanks, I checked this in.  The SRC_URI looks a bit dubious but, given
that the code doesn't seem to have changed since January 2002, I'm not
too worried about it.

p.





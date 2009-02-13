Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>)
	id 1LY0on-0006QZ-6q; Fri, 13 Feb 2009 17:23:09 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>)
	id 1LY0nO-0002vD-IM; Fri, 13 Feb 2009 16:21:42 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>)
	id 1LY0nO-0003RL-C3; Fri, 13 Feb 2009 16:21:42 +0000
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200902131525.34787.openembedded@haerwu.biz>
References: <200902131525.34787.openembedded@haerwu.biz>
Date: Fri, 13 Feb 2009 16:21:41 +0000
Message-Id: <1234542101.3592.46.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: openembedded-devel@openembedded.org
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 16:23:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-02-13 at 15:25 +0100, Marcin Juszkiewicz wrote:
> OE developers usually know that machine config is simple but tell that 
> to Joe Random who only knows that his board use s3c2443 etc. So idea was 
> to create simple few steps wizard which will ask few questions and 
> produce machine config as result. More work would be required on 
> creating kernel recipe because kernel can be from svn/cvs/git or tarball 
> + quilt patchset etc...

This seems like it's really a documentation problem.  It's hard to see
that the wizard would be able to perform any useful, non-trivial
processing of its own: it'd basically just be taking the information
from the user and regurgitating it in a slightly different format.

If users are finding it hard to figure out how to create a machine
description then the right answer is probably a wiki page or a chapter
in the manual that explains in small words how to do it.

p.





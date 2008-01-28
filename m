Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <dp@xora.org.uk>) id 1JJW4E-0003JW-S1
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 16:38:38 +0100
Received: from cimmeria ([::ffff:78.86.128.56])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Mon, 28 Jan 2008 15:38:44 +0000
	id 000383A2.479DF705.00004BC4
Date: Mon, 28 Jan 2008 15:40:22 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080128154022.7d4584db@cimmeria>
In-Reply-To: <20080128144821.1b6f2741@widy.localdomain>
References: <479D9AA9.8020704@student.utwente.nl>
	<20080128144821.1b6f2741@widy.localdomain>
X-Mailer: Claws Mail 3.2.0 (GTK+ 2.12.0; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev gnuplot: update 4.2.2, add 4.3.0+cvs
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
X-List-Received-Date: Mon, 28 Jan 2008 15:38:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Jan 2008 14:48:21 +0200
Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hm, but why that file is in .dev branch at all? What was idea of
> removing 2007 .conf and leaving preferred-versions? Doing a grep, it
> is referenced only by angstrom-2007-for-openmoko.inc, so shouldn't it
> be merged there or renamed to make it clear that it relates more to
> openmoko?
> 
I shall rename it later when I get a chance to indicate only OpenMoko
use it.

Angstrom can then go forward with new prefferred versions for 2008.1

Graeme



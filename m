Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JJXmv-0005qd-S0
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 18:28:53 +0100
Received: from [192.168.1.105] (e180149035.adsl.alicedsl.de [85.180.149.35])
	by drlauer-research.com (Postfix) with ESMTP id AFA1558438F;
	Mon, 28 Jan 2008 18:32:36 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2008 18:28:58 +0100
User-Agent: KMail/1.9.7
References: <479D9AA9.8020704@student.utwente.nl>
	<20080128144821.1b6f2741@widy.localdomain>
	<20080128154022.7d4584db@cimmeria>
In-Reply-To: <20080128154022.7d4584db@cimmeria>
MIME-Version: 1.0
Message-Id: <200801281828.58780.mickey@vanille-media.de>
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
X-List-Received-Date: Mon, 28 Jan 2008 17:28:54 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 28 January 2008 16:40:22 Graeme Gregory wrote:
> On Mon, 28 Jan 2008 14:48:21 +0200
>
> Paul Sokolovsky <pmiscml@gmail.com> wrote:
> > Hm, but why that file is in .dev branch at all? What was idea of
> > removing 2007 .conf and leaving preferred-versions? Doing a grep, it
> > is referenced only by angstrom-2007-for-openmoko.inc, so shouldn't it
> > be merged there or renamed to make it clear that it relates more to
> > openmoko?
>
> I shall rename it later when I get a chance to indicate only OpenMoko
> use it.

How about making it generic-preferred-versions.inc hence resurrecting 
the "generic" distribution until we have the default versions configured 
enough, so that you can build without setting a DISTRO?

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



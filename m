Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAUcO-0007Ku-VB
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 21:53:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MAUU7-0007BL-Kz
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 19:44:51 +0000
Received: from CPE00045a927e3e-CM001225463986.cpe.net.cable.rogers.com
	([99.245.234.255]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 19:44:51 +0000
Received: from msmith by
	CPE00045a927e3e-CM001225463986.cpe.net.cable.rogers.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 19:44:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Smith <msmith@cbnco.com>
Date: Sat, 30 May 2009 19:44:40 +0000 (UTC)
Message-ID: <loom.20090530T193103-897@post.gmane.org>
References: <1243535013-10090-1-git-send-email-msmith@cbnco.com>	<20090528193604.GB2625@denix.org>
	<4A1EF22E.2040500@balister.org> <4A1EF581.30503@cbnco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 99.245.234.255 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.14) Gecko/20080417 BonEcho/2.0.0.14)
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/2] tcpdump: fix mix of tabs	and	spaces	in	do_configure()
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
X-List-Received-Date: Sat, 30 May 2009 19:53:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Michael Smith <msmith <at> cbnco.com> writes:

> Philip Balister wrote:
> > It doesn't look like Michael has commit access. I did try applying it, 
> > and git-am said there was a mix of tabs and spaces.

> Yes, the SRC_URI lines were lined up with spaces. It looked nice enough 
> that I didn't fix it;

Hi Philip,

How can I get git am to warn about the mixing? I tried git am
--whitespace=error-all on the mbox file from patchwork, but it doesn't seem to
find a mix; actually, in the patch files there are no added lines with spaces,
only removed lines and a context line.

Mike




Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KJ2TY-0001Cj-TF
	for openembedded-devel@openembedded.org; Wed, 16 Jul 2008 10:35:04 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KJ2Su-0004hJ-Tc
	for openembedded-devel@openembedded.org; Wed, 16 Jul 2008 08:34:24 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 16 Jul 2008 08:34:24 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jul 2008 08:34:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 16 Jul 2008 10:34:17 +0200
Message-ID: <g5kbqa$but$1@ger.gmane.org>
References: <735693612@web.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <735693612@web.de>
Sender: news <news@ger.gmane.org>
Subject: Re: squashfs-lzma bitbake recipe needed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 16 Jul 2008 08:35:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Johannes Schauer wrote:
> Since quite some time now I'm into the creation of an offline wikipedia for embedded devices

you should have sent that mail earlier.  I've been doing some work on
this and have already checked in a few recipes.

> The most important ingredient for this to work is the use of the squashfs filesystem as the storage format as I did not want to create just another file format.

I am not sure this is the most appropriate.  My tests indicate a size
increase of at least 100%.

I think my work should be pretty well documented in bug 3711.  There are
uncommitted bits and pieces I have flying around locally, but the
general direction is spelt out there.

Before starting work, you should always consult the bug tracker.  If
there is no ticket about a task yet, open a new one.  This saves us from
a lot of frustration and double work.

As far as lzma module is concerned, I think it's also been done
somewhere.  "rgrep lzma packages/" is your friend.

Regards

Rolf




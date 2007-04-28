Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HhpmT-00088C-Uu
	for openembedded-devel@openembedded.org; Sat, 28 Apr 2007 18:28:18 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hhpdj-0007lH-BZ
	for openembedded-devel@openembedded.org; Sat, 28 Apr 2007 18:19:15 +0200
Received: from f7301.f.ppp-pool.de ([195.4.115.1])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 28 Apr 2007 18:19:15 +0200
Received: from no2spam by f7301.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 28 Apr 2007 18:19:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 28 Apr 2007 18:19:04 +0200
Message-ID: <f0vs5r$6pm$1@sea.gmane.org>
References: <20070427105722.GA4340@twibble.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f7301.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <20070427105722.GA4340@twibble.org>
Sender: news <news@sea.gmane.org>
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Apr 2007 16:28:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jamie Lenehan wrote:

> You need to build perl-native 5.8.8 and then perl 5.8.8.

I tried DISTRO=sharprom-compatible.  perl-native-5.8-8 builds fine, but
unfortunately, perl itself still has issues.  Bug 1700 is not yet resolved.




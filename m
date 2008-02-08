Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JNZLE-0004GG-7b
	for openembedded-devel@openembedded.org; Fri, 08 Feb 2008 20:56:56 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JNZLM-00037y-1H
	for openembedded-devel@openembedded.org; Fri, 08 Feb 2008 19:57:04 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 08 Feb 2008 19:57:04 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 08 Feb 2008 19:57:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 08 Feb 2008 20:56:55 +0100
Message-ID: <foic69$d7f$1@ger.gmane.org>
References: <E1JNHzO-0001Y7-HO@linuxtogo.org>
	<74d0deb30802080425s7c69bf95y4725bb48bc9088f6@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <74d0deb30802080425s7c69bf95y4725bb48bc9088f6@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] org.oe.dev mkbold-mkitalic-native: initial commit. partly closes 1362 (incorporate stuff from openzaurus-ja project)
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
X-List-Received-Date: Fri, 08 Feb 2008 19:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

pHilipp Zabel schrieb:
> Hi,
> 
> I think this should not live in xorg-app but in its own directory.

Well, something as minimal as this native tool does not warrant its own
directory, I think.  I think the right thing to do is to group together
with other bdf fonts and their tools (I will try to integrate the bdf
fonts into the font-update-common framework when I have the time).  That
is also the reason it has so far landed in xorg-app: other bdf-related
stuff is there.

Would you object to move them out into something like packages/bdf-fonts/?




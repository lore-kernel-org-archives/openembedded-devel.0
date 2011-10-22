Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHjcg-00089O-DP for openembedded-devel@lists.openembedded.org;
	Sun, 23 Oct 2011 00:00:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RHjWz-0001Y6-Gg for openembedded-devel@lists.openembedded.org;
	Sat, 22 Oct 2011 23:55:05 +0200
Received: from static-94-33-39-20.clienti.tiscali.it ([94.33.39.20])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2011 23:55:05 +0200
Received: from pierluigi.passaro by static-94-33-39-20.clienti.tiscali.it with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Oct 2011 23:55:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
Date: Sat, 22 Oct 2011 21:51:11 +0000 (UTC)
Message-ID: <loom.20111022T231054-510@post.gmane.org>
References: <4D3DE56B.7020803@freyther.de> <4D3DF7CF.7010308@freyther.de>
	<4D3DFE34.3090706@freyther.de>
	<loom.20111021T210119-168@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 94.33.39.20 (Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20100101 Firefox/7.0.1)
Subject: Re: build errors in openssl-native
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
X-List-Received-Date: Sat, 22 Oct 2011 22:00:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Wilder,
try dropping libdeps-first.patch in openssl-native recipe.
It does not allow openssl-native build on ubuntu 11.10.

Regards
Pierlugi





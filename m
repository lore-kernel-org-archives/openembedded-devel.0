Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAxa8-0007xE-GR
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 04:49:00 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MAxRj-0003Ln-Uk
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 02:40:19 +0000
Received: from p4225-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.119.225])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 02:40:19 +0000
Received: from no2spam by p4225-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 02:40:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 01 Jun 2009 11:40:01 +0900
Message-ID: <gvvf23$n0p$1@ger.gmane.org>
References: <20090526193632.GA23428@misibook.miska.isageek.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p4225-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <20090526193632.GA23428@misibook.miska.isageek.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] xmms-embedded: fixed build
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
X-List-Received-Date: Mon, 01 Jun 2009 02:49:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michal Hrusecky wrote:
> There was some .debug directories packaged in non-debug package. QA
> error fixed by adding them to debug package.

Builds fine for me as-is.

http://tinderbox.openembedded.net/packages/xmms-embedded/




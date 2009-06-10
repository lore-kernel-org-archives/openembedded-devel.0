Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MEQN0-0001tU-4w
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 18:09:46 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MEQDb-0002mn-8H
	for openembedded-devel@openembedded.org; Wed, 10 Jun 2009 16:00:03 +0000
Received: from p3077-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.118.77])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 16:00:03 +0000
Received: from no2spam by p3077-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 10 Jun 2009 16:00:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 11 Jun 2009 00:58:56 +0900
Message-ID: <h0ol82$79k$2@ger.gmane.org>
References: <h0nft3$jso$1@ger.gmane.org>
	<20090610123349.GT26065@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <20090610123349.GT26065@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: deduce git revision from mtn revision
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
X-List-Received-Date: Wed, 10 Jun 2009 16:09:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> I used mtn to find the whole commit, copy the commit message info and
> then search for that commit message in git.

I guess that is the only way that will consistently work.

Maybe we could prepare and store a list somewhere.




Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7I5F-0000Hk-Ce
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 01:53:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7Hxq-0003LM-5n
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 23:46:18 +0000
Received: from p5b3b3e33.dip.t-dialin.net ([91.59.62.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 23:46:18 +0000
Received: from no2spam by p5b3b3e33.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 23:46:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 22 May 2009 01:46:01 +0200
Message-ID: <gv4p3s$pbm$1@ger.gmane.org>
References: <gv4d2h$oft$1@ger.gmane.org>	<gv4ea5$sbp$1@ger.gmane.org>	<gv4g4j$2r4$1@ger.gmane.org>	<gv4i2t$90h$1@ger.gmane.org>
	<gv4md5$jmq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3e33.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <gv4md5$jmq$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 23:53:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> s/autoconf/autoconf >= X.Y/

My attempt at indicating that the solution might be to indicate in the 
bb file that autoconf version X.Y or higher is necessary to build the 
package (symbolizing a replace operation on the DEPENDS line of the bb)




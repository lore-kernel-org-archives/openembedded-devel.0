Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MABhh-0007fx-VZ
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 01:41:38 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MABZX-0003Qk-2C
	for openembedded-devel@openembedded.org; Fri, 29 May 2009 23:33:11 +0000
Received: from p7073-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.122.73])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 29 May 2009 23:33:11 +0000
Received: from no2spam by p7073-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 29 May 2009 23:33:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 30 May 2009 08:32:56 +0900
Message-ID: <gvprba$12c$1@ger.gmane.org>
References: <1243002791-519-1-git-send-email-no2spam@nospam.arcornews.de>
	<gv6dd7$rbq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p7073-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <gv6dd7$rbq$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] bluez: 3.36 does not need the hciattach-ti-bts.patch. Fixes do_patch.
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
X-List-Received-Date: Fri, 29 May 2009 23:41:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Explanation: The TI patch is not necessary for 3.36.  My patch to OE is 
> necessary to make sure that recipes/bluez/bluez-cups-backend_3.33.bb 
> actually succeeds in do_patch.

no objections in about a week, so I took the liberty to push this.




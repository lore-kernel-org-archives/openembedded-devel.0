Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAQ16-00041q-HS
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 16:58:36 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MAPsp-0003Qm-2X
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 14:50:03 +0000
Received: from p7073-ipngn201marunouchi.tokyo.ocn.ne.jp ([114.177.122.73])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 14:50:03 +0000
Received: from no2spam by p7073-ipngn201marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 30 May 2009 14:50:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 30 May 2009 23:47:23 +0900
Message-ID: <gvrgts$7uc$2@ger.gmane.org>
References: <20090529233958.GA16815@misibook.miska.isageek.net>
	<200905301417.14796.bluelightning@bluelightning.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p7073-ipngn201marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <200905301417.14796.bluelightning@bluelightning.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] zuc: fixed build
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
X-List-Received-Date: Sat, 30 May 2009 14:58:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Eggleton wrote:
> On Sat, 30 May 2009, Michal Hrusecky wrote:
>> Corrected include name so it can be found and package can be built again.

> Applied, thanks.

do_fetch fails for this package.  Can you guys please look into this?




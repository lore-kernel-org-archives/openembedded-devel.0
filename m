Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HQlT7-0005xc-B7
	for openembedded-devel@openembedded.org; Mon, 12 Mar 2007 15:25:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HQlOk-0003GG-UL
	for openembedded-devel@openembedded.org; Mon, 12 Mar 2007 15:21:15 +0100
Received: from f73eb.f.ppp-pool.de ([195.4.115.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 12 Mar 2007 15:21:14 +0100
Received: from no2spam by f73eb.f.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 12 Mar 2007 15:21:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 12 Mar 2007 15:13:35 +0100
Message-ID: <et3n6g$7cv$1@sea.gmane.org>
References: <274295013.20070311040657@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: f73eb.f.ppp-pool.de
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
In-Reply-To: <274295013.20070311040657@gmail.com>
Sender: news <news@sea.gmane.org>
Subject: Re: [RFC] Allow to limit generated binary locales to predefined list
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
X-List-Received-Date: Mon, 12 Mar 2007 14:25:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>   Binary locale generation for the entire locate set provided by GLIBC
> takes noticeable amount of time (several hours).
[...]
>   The solution would be to allow to optionally constrain set of
> generated locales to a predefined list.

Good idea.  And I can say that the patch to glibc-package.bbclass I 
prepared with Paul's help (big thank you!) has been working fine for me 
for a few weeks now.

+1 from me.




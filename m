Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5JXk-0005b0-VM
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 13:30:57 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5JUr-0004rc-04
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 12:27:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 12:27:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 26 Nov 2008 12:27:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 26 Nov 2008 13:27:48 +0100
Message-ID: <ggjfc5$s77$1@ger.gmane.org>
References: <gghjh1$dg1$1@ger.gmane.org>	<200811252242.05674.openembedded@haerwu.biz>	<gghsc8$jot$1@ger.gmane.org>	<200811261011.09918.openembedded@haerwu.biz>	<ggjbfl$fgh$1@ger.gmane.org>
	<1227699097.15601.28.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227699097.15601.28.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Wed, 26 Nov 2008 12:30:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 12:31, Phil Blundell wrote:
> On Wed, 2008-11-26 at 12:21 +0100, Koen Kooi wrote:
>>> ${PN}-license package on which all entries from PACKAGES will RDEPEND?
>> Any objections to doing it this way till we have a proper bbclass?
>
> I think this is a fine idea.  It should be a DISTRO opt-in choice, of
> course, but I can't see any reason not to provide the facility.

My idea was to make it opt-in on a per package basis since DISTROs can 
include base-files-doc for the most commit licenses (GPL, MIT, BSD, etc).

regards,

Koen




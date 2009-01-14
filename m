Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LN5Dd-00060D-L1
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 13:51:37 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LN57G-0006kp-Lg
	for openembedded-devel@openembedded.org; Wed, 14 Jan 2009 12:45:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 12:45:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 14 Jan 2009 12:45:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 14 Jan 2009 13:43:19 +0100
Message-ID: <gkkml8$3uf$2@ger.gmane.org>
References: <496CFA6B.5060108@gmail.com>
	<1fea892d0901140416p6cfcf853k742b23c24ac8a59b@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <1fea892d0901140416p6cfcf853k742b23c24ac8a59b@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Ipaq 31x ...
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
X-List-Received-Date: Wed, 14 Jan 2009 12:51:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-01-09 13:16, Anatoly Shipitsin wrote:
> On Wed, Jan 14, 2009 at 01:32, Jdatalog converter<
> jdatalog.converter@gmail.com>  wrote:
>
>> Hello all,
>>
>> I'm interested to run Linux on my Ipaq 314 based on following platform :
>> http://www.sirf.com/products/SiRFtitanProductInsert.pdf
>>
>> I don't know how to create a new file in platform subdir.
>>
>> After long search on the net i need some help.
>>
> See conf/distro/minimal.conf

For any ARM based platform the only distro you can expect to work across 
the range is angstrom. Especially newer cores like arm11 and cortex 
benefit from it.

regards,

Koen





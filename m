Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N4sYG-0001nd-06 for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 09:46:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N4sX9-0005Ap-1A
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 09:45:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 09:45:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2009 09:45:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Nov 2009 09:41:42 +0100
Message-ID: <hcm606$u90$2@ger.gmane.org>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
	<200911020306.33189.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <200911020306.33189.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 08:46:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-11-09 03:06, Holger Hans Peter Freyther wrote:
> On Sunday 01 November 2009 21:35:32 Leon Woestenberg wrote:
>> Hello,
>>
>> On Thu, Oct 29, 2009 at 12:41 PM, Marcin Juszkiewicz
>>
>> <marcin@juszkiewicz.com.pl>  wrote:
>>> [archivename]
>>> url0=url-to-sources
>>> url1=alternative-url-to-sources
>>> url2=another-alternative-url-to-sources
>>> md5=md5sum
>>> sha256=sha256sum
>>
>> Can we simplify this a bit? i.e.
>>
>> archivename
>> url=url-to-sources
>> url=alternative-url-to-sources
>> url=another-alternative-url-to-sources
>> md5=md5sum
>> sha256=sha256sum
>>
>> Why not just url instead of url0, url1, url2, ... ?
>
> the problem with archivename there is no gurantee that the name will be
> globally unique. E.g. with Open Palmtop Integreated Environment (OPIE) One
> Password.. (OPIE) there was a clash and we might or might not have had a clash
> in release versions too...

Archives get stored by archive name in DL_DIR already, so that's a moot 
point.

regards,

Koen




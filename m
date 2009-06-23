Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvcQ-0003Dj-0X
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:20:25 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO004P75ZEEER1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:09:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B43ED14AF5F; Mon,
	22 Jun 2009 22:09:14 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:09:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020914.GO14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-12-git-send-email-marcin@juszkiewicz.com.pl>
	<h1noff$af4$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1noff$af4$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 035/125] atd: fix spelling of LICENSE
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
X-List-Received-Date: Tue, 23 Jun 2009 02:20:34 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 01:04:15PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Rolf Leggewie<oe-devel@rolf.leggewie.biz>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/atd/atd_0.70.bb |    4 ++--
>>   recipes/atd/atd_0.80.bb |    4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes/atd/atd_0.70.bb b/recipes/atd/atd_0.70.bb
>> index 9862fac..7f2193d 100644
>> --- a/recipes/atd/atd_0.70.bb
>> +++ b/recipes/atd/atd_0.70.bb
>> @@ -1,10 +1,10 @@
>>   DESCRIPTION = "Lightweight At Daemon"
>>   SECTION = "base"
>> -LICENSE = "GPLV2"
>> +LICENSE = "GPLv2"
>>   RCONFLICTS = "at"
>>   RREPLACES = "at"
>>
>> -PR = "r4"
>> +PR = "r5"
>>
>>   SRC_URI = "${HANDHELDS_CVS};module=apps/atd;tag=ATD-0_70 \
>>   			file://atd-startup.patch;patch=1;pnum=0"
>> diff --git a/recipes/atd/atd_0.80.bb b/recipes/atd/atd_0.80.bb
>> index f3adbd7..23cf7c4 100644
>> --- a/recipes/atd/atd_0.80.bb
>> +++ b/recipes/atd/atd_0.80.bb
>> @@ -1,10 +1,10 @@
>>   DESCRIPTION = "Lightweight At Daemon"
>>   SECTION = "base"
>> -LICENSE = "GPLV2"
>> +LICENSE = "GPLv2"
>>   RCONFLICTS = "at"
>>   RREPLACES = "at"
>>
>> -PR = "r0"
>> +PR = "r1"
>>
>>   SRC_URI = 
>> "http://projects.linuxtogo.org/frs/download.php/222/${P}.tar.gz"
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



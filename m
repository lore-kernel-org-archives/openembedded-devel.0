Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvbq-0003Cz-7k
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:19:43 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO004E75XKEER1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:08:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 72AA214AF5F; Mon,
	22 Jun 2009 22:08:08 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:08:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020808.GK14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-8-git-send-email-marcin@juszkiewicz.com.pl>
	<h1nogb$af4$5@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1nogb$af4$5@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 031/125] mpfr: Both GPL and LGPL components
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
X-List-Received-Date: Tue, 23 Jun 2009 02:19:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 01:04:43PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Tom Rini<trini@embeddedalley.com>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/mpfr/mpfr.inc |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/mpfr/mpfr.inc b/recipes/mpfr/mpfr.inc
>> index cf898b6..5f7f94c 100644
>> --- a/recipes/mpfr/mpfr.inc
>> +++ b/recipes/mpfr/mpfr.inc
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "A C library for multiple-precision floating-point 
>> computations with exact rounding"
>>   HOMEPAGE = "http://www.mpfr.org/"
>> -LICENSE = "LGPL"
>> +LICENSE = "GPL LGPL"
>>   SECTION = "libs"
>>
>>   inherit autotools
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



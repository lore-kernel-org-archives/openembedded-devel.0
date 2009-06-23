Received: from [206.46.173.11] (helo=vms173011pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvat-0003Bg-Ht
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:18:44 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO007AM5WSFDI1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:07:40 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F22DE14AF5F; Mon,
	22 Jun 2009 22:07:39 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:07:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020739.GJ14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-7-git-send-email-marcin@juszkiewicz.com.pl>
	<h1nogi$af4$6@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1nogi$af4$6@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 030/125] libiconv: 1.12 has GPLv3 binaries	LGPLv2.1 libraries
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
X-List-Received-Date: Tue, 23 Jun 2009 02:18:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 01:04:50PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Tom Rini<trini@embeddedalley.com>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/libiconv/libiconv.inc     |    1 -
>>   recipes/libiconv/libiconv_1.12.bb |    1 +
>>   2 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/libiconv/libiconv.inc b/recipes/libiconv/libiconv.inc
>> index c815210..c8bc290 100644
>> --- a/recipes/libiconv/libiconv.inc
>> +++ b/recipes/libiconv/libiconv.inc
>> @@ -4,7 +4,6 @@ HOMEPAGE = "http://www.gnu.org/software/libiconv"
>>   SECTION = "libs"
>>   PRIORITY = "optional"
>>   NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp 
>> gb utf8"
>> -LICENSE = "LGPL"
>>
>>   SRC_URI = "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz \
>>   	   file://autotools.patch;patch=1 \
>> diff --git a/recipes/libiconv/libiconv_1.12.bb 
>> b/recipes/libiconv/libiconv_1.12.bb
>> index 129eb13..db53178 100644
>> --- a/recipes/libiconv/libiconv_1.12.bb
>> +++ b/recipes/libiconv/libiconv_1.12.bb
>> @@ -1,4 +1,5 @@
>>   require libiconv.inc
>> +LICENSE = "GPLv3 LGPLv2"
>>
>>   PROVIDES = "virtual/libiconv"
>>   PR = "r1"
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



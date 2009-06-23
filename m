Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvZd-00038g-Of
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:17:27 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO008T35U8I3R0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:06:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8F37214AF5F; Mon,
	22 Jun 2009 22:06:08 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:06:08 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020608.GE14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-2-git-send-email-marcin@juszkiewicz.com.pl>
	<h1nkv4$vdi$4@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1nkv4$vdi$4@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 025/125] alsa-lib: This is LGPL not GPL
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
X-List-Received-Date: Tue, 23 Jun 2009 02:17:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 12:04:20PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Tom Rini<trini@embeddedalley.com>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/alsa/alsa-lib_1.0.11.bb |    2 +-
>>   recipes/alsa/alsa-lib_1.0.13.bb |    2 +-
>>   recipes/alsa/alsa-lib_1.0.14.bb |    2 +-
>>   recipes/alsa/alsa-lib_1.0.15.bb |    2 +-
>>   recipes/alsa/alsa-lib_1.0.17.bb |    2 +-
>>   recipes/alsa/alsa-lib_1.0.18.bb |    2 +-
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes/alsa/alsa-lib_1.0.11.bb 
>> b/recipes/alsa/alsa-lib_1.0.11.bb
>> index b9169e6..4d7c2e8 100644
>> --- a/recipes/alsa/alsa-lib_1.0.11.bb
>> +++ b/recipes/alsa/alsa-lib_1.0.11.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Alsa sound library"
>>   HOMEPAGE = "http://www.alsa-project.org"
>>   SECTION = "libs/multimedia"
>> -LICENSE = "GPL"
>> +LICENSE = "LGPL"
>>   PR = "r4"
>>
>>   # configure.in sets -D__arm__ on the command line for any arm system
>> diff --git a/recipes/alsa/alsa-lib_1.0.13.bb 
>> b/recipes/alsa/alsa-lib_1.0.13.bb
>> index 860ef11..03ab74f 100644
>> --- a/recipes/alsa/alsa-lib_1.0.13.bb
>> +++ b/recipes/alsa/alsa-lib_1.0.13.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Alsa sound library"
>>   HOMEPAGE = "http://www.alsa-project.org"
>>   SECTION = "libs/multimedia"
>> -LICENSE = "GPL"
>> +LICENSE = "LGPL"
>>   PR = "r4"
>>
>>   # configure.in sets -D__arm__ on the command line for any arm system
>> diff --git a/recipes/alsa/alsa-lib_1.0.14.bb 
>> b/recipes/alsa/alsa-lib_1.0.14.bb
>> index ba46342..284ddd9 100644
>> --- a/recipes/alsa/alsa-lib_1.0.14.bb
>> +++ b/recipes/alsa/alsa-lib_1.0.14.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Alsa sound library"
>>   HOMEPAGE = "http://www.alsa-project.org"
>>   SECTION = "libs/multimedia"
>> -LICENSE = "GPL"
>> +LICENSE = "LGPL"
>>
>>   PR = "r2"
>>
>> diff --git a/recipes/alsa/alsa-lib_1.0.15.bb 
>> b/recipes/alsa/alsa-lib_1.0.15.bb
>> index 4cf3938..b502adb 100644
>> --- a/recipes/alsa/alsa-lib_1.0.15.bb
>> +++ b/recipes/alsa/alsa-lib_1.0.15.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Alsa sound library"
>>   HOMEPAGE = "http://www.alsa-project.org"
>>   SECTION = "libs/multimedia"
>> -LICENSE = "GPL"
>> +LICENSE = "LGPL"
>>   PR = "r1"
>>
>>   # configure.in sets -D__arm__ on the command line for any arm system
>> diff --git a/recipes/alsa/alsa-lib_1.0.17.bb 
>> b/recipes/alsa/alsa-lib_1.0.17.bb
>> index f4ae21b..eff114d 100644
>> --- a/recipes/alsa/alsa-lib_1.0.17.bb
>> +++ b/recipes/alsa/alsa-lib_1.0.17.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Alsa sound library"
>>   HOMEPAGE = "http://www.alsa-project.org"
>>   SECTION = "libs/multimedia"
>> -LICENSE = "GPL"
>> +LICENSE = "LGPL"
>>
>>   # configure.in sets -D__arm__ on the command line for any arm system
>>   # (not just those with the ARM instruction set), this should be removed,
>> diff --git a/recipes/alsa/alsa-lib_1.0.18.bb 
>> b/recipes/alsa/alsa-lib_1.0.18.bb
>> index f4ae21b..eff114d 100644
>> --- a/recipes/alsa/alsa-lib_1.0.18.bb
>> +++ b/recipes/alsa/alsa-lib_1.0.18.bb
>> @@ -1,7 +1,7 @@
>>   DESCRIPTION = "Alsa sound library"
>>   HOMEPAGE = "http://www.alsa-project.org"
>>   SECTION = "libs/multimedia"
>> -LICENSE = "GPL"
>> +LICENSE = "LGPL"
>>
>>   # configure.in sets -D__arm__ on the command line for any arm system
>>   # (not just those with the ARM instruction set), this should be removed,
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



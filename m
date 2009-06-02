Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBU8F-00051W-OU
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 15:34:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBTzh-0003XJ-Id
	for openembedded-devel@openembedded.org; Tue, 02 Jun 2009 13:25:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 13:25:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 02 Jun 2009 13:25:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 02 Jun 2009 15:25:20 +0200
Message-ID: <h03980$s7u$1@ger.gmane.org>
References: <1243947084-813-1-git-send-email-k.kooi@student.utwente.nl>
	<4A25238D.1050005@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <4A25238D.1050005@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] Angstrom 2009.X: set version to 'stable'
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
X-List-Received-Date: Tue, 02 Jun 2009 13:34:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-06-09 15:05, Marco Cavallini wrote:
> Koen Kooi ha scritto:
>> From: Koen Kooi<koen@openembedded.org>
>>
>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>> ---
>>   conf/distro/angstrom-2008.1.conf     |    2 +-
>>   recipes/angstrom/angstrom-version.bb |    2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
>> index 5c7d0c4..203e01d 100644
>> --- a/conf/distro/angstrom-2008.1.conf
>> +++ b/conf/distro/angstrom-2008.1.conf
>> @@ -16,7 +16,7 @@
>>   # org.openembedded.angstrom-2007.12-stable branch
>>
>>   #DISTRO_VERSION = "2009.X"
>> -DISTRO_VERSION = "2009.X-test-${DATE}"
>> +DISTRO_VERSION = "2009.X-stable"
>>   DISTRO_REVISION = "1"
>>   DISTRO_PR = ".1"
>>
>> diff --git a/recipes/angstrom/angstrom-version.bb b/recipes/angstrom/angstrom-version.bb
>> index 6f1043c..4902ae7 100644
>> --- a/recipes/angstrom/angstrom-version.bb
>> +++ b/recipes/angstrom/angstrom-version.bb
>> @@ -2,7 +2,7 @@ LICENSE = "MIT"
>>
>>   PV = "${DISTRO_VERSION}"
>>   PR = "r2"
>> -PE = "1"
>> +PE = "2"
>>
>>   PACKAGES = "${PN}"
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> ACK


The format is:

Acked-by: Firstname Lastname <email@address.net>

Which means I'll now have a bogus Ack showing up in patchwork ;)




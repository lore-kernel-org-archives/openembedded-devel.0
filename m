Received: from smtpauth22.prod.mesa1.secureserver.net ([64.202.165.44])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PpsML-0006mt-0f
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 02:08:41 +0100
Received: (qmail 24689 invoked from network); 17 Feb 2011 01:00:48 -0000
Received: from unknown (209.242.7.132)
	by smtpauth22.prod.mesa1.secureserver.net (64.202.165.44) with ESMTP;
	17 Feb 2011 01:00:47 -0000
Message-ID: <4D5C7334.7020807@mwester.net>
Date: Wed, 16 Feb 2011 19:00:36 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>	<1297852433-31160-9-git-send-email-eric@eukrea.com>
	<20110216230047.GN14525@sakrah.homelinux.org>
In-Reply-To: <20110216230047.GN14525@sakrah.homelinux.org>
Subject: Re: [PATCH 09/10] slugos: prefer busybox 1.18.3
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
X-List-Received-Date: Thu, 17 Feb 2011 01:08:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/16/2011 5:00 PM, Khem Raj wrote:
> On (16/02/11 11:33), Eric Bénard wrote:
>> Signed-off-by: Eric Bénard <eric@eukrea.com>
>> Cc: Mike Westerhof <mike@mwester.net>
> 
> built ok with nslu2be/slugos
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Mike Westerhof <mike@mwester.net>

>> ---
>>  conf/distro/include/preferred-slugos-versions.inc |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
>> index 4b0edb8..cde3eb0 100644
>> --- a/conf/distro/include/preferred-slugos-versions.inc
>> +++ b/conf/distro/include/preferred-slugos-versions.inc
>> @@ -26,7 +26,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
>>  PREFERRED_VERSION_autoconf-native		?= "2.65"
>>  PREFERRED_VERSION_automake			?= "1.11.1"
>>  PREFERRED_VERSION_automake-native		?= "1.11.1"
>> -PREFERRED_VERSION_busybox			?= "1.18.2"
>> +PREFERRED_VERSION_busybox			?= "1.18.3"
>>  PREFERRED_VERSION_dbus				?= "1.4.1"
>>  PREFERRED_VERSION_glib-2.0			?= "2.26.1"
>>  PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
>> -- 
>> 1.7.0.4
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




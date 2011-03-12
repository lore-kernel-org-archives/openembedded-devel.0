Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyDBK-0005tD-7m
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 01:59:46 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 00A74D1A827
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 01:58:06 +0100 (CET)
Received: from [192.168.2.15] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C361FA6192
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 01:51:51 +0100 (CET)
Message-ID: <4D7AC3A6.9010104@eukrea.com>
Date: Sat, 12 Mar 2011 01:51:50 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299886498-22190-1-git-send-email-eric@eukrea.com>	<1299886498-22190-3-git-send-email-eric@eukrea.com>
	<20110312002524.GN5603@sakrah.homelinux.org>
In-Reply-To: <20110312002524.GN5603@sakrah.homelinux.org>
Subject: Re: [PATCH 2/2] bluez-hcidump: add 2.0
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
X-List-Received-Date: Sat, 12 Mar 2011 00:59:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12/03/2011 01:25, Khem Raj wrote:
> On (12/03/11 00:34), Eric B=C3=A9nard wrote:
>> Signed-off-by: Eric B=C3=A9nard<eric@eukrea.com>
>> ---
>>   recipes/bluez/bluez-hcidump_2.0.bb |   18 ++++++++++++++++++
>>   1 files changed, 18 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/bluez/bluez-hcidump_2.0.bb
>>
>> diff --git a/recipes/bluez/bluez-hcidump_2.0.bb b/recipes/bluez/bluez-=
hcidump_2.0.bb
>> new file mode 100644
>> index 0000000..94a7097
>> --- /dev/null
>> +++ b/recipes/bluez/bluez-hcidump_2.0.bb
>> @@ -0,0 +1,18 @@
>> +DESCRIPTION =3D "Linux Bluetooth Stack HCI Debugger Tool."
>> +SECTION =3D "console"
>> +PRIORITY =3D "optional"
>> +DEPENDS =3D "bluez-libs"
>> +LICENSE =3D "GPLv2"
>> +PR =3D "r0"
>> +
>> +DEFAULT_PREFERENCE =3D "-1"
>
> why DP -1 ?
>
because not yet tested on real hardware (which will arrive in 2 weeks, I'=
m=20
just upgrading the tools I'll then need ;)

Eric




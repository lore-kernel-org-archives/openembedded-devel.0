Received: from [209.85.219.166] (helo=mail-ew0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Lcium-0002QJ-Gm
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 17:16:48 +0100
Received: by ewy10 with SMTP id 10so693448ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2009 08:13:26 -0800 (PST)
Received: by 10.210.13.17 with SMTP id 17mr1020351ebm.45.1235664806693;
	Thu, 26 Feb 2009 08:13:26 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm26366eyg.37.2009.02.26.08.13.25
	(version=SSLv3 cipher=RC4-MD5); Thu, 26 Feb 2009 08:13:26 -0800 (PST)
Message-ID: <49A6BFA5.4070405@xora.org.uk>
Date: Thu, 26 Feb 2009 16:13:25 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <go4amc$h30$1@ger.gmane.org> <go6ah4$cud$1@ger.gmane.org>
In-Reply-To: <go6ah4$cud$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
Subject: Re: [RFC] update opkg* SRCREV to 201
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
X-List-Received-Date: Thu, 26 Feb 2009 16:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 25-02-09 21:46, Koen Kooi wrote:
>> Hi,
>>
>> I was getting seriously annoyed with the useless error codes opkg was
>> giving me and Tick pointed me to:
>>
>> http://code.google.com/p/opkg/issues/detail?id=6&can=1
>>
>> We're at 197 now in OE (with r201 applied as patch). I'd like to get
>> r199 and r200 in as well, and since I'm lazy I though we'd get r198 in
>> as well, which means instead of adding a few patches I can just bump up
>> SRCREV to 201.
>>
>> What do you think?
>
> Noone is thinking anything?
>
Sorry been AFK, my opinion of these things is always no-one will test
until stuff is committed anyway. So you might as well go ahead! Without
the bug reports tick won't be able to improve opkg.

Graeme (XorA)




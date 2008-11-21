Received: from [85.13.140.93] (helo=dd20204.kasserver.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1L3Zty-0007vm-61
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2008 18:34:42 +0100
Received: from [192.168.1.103] (unknown [77.21.130.13])
	by dd20204.kasserver.com (Postfix) with ESMTP id E9AB7180445F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 18:32:07 +0100 (CET)
Message-ID: <4926F095.8030007@opensimpad.org>
Date: Fri, 21 Nov 2008 18:32:05 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48E6624C.7000409@opensimpad.org>	<gc72hu$i8f$1@ger.gmane.org>	<48E758CB.7040209@opensimpad.org>	<48EB45F0.8080809@opensimpad.org>	<gcfi87$g4t$1@ger.gmane.org>	<48EB5730.8030700@opensimpad.org>
	<gcflhq$rfu$1@ger.gmane.org>
In-Reply-To: <gcflhq$rfu$1@ger.gmane.org>
Subject: Re: X/Qt2 opie integration (patches included)
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
X-List-Received-Date: Fri, 21 Nov 2008 17:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> On 07-10-2008 14:33, Bernhard Guillon wrote:
>> Koen Kooi schrieb:
>
>> What do you think about:
>>
>> xqtlauncher-blackbox-config.bb
>> xqtlauncher-xkbd-desktop.bb
>> xqtlauncher.bb having the above as rdepends?
>>
>> or
>> xqtlauncher-blackbox-config.bb
>> xqtlauncher-xkbd-desktop.bb
>> xqtlauncher.bb no depends except X/Qt2
>> and a task-xqtlauncher.
>> With this we could provide support for different window managers later.
>> Currently only blackbox is supported.
>>
>> or same as above but
>> xqt2-xqtlauncher-foo-bar.bb
>
> Option 2 seems nice.
>
It took a while but here [1] it is :)

Please have a look at it and comment.

best regards
Bernhard Guillon

[1] http://bugs.openembedded.net/show_bug.cgi?id=4603
[2] http://bugs.openembedded.net/show_bug.cgi?id=4582
[3] http://bugs.openembedded.net/show_bug.cgi?id=4861



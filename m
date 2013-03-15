Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1UGTBo-0008B3-KG
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 12:52:52 +0100
Received: (qmail 7892 invoked by uid 1003); 15 Mar 2013 11:29:23 -0000
Received: from unknown (HELO ?192.168.1.125?)
	(philip@opensdr.com@96.240.188.95)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	15 Mar 2013 11:29:23 -0000
Message-ID: <51430612.3040107@balister.org>
Date: Fri, 15 Mar 2013 07:29:22 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130219 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1363192654-5856-1-git-send-email-ftonello@cercacor.com>
	<khsn7t$31g$1@ger.gmane.org> <51426724.4050607@felipetonello.com>
	<khupfr$e4v$1@ger.gmane.org>
In-Reply-To: <khupfr$e4v$1@ger.gmane.org>
X-Enigmail-Version: 1.5.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH v3] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Fri, 15 Mar 2013 11:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/15/2013 05:26 AM, Koen Kooi wrote:
> Op 15-03-13 01:11, Felipe Ferreri Tonello schreef:
>> Hi Koen,
> 
>> On 03/14/2013 07:35 AM, Koen Kooi wrote: Op 13-03-13 17:37, 
>> eu@felipetonello.com schreef:
>>>>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>>>> 
>>>>> Fingerterm is a terminal emulator for Nokia Harmattan, but
>>>>> it works in any Qt4 environment.
>>>>> 
>>>>> This recipe can be extended by a .bbappend to add .desktop,
>>>>> icon and others to the target device.
> 
>> Why not include a default .desktop in the recipe so it actually
>> works out of the box?
> 
>>> The binary is been installed. So it will work out of the box.
> 
> Eh, no. You need a .desktop to launch it properly.
> 
> 
>>> Regarding the .desktop file, it is not installed by default
>>> because  it was done for MeeGo only. It needs some hack to work
>>> for generic desktops that follow desktop-entry spec[1].
> 
> Then add a .desktop that adheres to the spec, I see no reason why
> this recipe has to be so 'special' that it needs a .bbappend to
> work as intended.

We should minimize the need for distros to add bbappends to recipes to
add basic functions. This should be true for all layers.

bbappends for be for special use cases.

Philip

> 
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> 
> 



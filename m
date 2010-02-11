Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NfY3U-0005IZ-32
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 13:22:03 +0100
Received: from [192.168.0.100] (ip-81-210-245-1.unitymediagroup.de
	[81.210.245.1])
	by drlauer-research.com (Postfix) with ESMTP id 1E2CA58411C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 14:13:07 +0100 (CET)
References: <4B716436.6040301@dresearch.de>
	<1265784508-19281-1-git-send-email-sledz@dresearch.de>
	<4B73C297.70709@dresearch.de> <20100211084757.GE3378@jama>
	<4B73ED62.8060808@dresearch.de>
Message-Id: <22B019BE-6BD8-4748-A263-54A1CB919CA4@vanille-media.de>
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4B73ED62.8060808@dresearch.de>
X-Mailer: iPhone Mail (7D11)
Mime-Version: 1.0 (iPhone Mail 7D11)
Date: Thu, 11 Feb 2010 13:19:54 +0100
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] vala-dbus-binding-tool-0.1.3: new recipe
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
X-List-Received-Date: Thu, 11 Feb 2010 12:22:03 -0000
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed
Content-Transfer-Encoding: 7bit

Sounds good, feel free to move it.

Cheers,

:M:

Am 11.02.2010 um 12:43 schrieb Steffen Sledz <sledz@dresearch.de>:

> Martin Jansa wrote:
>>> No objections? So i will push this patch soon.
>>>
>>> Steffen
>>
>> I expect that you would move it to freesmartphone directory as is:
>> recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
>>
>> Even better if you can use BBCLASSEXTEND="native" to merge those 2
>> recipes together.
>
> I made this suggestion some messages before for myself. But for
> now there was no feedback on this.
>
> BTW: I would prefer recipes/vala-dbus-binding-tool/ because in my
> opinion this is not freesmartphone specific.
>
> Steffen
>



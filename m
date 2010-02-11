Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NfXUh-0001hn-Jc
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 12:46:07 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 73366491283;
	Thu, 11 Feb 2010 12:43:31 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 11 Feb 2010 12:44:32 +0100
Message-ID: <4B73ED62.8060808@dresearch.de>
Date: Thu, 11 Feb 2010 12:43:30 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B716436.6040301@dresearch.de>
	<1265784508-19281-1-git-send-email-sledz@dresearch.de>
	<4B73C297.70709@dresearch.de> <20100211084757.GE3378@jama>
In-Reply-To: <20100211084757.GE3378@jama>
X-OriginalArrivalTime: 11 Feb 2010 11:44:32.0600 (UTC)
	FILETIME=[93CC9D80:01CAAB0F]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: mickey@vanille-media.de
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
X-List-Received-Date: Thu, 11 Feb 2010 11:46:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Martin Jansa wrote:
>> No objections? So i will push this patch soon.
>>
>> Steffen
> 
> I expect that you would move it to freesmartphone directory as is:
> recipes/freesmartphone/vala-dbus-binding-tool-native_git.bb
> 
> Even better if you can use BBCLASSEXTEND="native" to merge those 2
> recipes together.

I made this suggestion some messages before for myself. But for
now there was no feedback on this.

BTW: I would prefer recipes/vala-dbus-binding-tool/ because in my
opinion this is not freesmartphone specific.

Steffen




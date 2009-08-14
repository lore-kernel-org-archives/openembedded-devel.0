Received: from [67.222.39.32] (helo=outbound-mail-152.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1MbySN-0001fX-4v
	for openembedded-devel@openembedded.org; Fri, 14 Aug 2009 17:12:39 +0200
Received: (qmail 9074 invoked by uid 0); 14 Aug 2009 14:56:00 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy5.bluehost.com with SMTP; 14 Aug 2009 14:56:00 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Identified-User;
	b=GOqDUDGk7yyT/73oHvFc1A4CNm0kMEDooAzpNew1c8mDMUZ9L/DzVeLQhgo3WGermOx9OUPQRI7m48ItjPZRWd4gnK9LQC2yItBbK6/10B0GD1Ua0+7W6FGmsMW5C2cf;
Received: from [222.131.143.214] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1MbyCF-0003e6-Er for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 08:56:00 -0600
Message-ID: <4A857AFC.5040509@linuxbj.com>
Date: Fri, 14 Aug 2009 22:55:56 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A84650F.1080902@linuxbj.com>	<200908140406.00714.holger+oe@freyther.de>	<4A850430.6060809@linuxbj.com>
	<h63suv$dje$1@ger.gmane.org>
In-Reply-To: <h63suv$dje$1@ger.gmane.org>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 222.131.143.214 authed with
	chow.ming@linuxbj.com}
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Fri, 14 Aug 2009 15:12:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Got it, thank you.
I will try the checksum stuff.

Rolf Leggewie wrote:
> Ming Chow 周明 wrote:
>   
>> BTW. I had experienced some checksum mismatch before. A few packages 
>> which just work can not pass checksum matching. I guess it may be caused 
>> by hosting or tarball changing without notice. For I am not very clear 
>> how the global checksum.ini is maintained. I lazily set 
>> OE_ALLOW_INSECURE_DOWNLOADS.
>>     
>
> Take a look at
> http://wiki.openembedded.net/index.php/Dealing_with_checksum_mismatch
>
> Let us know about the packages failing the checksum test so we can fix
> things.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   




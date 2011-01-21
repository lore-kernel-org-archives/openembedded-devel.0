Received: from blath.larsmichelsen.com ([78.46.117.178] helo=larsmichelsen.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lm@larsmichelsen.com>) id 1PgNfX-00027R-Bg
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 21:33:15 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by larsmichelsen.com (Postfix) with ESMTP id 784079544016
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 21:32:35 +0100 (CET)
Received: from larsmichelsen.com ([127.0.0.1])
	by localhost (blath.larsmichelsen.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id uAC4GyrF0tYB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 21:32:35 +0100 (CET)
Received: from [192.168.4.106] (e181050127.adsl.alicedsl.de [85.181.50.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: lm)
	by larsmichelsen.com (Postfix) with ESMTPSA id 1E9B89544005
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 21:32:35 +0100 (CET)
Message-ID: <4D39ED67.2030706@larsmichelsen.com>
Date: Fri, 21 Jan 2011 21:32:39 +0100
From: Lars Michelsen <lm@larsmichelsen.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2.104i Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295138727-6516-1-git-send-email-lm@larsmichelsen.com>
	<igumrj$3pp$1@dough.gmane.org>
In-Reply-To: <igumrj$3pp$1@dough.gmane.org>
Subject: Re: [PATCH] Added Europe/Berlin timezone to tzdata pkg
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
X-List-Received-Date: Fri, 21 Jan 2011 20:33:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Koen,

On 16/01/11 13:04, Koen Kooi wrote:
> We see you are adding Berlin right below Paris, which is the same TZ
> with the same DST rules.
>
> So if you only want to install tzdata and want to have 'date' show the
> correct time, use Europe/Paris. If you nationalism prevents you from
> doing that and you have some space left in your rootfs, install
> 'tzdata-europe' :)

Well, thanks for the hint. I am new to OE and need to get a feeling for 
the priorities. If the size is that important it is OK for me.

Even didn't know that the DST is exactly the same. My intend was to fix 
my local time and when it can be fixed with Europe/Paris I have no 
problem with it.

Regards,
Lars




Received: from [85.10.209.111] (helo=mail.road.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <u.luckas@road.de>) id 1J0b5v-0006n1-CS
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2007 12:10:11 +0100
Received: from slimfast.dyndns.org (unknown [192.168.254.1])
	by mail.road.de (Postfix) with ESMTP id 60D45390005;
	Fri,  7 Dec 2007 12:06:20 +0100 (CET)
Received: from [192.168.116.44] (ulitu.handy-pc.constin.de [192.168.116.44])
	by slimfast.dyndns.org (Postfix) with ESMTP id F1D6CAD400B;
	Fri,  7 Dec 2007 12:06:19 +0100 (CET)
Message-ID: <4759292B.3060300@road.de>
Date: Fri, 07 Dec 2007 11:06:19 +0000
From: Uli Luckas <u.luckas@road.de>
User-Agent: Mozilla-Thunderbird 2.0.0.4 (X11/20070828)
MIME-Version: 1.0
To: Hans Henry von Tresckow <hvontres@gmail.com>
References: <200711121044.32094.u.luckas@road.de>	
	<200711121102.51877.u.luckas@road.de>
	<a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
In-Reply-To: <a7f8874a0712051306i3cebae60sfd0a10987612afd0@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATHC] ATAG export for the linux kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2007 11:10:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hans Henry von Tresckow wrote:
> On Nov 12, 2007 2:02 AM, Uli Luckas <u.luckas@road.de 
> <mailto:u.luckas@road.de>> wrote:
>
>     And here comes the patch ...
>
>
> Tested on 2.6.21 and 2.6.17 for poodle. Thank you very much. Any 
> Chance you could push this upstream?
Hi Hans Henry, Richard and Mike

Hans Henry, thanks for testing. Good to know it worked for you. Let's 
see how
we can get this thing pushed upstream.

1) I put this on the OE list as the original code is maintained in OE. And
that's why I'd like the code to be pushed to the OE repository first.
I am not really an OE developer though. Is someone willing to do the OE
integration to give my patch a home?

2) I need to push the kernel patch via Russell. Mike, I have not heard your
opinion. Will you support this patch?

3) I need to push my userspace work. My work is based on code by Richard
though. Richard, please jump in and let us know how you'd like to proceede?

I'd really like to see kexec working on arm without any patches soon.  
Let's
see...

regards,
Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit




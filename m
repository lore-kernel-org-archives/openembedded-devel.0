Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1JegUo-0004jT-Up
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Mar 2008 02:01:36 +0100
Received: from [192.168.1.120] ([::ffff:118.166.66.232])
	(AUTH: PLAIN dp, SSL: TLSv1/SSLv3,256bits,AES256-SHA)
	by xora.org.uk with esmtp; Thu, 27 Mar 2008 01:01:33 +0000
	id 00041097.47EAF1ED.000075D2
Message-ID: <47EAF1E0.8090401@xora.org.uk>
Date: Thu, 27 Mar 2008 01:01:20 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla-Thunderbird 2.0.0.9 (X11/20080110)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47EAEB1D.9060004@xora.org.uk>
	<200803270150.46085.mickey@vanille-media.de>
In-Reply-To: <200803270150.46085.mickey@vanille-media.de>
Subject: Re: SCM scorecards
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
X-List-Received-Date: Thu, 27 Mar 2008 01:01:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mick
>> Ease of Serving Git 1 Monotone 5
>>     
>
> That bad?
>
>   
Well git supports no serving natively, so you have to decide which
tool you use. And if you want write access then decide infrastrucure
stuff. Compared to mtn serve thats quite complex.
>> Ease of Distributed SCM Git 2 Monotone 5
>>     
>
> Can you expand?
>   
Yes, mtn is designed to have many repos which are mirrors. From my
looks at git it is designed to always end up with one central repo.

The methods of syncing two git trees seem to be hacks or alter
data. master becomes origin/master for example.

And because you always have to pull before push, people cant
use upstreams in parrallel and the tool just works.

I might have missed a trick with git but that is my impression.

> Additionally I want to add:
>
> * 3rd party acceptance Git 5 Monotone 1
>
>   
This is a valid point.

Graeme




Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NLI4r-0006tf-Id
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 16:15:44 +0100
Received: (qmail 5423 invoked by uid 1003); 17 Dec 2009 15:13:52 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 17 Dec 2009 15:13:52 -0000
Message-ID: <4B2A4AAF.7010709@balister.org>
Date: Thu, 17 Dec 2009 10:13:51 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1261060246-15099-1-git-send-email-johan.hovold@lundinova.se>	<4B2A41C2.10802@balister.org>
	<20091217150855.GC32444@lundinova.se>
In-Reply-To: <20091217150855.GC32444@lundinova.se>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] wxwidgets: add 2.9.0 and clean up recipes
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
X-List-Received-Date: Thu, 17 Dec 2009 15:15:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2009 10:08 AM, Johan Hovold wrote:
>>>    recipes/wxwidgets/wxwidgets-ansi_2.9.0.bb          |    5 ++
>>>    recipes/wxwidgets/wxwidgets-opengl_2.9.0.bb        |    7 +++
>>>    recipes/wxwidgets/wxwidgets_2.9.0.bb               |    3 +
>>>    recipes/wxwidgets/wxwidgets_2.9.0.inc              |   44 ++++++++++++++++++++
>>
>> Shouldn't the include file be called wxwidgets-2.9.0.inc?
>
> You tell me. :) Both variants occur under recipes but dash (-) as you
> propose seem to be 2-3 times as common indeed. Shall I change it?

Yes :)

Philip

>
> Thanks,
> Johan
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



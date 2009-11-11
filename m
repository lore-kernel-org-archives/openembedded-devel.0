Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N8M9U-00005W-F0
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 23:59:05 +0100
Received: (qmail 25869 invoked by uid 1003); 11 Nov 2009 22:57:41 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 11 Nov 2009 22:57:41 -0000
Message-ID: <4AFB4163.9080208@balister.org>
Date: Wed, 11 Nov 2009 17:57:39 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>	<20091111154511.GA2761@denix.org>
	<20091111174317.GB11484@jama>	<4AFB059E.50801@balister.org>
	<1257976192.25369.434.camel@lenovo.internal.reciva.com>
In-Reply-To: <1257976192.25369.434.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Wed, 11 Nov 2009 22:59:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2009 04:49 PM, Phil Blundell wrote:
> On Wed, 2009-11-11 at 13:42 -0500, Philip Balister wrote:
>> Can people please get in the habit of using proper acks for patches?
>> This fishing though the random forms people are using is getting tiresome.
>>
>> For me: Acked-by: Philip Balister<philip@balister.org>
>>
>> Patchwork will pick these up, so it makes tracking things much easier.
>> Even if you agree to ack something in irc, please follow up with the
>> proper ack on the mailing list.
>
> What exactly does patchwork do with them?  From a casual browse of
> http://patchwork.openembedded.org/patch/1256/ it doesn't seem as if that
> line in your email has produced any different effect to the other
> replies in this thread.
>
>> From your comment about tracking being much easier, it seems like there
> must be something else going on that I am not spotting.  Maybe you could
> post a quick "idiot's guide to patchwork" or some such.

Real quick, click on the download mbox and you should see Grame's 
signed-off-by and Richard's Acked-by added to the patch. When you apply 
this to git, it will retain those lines.

I made mine not quit fit the format since I hadn't reviewed the patch.

The other reason is to use standard notation so people do not have to 
collect ack statements in various forms, from various sources. We should 
use the standard forms, not something we invent internally.

Philip

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



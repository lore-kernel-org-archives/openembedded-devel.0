Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NBSpf-0005N3-Gh
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 13:43:26 +0100
Received: (qmail 12008 invoked by uid 1003); 20 Nov 2009 12:41:57 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 20 Nov 2009 12:41:57 -0000
Message-ID: <4B068E93.1030501@balister.org>
Date: Fri, 20 Nov 2009 07:41:55 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911200514430.18485@localhost>	<4B068A46.8090701@balister.org>
	<alpine.LFD.2.00.0911200728270.9326@localhost>
In-Reply-To: <alpine.LFD.2.00.0911200728270.9326@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Upgrade guile from 1.8.6 to 1.8.7.
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
X-List-Received-Date: Fri, 20 Nov 2009 12:43:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dont't worry, I already applied it. The notes are for future reference.

On 11/20/2009 07:28 AM, Robert P. J. Day wrote:
> On Fri, 20 Nov 2009, Philip Balister wrote:
>
>> I applied this. A couple of comments for the future:
>>
>> 1) Make the commit message "guile: Upgrade from 1.8.6 to 1.8.7" for
>> consistency.
>>
>> 2) You can include the checksums in the recipe now. See:
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/curl/curl_7.19.7.bb
>>
>> look in the curl-common.inc file for the "tarball" naming.
>>
>> Thanks,
>>
>> Philip
>
>    ok, will resubmit properly shortly.  thanks.
>
> rday
> --
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



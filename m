Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1PKENj-0005xn-On
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 19:11:23 +0100
Received: (qmail 2231 invoked by uid 1003); 21 Nov 2010 18:10:07 -0000
Received: from adsl-75-37-22-143.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@75.37.22.143)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	21 Nov 2010 18:10:07 -0000
Message-ID: <4CE9607C.1050506@balister.org>
Date: Sun, 21 Nov 2010 10:10:04 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE739F6.5020303@balister.org>
	<AANLkTinq6+aKi37C5RvuaK6Ae7BT_vUZx6J39NHKz8t2@mail.gmail.com>
In-Reply-To: <AANLkTinq6+aKi37C5RvuaK6Ae7BT_vUZx6J39NHKz8t2@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.166
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Commit for the release
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
X-List-Received-Date: Sun, 21 Nov 2010 18:11:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/2010 11:53 PM, Khem Raj wrote:
> On Fri, Nov 19, 2010 at 7:01 PM, Philip Balister<philip@balister.org>  wrote:
>> Khem, I'd like this commit to go into the release branch. Any objections?
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=c59afd9fd456766c473c4fb7f7cc4db3e8623c39
>>
>
> Looks good to me. Do you want me to cherry pick it ?

Yes. Along with 8d91e8a1b6876c6b07cabbd94439eb9bdc295d87 (Thanks Eric).

Khem, have you thought about reviewing dev and merging from it, as long 
as there are no major changes? I'm concerned we may miss some commits 
that need to go in the release TAG.

Philip

>
>> Philip
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



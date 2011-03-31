Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Q5H9Q-0006LR-Pg
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 14:39:01 +0200
Received: (qmail 15168 invoked by uid 1003); 31 Mar 2011 12:36:35 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.183.40)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	31 Mar 2011 12:36:35 -0000
Message-ID: <4D947552.8020201@balister.org>
Date: Thu, 31 Mar 2011 08:36:34 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110331074506.GB23178@denix.org>
	<in1gf0$aun$1@dough.gmane.org>	<AANLkTikn4r-ScRstfT_r-Adw36=682MEb_XHMKn+qs3_@mail.gmail.com>	<in1n4g$hvs$1@dough.gmane.org>
	<AANLkTin8=R-0LBgbfKprsKuFCTL6DcU6em-dNAUv9Nrw@mail.gmail.com>
In-Reply-To: <AANLkTin8=R-0LBgbfKprsKuFCTL6DcU6em-dNAUv9Nrw@mail.gmail.com>
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
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
X-List-Received-Date: Thu, 31 Mar 2011 12:39:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans,

Before this spins into a long thread of who did what to who, let's try 
reinterpreting Koen's answer;

The pull request is in line with the policy from this branch defined in 
the wiki. Also, prior requests have also added new machines.

If you disagree with the policies that this branch is using, you may ask 
if the people using and maintaining the branch would like to update the 
policy to reflect no new machines will be added. If they disagree with 
you, and you still feel strongly, start your own support branch.

Philip

On 03/31/2011 07:57 AM, Frans Meulenbroeks wrote:
> 2011/3/31 Koen Kooi<koen@dominion.thruhere.net>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 31-03-11 12:51, Frans Meulenbroeks wrote:
>>> Adding new machines on a maintenance branch seems somewhat odd as new
>>> somewhat conflicts with maintenance.
>>> is this what we want? And if so, what about adding new recipes?
>>
>> Since you aren't using, developing or supporting 2011.03-maintenance, I
>> strongly object to your usage of 'we'.
>
> I don't think you know what I am using, let alone what I am developing
> at the moment, or my plans to support things.
>
> Also the we was a general tone of voice meaning "we as OE".
>
> But somehow I guess this is the hostile and unfriendly response to be
> expected from you.
> Instead of stimulating people to think with you, you bash them away.
> And then tomorrow complain that people do not participate.
> Now how would that come?
>>
>> Furthermore, this isn't the first time that new machines would get added
>> to 2011.03-maintenance.
>
> which might not be a good plan either.
>>
>> People really should read
>> http://wiki.openembedded.org/index.php/2011.03-maintenance
>
> Which does not speficy what should and should not be added
> (apart from:
> "Unless specific to code that no longer resides in a non-maintenance
> branch (ie master here or oe-core / meta-oe / etc) code must be a
> backport and should say where the code already resides (for ease of
> review, interoperability checking and so forth). "
> )
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



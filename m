Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1PI1HE-0007FV-L9
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 16:47:32 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 1AF1C16604E7; Mon, 15 Nov 2010 08:46:25 -0700 (MST)
Received: from localhost.localdomain (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 96E5F16601C7;
	Mon, 15 Nov 2010 08:46:19 -0700 (MST)
Message-ID: <4CE155CA.6000505@mlbassoc.com>
Date: Mon, 15 Nov 2010 08:46:18 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Fedora/3.1.6-1.fc13 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>	<AANLkTinuoktvgvT9V7OX1=FkMfeAgztmDaOCFMdH5x7d@mail.gmail.com>	<4CE02C8A.2040002@mentor.com>
	<AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
In-Reply-To: <AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Mon, 15 Nov 2010 15:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2010 12:23 PM, Yury Bushmelev wrote:
> 2010/11/14 Tom Rini<tom_rini@mentor.com>:
>> On 11/14/2010 11:11 AM, Frans Meulenbroeks wrote:
>>>
>>> 2010/11/12 Cliff Brake<cliff.brake@gmail.com>:
>>>>
>>>> testing-next is ready for clean builds.  Not many builds succeeded
>>>> last week--I suspect people have been busy:
>>>
>>> Actually my builds also succeeded (apart from the neek one which seem
>>> to require some more love). The autobuilder did it's job quite nicely,
>>> but I was just not around to verify the results and update the page.
>>> The neek requires at least the os2 patch.
>>>
>>> Testing 2010-11-12 gives the same results. updated the testing page.
>>
>> After my first week of doing some testing branch test builds I was thinking,
>> would some form of either automated result submitting or form-based result
>> submitting be a good idea?  We could try and use a google doc spreadsheet /
>> form, for example.  Thoughts?
>
> I'll prefer to use our oestats-server to auto-publish builds data.
> Oestats have complete information about builds.

Except when they don't :-(

I've tried to use this many times and there have been times when the oestats
results are stale or incorrect.  Sometimes a build completes, but the status
is not updated as such.  Similarly, when a build fails, that may or may not
show up as well.

I reported this to the list a couple of weeks ago, but there was no response
at all.  It's not all that important to me (so I moved on), but if you're
going to rely on it to be able to summarize the results from a given set of
builds, it may be important that it works reliably.


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------



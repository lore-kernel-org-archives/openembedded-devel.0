Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 10F0D73A54
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 20:55:04 +0000 (UTC)
Received: (qmail 9196 invoked by uid 1003); 10 Mar 2015 20:55:03 -0000
Received: from unknown (HELO ?192.168.11.101?)
	(philip@opensdr.com@71.171.10.241)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	10 Mar 2015 20:55:03 -0000
Message-ID: <54FF5A1D.90907@balister.org>
Date: Tue, 10 Mar 2015 16:54:53 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54ED1B78.4040101@balister.org>	<20150227083113.GF2309@jama>	<CAP9ODKqFPNyF4ZoXv0C1Jw==opnmrj+cWAEHUhr6nXbbXUKw6g@mail.gmail.com>
	<54FF59B5.20900@gmail.com>
In-Reply-To: <54FF59B5.20900@gmail.com>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2015 20:55:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/10/2015 04:53 PM, akuster808 wrote:
> 
> 
> On 02/27/2015 05:41 AM, Otavio Salvador wrote:
>> Hello Martin,
>>
>> On Fri, Feb 27, 2015 at 5:31 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>>>> Please pull these three patches into meta-oe/dizzy.
>>>>
>>>> https://github.com/openembedded/meta-oe/pull/19
>>>>
>>>> These lead to a working PyQt4, which will reduce the number of
>>>> questions
>>>> I get about gnuradio-companion not working on dizzy.
>>>
>>> I'm not sure if we should do upgrades in release branch which should
>>> receive only bug fixes, but I'll let daisy maintainers to decide.
>>
>> I agree with your concern but I also see the improvement
>> (cross-compile support and like) of the new PyQt4.
> 
> Sorry I have head down for the last two weeks.
> 
>>
>> At same time, I think this is not ready to be merged. Checking the
>> code changes I think we need to:
>>
>> * split python-sip runtime package
> 
> So is this split being worked on ?

Yes. I sent in patches yesterday. Thanks for checking.

Philip

> 
> - armin
>>
>> This will fix the upgrade path.
>>


Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id E8A4460CEB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 17:19:12 +0000 (UTC)
Received: (qmail 490 invoked by uid 1003); 7 Mar 2014 17:19:12 -0000
Received: from unknown (HELO ?192.168.1.146?)
	(philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	7 Mar 2014 17:19:12 -0000
Message-ID: <5319FF8F.3060608@balister.org>
Date: Fri, 07 Mar 2014 12:19:11 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAP71WjxZnBfp3agkiw+yGbLWE2p2gzgXGSQ+SBZi9zu+7-cpEQ@mail.gmail.com>
	<CAOd_LFyAkzdc4T-FjWh20-iNd7omPEwdhvJecKapUUo3pC0XaA@mail.gmail.com>
	<CACgAsMdwRRbraDhMCQ17JMDq_dC2AN7q=oXqvCWR96VDidziZA@mail.gmail.com>
In-Reply-To: <CACgAsMdwRRbraDhMCQ17JMDq_dC2AN7q=oXqvCWR96VDidziZA@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: using OE efficiently for development
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
X-List-Received-Date: Fri, 07 Mar 2014 17:19:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 03/07/2014 10:08 AM, Kevyn-Alexandre Paré wrote:
> Hi Nicolas,
> 
> On Thu, Mar 6, 2014 at 1:32 PM, Cliff Brake <cbrake@bec-systems.com> wrote:
> 
> <snip>
> 
>>
>> Here is another example using repo: https://github.com/kraj/angstrom-manifest
>>
>> The OE build system is complex, but is very flexible and works very
>> well.  The flexibility of fetching sources in different ways is nice,
>> as different parts of the system really need different tools (are they
>> under heavy development, etc) vs forcing everything to be in git, etc.
>>
> 
> Have seen kind of the same pattern as angstrom:
> https://github.com/gumstix/Gumstix-YoctoProject-Repo

I've also had good luck with this pattern for communicating with third
party builders.

Philip

> 
> -KA
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 


Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2962D65DAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 20:22:50 +0000 (UTC)
Message-ID: <535AC418.6070607@communistcode.co.uk>
Date: Fri, 25 Apr 2014 21:22:48 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1398450265-27979-1-git-send-email-raj.khem@gmail.com>	<20140425182652.GZ2486@jama>
	<CAMKF1soef650vnpY3ca8JAXTAiP4KqWk-ksMP=Afncdg5KsDwA@mail.gmail.com>
In-Reply-To: <CAMKF1soef650vnpY3ca8JAXTAiP4KqWk-ksMP=Afncdg5KsDwA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] htop: Update 1.0.2 -> 1.0.3
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
X-List-Received-Date: Fri, 25 Apr 2014 20:22:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 25/04/2014 19:56, Khem Raj wrote:
> On Fri, Apr 25, 2014 at 11:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> "[oe] [meta-oe][PATCH 1/4] htop: upgrade to 1.0.3 and apply brokensep"
>
> inheriting autotools-brokensep is a workaround until we have fixed the
>   package proper intention should be to not use autotools-brokensep and
> fix the packages and use autotools-brokensep as last resort.
>

I agree, my fixes were just quick ones today which got me building. I 
would take Khems patch over mine as it seems to actually address the 
problem.

Cheers,


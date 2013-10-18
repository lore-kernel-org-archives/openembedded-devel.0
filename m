Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 55E396CD55
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 10:09:31 +0000 (UTC)
Message-ID: <526108E2.4010608@communistcode.co.uk>
Date: Fri, 18 Oct 2013 11:09:38 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1382081248-6370-1-git-send-email-olof.johansson@axis.com>	<5260F68B.6090403@communistcode.co.uk>	<20131018094408.GA21192@jama>
	<20131018100430.GQ20888@axis.com>
In-Reply-To: <20131018100430.GQ20888@axis.com>
Subject: Re: [meta-oe][PATCH] rsyslog: fix dependency name (json-c => libjson)
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
X-List-Received-Date: Fri, 18 Oct 2013 10:09:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 18/10/13 11:04, Olof Johansson wrote:
> On Fri, Oct 18, 2013 at 09:51:23AM +0100, Jack Mitchell wrote:
>> The rsyslogd patches shouldn't really have gone in yet... I've fired off
>> a patch to oe-core to update libjson to the now named json-c, so if we
>> could hold off for a few days that would be great. Otherwise, maybe
>> temporarily revert the rsyslogd patches?
> 
> Ah, I didn't notice those patches. I see!
> 
> 
> On 13-10-18 11:44 +0200, Martin Jansa wrote:
>> Sorry about that, I was testing them together with json-c patch, so I
>> haven't noticed, can we temporary take this patch and then revert it
>> when (and if) libjson is renamed in oe-core (assuming that newer rsyslog
>> works with older libjson-0.9.
> 
> Either way is fine by me. I can fix it locally for us until the
> rename hits oecore.
> 
> 
> Thanks,
> 

I'm happy either way too. Whatever suits you best JaMa.

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


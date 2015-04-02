Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 38E3B6AC56
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Apr 2015 04:39:25 +0000 (UTC)
Received: by pdea3 with SMTP id a3so25747136pde.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=AoTXMnl0QG6eWBCNnSvSmxO3tCw+rcld2CgcBL8bh9M=;
	b=UUoDHLOJM8lK3tnlnxjG1AeAlJVNGp9EBOpcTNKUSN5nxpieQy+DIb5YmZ4geN8JPd
	dpJdbnVS46j4geBC3aBpsuIDGBOw39kMU5OqnqhXrRH1l82OH7e/1aqq8i+wR8ZE1N0W
	UGPY0LGbIASHBxBjwlgN0djW3TN2zszrkZQDZ7u5RDF86SuugD4zUJGG5uWUlYxVeIve
	hWn7jDG324NwgLEh1nTd74J+Vhc8cBRPj/cQD51/kpi1V8hDgQiFVWUwUZeMLU0QcEgv
	dO7NKibby9gqB2Tbj1BpMY+pdJiRAfd9TYgU7HxigXebI6CnwxpgtwGzzpqZVG1zYZ4W
	s8Wg==
X-Received: by 10.70.43.198 with SMTP id y6mr83789109pdl.85.1427949567125;
	Wed, 01 Apr 2015 21:39:27 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:957f:ec67:f3ef:46c3?
	([2601:c:a700:3ba7:957f:ec67:f3ef:46c3])
	by mx.google.com with ESMTPSA id fl4sm3727025pab.8.2015.04.01.21.39.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 21:39:26 -0700 (PDT)
Message-ID: <551CC7F3.9080300@gmail.com>
Date: Wed, 01 Apr 2015 21:39:15 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
References: <54F47045.4080503@windriver.com> <20150302142645.GC2309@jama>
In-Reply-To: <20150302142645.GC2309@jama>
Subject: Re: Discuss: ruby-1.9.x EOL -- someone to add ruby-2.2?
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
X-List-Received-Date: Thu, 02 Apr 2015 04:39:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Randy,


On 03/02/2015 06:26 AM, Martin Jansa wrote:
> On Mon, Mar 02, 2015 at 09:14:29AM -0500, Randy MacLeod wrote:
>>
>> As stated in the post below, ruby-1.9.3 is no longer supported
>> and CVEs will not be released.
>>
>> I'm not a rubyist but I assume we should upgrade to ruby-2.2.0 which
>> became the stable version as of December 25, 2014. Comments?
>> Martin, you are listed as maintainer of the meta-multimedia,
>> do you have any concerns about such an upgrade?
>
> No concerns from me.. I don't use ruby much (mostly ruby-native for
> webkit builds) so I would welcome such upgrade.
>
>> If anyone wants to start work on this for meta-oe, that'd be great.
>> If no one gets around to it, then a developer from WindRiver will
>> likely be able to work on it but not a few months.

I started on the upgrade. Hope to have it done soon.
- Armin

>>
>> ../Randy
>>
>> ---
>> As of today, all support for Ruby 1.9.3 has ended. Bug and security
>> fixes from more recent Ruby versions will no longer be backported to 1.9.3.
>>
>> This end of life was announced over a year ago.
>>
>> We highly recommend that you upgrade to Ruby 2.0.0 or above as soon as
>> possible. Please contact us if you’d like to continue maintaining the
>> 1.9.3 branch or if for some reason you can’t upgrade.
>>
>> Posted by Olivier Lacan on 23 Feb 2015
>> ---
>> Also see:
>> https://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering
>>
>> --
>> # Randy MacLeod. SMTS, Linux, Wind River
>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200 Ottawa, Ontario,
>> Canada K2K 2W5
>
>
>


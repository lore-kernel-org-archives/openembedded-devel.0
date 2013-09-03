Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 702AF6C05F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:56:52 +0000 (UTC)
Received: (qmail 26083 invoked by uid 89); 3 Sep 2013 15:56:42 -0000
Received: from unknown (HELO ?10.0.0.129?) (erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 15:56:42 -0000
Message-ID: <522606A5.5020903@movis.dk>
Date: Tue, 03 Sep 2013 17:56:21 +0200
From: "Emil R. Petersen" <erp@movis.dk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1378222415-13643-1-git-send-email-erp@movis.dk>
	<20130903154414.GD12638@axis.com> <522604DB.4040602@movis.dk>
	<20130903155450.GE12638@axis.com>
In-Reply-To: <20130903155450.GE12638@axis.com>
Subject: Re: [meta-perl] libwww-perl_5.834: added
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
X-List-Received-Date: Tue, 03 Sep 2013 15:56:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hmm alright, I will do this from now. And my other patch was send in 
before your reply reached me.

On 03/09/13 17:54, Olof Johansson wrote:
> On 13-09-03 17:48 +0200, Emil R. Petersen wrote:
>> Oh? Well I wouldn't have added them if I thought they were core modules.
>>
>> MIME::Base64 has it's own CPAN entry:
>> https://metacpan.org/release/MIME-Base64
> Many of the core modules have a dual life, both in core and on
> CPAN.
>
>> And does not appear, immediately, to be part of the core distribution?
> There's a command called "corelist" that is really useful to
> determine if a module is core or not. Not only does it say if its
> core or not, but also what perl version introduced it as a core
> module.
>
> $ corelist MIME::Base64
>
> MIME::Base64 was first released with perl v5.7.3
>
>
> Regards,


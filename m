Received: from [209.85.200.172] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1LmDWA-0001QA-5p
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 21:46:38 +0100
Received: by wf-out-1314.google.com with SMTP id 25so3669972wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=78T+71T64/ClP6sUgDbsS1tmTSuU1mTWe3RdzoTKkbA=;
	b=sNhCpWwrZxxXvwB6iCFGjKiEMO+FKkpp034i8hpHdJBAYGUTeNGc4ugJFUjRsJH15N
	NMvoWv73C/ZzKvg8OE6Fb0ylV4gSeMl6YWnpWDbt6C/aBcuJVPriP/nlUr8hebz3wyQo
	JdRcmwQZf1fVDIWiQR6ys+NBQK0YvccyP5Bho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=WUnXubPAfzGx65WaTygujav0bq4hFkPEc1/0tylUIBcdG8X5vsOYLOkdUq5FiAtr0K
	YMATMMMSWUVerMT02uEIFK1WxLjryCD7HKSFSSUnKQbJBFM5xYwdxOhvoQ8hZ03ROakS
	TbyIbbkWBXdhixfODY+LTkOAHufdazNCoyKbw=
Received: by 10.142.171.3 with SMTP id t3mr3543802wfe.195.1237927507223;
	Tue, 24 Mar 2009 13:45:07 -0700 (PDT)
Received: from ?172.31.11.36? (mscitspubwlgw.wustl.edu [128.252.55.250])
	by mx.google.com with ESMTPS id 30sm279144wfd.15.2009.03.24.13.45.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Mar 2009 13:45:06 -0700 (PDT)
Message-ID: <49C94647.2040401@gmail.com>
Date: Tue, 24 Mar 2009 15:44:55 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<1237885606.5348.8.camel@dax.rpnet.com>	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>	<49C93237.7010205@gmail.com>
	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
In-Reply-To: <dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 20:46:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/24/2009 03:30 PM, Lon Lentz wrote:
>   Please excuse my ignorance here, but what happens when a package literally
> has no maintainer?
> 
>   Is OE attempting to manage a consumer facing product or provide a
> centralized clearinghouse and methodology as a service to developers?

I think you took the word "responsibility" too seriously.

Regards
Gordon


> On Tue, Mar 24, 2009 at 4:01 PM, Chris Larson <clarson@kergoth.com> wrote:
> 
>> I don't think the current method is difficult, persay, but rather I'd
>> like to see:
>> - More individual responsibility in the project in general,
>> particularly in class and recipe maintenance.
>> - Clearer delineation between what gets the most attention and what does
>> not.
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 




Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rod@whitby.id.au>) id 1KNz7d-0006NB-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jul 2008 02:00:53 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 9BC0E14DDC4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 19:59:13 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 29 Jul 2008 19:59:13 -0400
X-Sasl-enc: wAPZHelx+k9WGkCYjVAjUY/ENSK1xhvYDqwoNcuWhyk2 1217375953
Received: from [192.168.124.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTPSA id E456B21948
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2008 19:59:12 -0400 (EDT)
Message-ID: <488FAE77.7050107@whitby.id.au>
Date: Wed, 30 Jul 2008 09:27:43 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.16 (Windows/20080708)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1217340989.5482.10.camel@dax.rpnet.com>
In-Reply-To: <1217340989.5482.10.camel@dax.rpnet.com>
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 00:00:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> There is also the issue of commit ID naming. I'm tempted to propose we
> use commit IDs with a domain such as userid@developers.openembedded.org.
> This would allow email redirection should we ever want it without
> interfering with the main domain. The alternative is to let people use
> their own domains but this means the IDs change when people change email
> address and isn't really consistent for the metadata and maintaining a
> single identity. I'm really open to opinions on this though. 

Just use real email addresses.  If someone doesn't want to use their 
current home or work email address, or has an address that they don't 
own (and therefore will change in the future), they can easily get a 
google mail or yahoo mail account purely for a commit email address.

The Linux kernel uses real email addresses.  Why would OE do something 
different?

Since the git commit Id is always "Real Name <email@address>" (not just 
a raw email address) then the Real Name will usually stay the same 
irrespective of the email address changing - this provides the desired 
continuity of identification.

-- Rod



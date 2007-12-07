Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J0kVD-0004TL-5f
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Dec 2007 22:12:55 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 9952170DF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2007 16:09:03 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 07 Dec 2007 16:09:03 -0500
X-Sasl-enc: 7mmxvCXnZ5bmed8sEbddH+MU0YelQEFnOTnvb9v4vawF 1197061743
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id C40BEBB92
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2007 16:09:02 -0500 (EST)
Message-ID: <4759B640.4040002@whitby.id.au>
Date: Sat, 08 Dec 2007 07:38:16 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <474EA852.7090306@whitby.id.au>	<474ECF9A.6050603@student.utwente.nl>	<b6ebd0a50711290902te78ad84hd8cf64829a66c95@mail.gmail.com>	<474FF886.7060308@whitby.id.au>	<b6ebd0a50711300859l392f9b43i8168d2377fb8c852@mail.gmail.com>
	<19c1b8a90712071139w299bab68k8005b8cc8d1116da@mail.gmail.com>
In-Reply-To: <19c1b8a90712071139w299bab68k8005b8cc8d1116da@mail.gmail.com>
Subject: Re: RFC: auto eth0 and auto eth1 in netbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2007 21:12:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
>> On Nov 30, 2007 4:48 AM, Rod Whitby <rod@whitby.id.au> wrote:
>>> Based on the feedback, I'll add 'auto eth0'.
> 
> fwiw with this change my nfsrooted rfs does not boot. I think its a
> nice to have nfsroot option for dev work.

Do you have any more details on why it doesn't work, and do you have a
recommendation on how to meet both requirements?

(I don't use nfsroot with OE myself, so you'll need to give more details
and help debug why it doesn't work)

-- Rod



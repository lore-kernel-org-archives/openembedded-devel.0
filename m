Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmVcs-00015Z-O4
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 17:06:46 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmVbK-0006lj-29
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 11:05:10 -0500
Message-ID: <49CA5638.1050000@dls.net>
Date: Wed, 25 Mar 2009 11:05:12 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>	<49C93237.7010205@gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org>
In-Reply-To: <gqd31s$5vk$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 25 Mar 2009 16:06:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 25-03-09 09:51, Frans Meulenbroeks wrote:
> 
>> and a last last thing: about the vetting: not sure whether I fully
>> understand the idea, but is a lot of this info on what builds on what
>> not already present in tinderbox?
> 
> The tinderbox data is purged periodically, so don't depend on it.

In addition, you cannot determine which builds in tinderbox were done
with an empty TMPDIR -- and unless you have an empty TMPDIR, there's
really no complete test.

-Mike (mwester)



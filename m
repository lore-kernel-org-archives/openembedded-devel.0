Received: from mail.dns-net.ch ([195.160.190.3] helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1OBnUE-0000nE-1V
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 13:18:56 +0200
Received: from [172.16.145.92] (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id 1AF0E37089
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 13:15:01 +0200 (CEST)
Message-ID: <4BE93C34.2010503@acn-group.ch>
Date: Tue, 11 May 2010 13:15:00 +0200
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE9181D.3060307@acn-group.ch> <hsb807$365$1@dough.gmane.org>
In-Reply-To: <hsb807$365$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 195.160.190.3
X-SA-Exim-Mail-From: c.aeschlimann@acn-group.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [Hawkboard] OE u-boot image
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
X-List-Received-Date: Tue, 11 May 2010 11:18:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 11.05.2010 11:28, Koen Kooi a =E9crit :

> On 11-05-10 10:41, Christophe Aeschlimann wrote:
>> Hi,
>>
[...]
>> Did someone successfully booted the hawkboard through UART with the
>> u-boot image built with OpenEmbedded ?
>
> I use tftp to load such stuff. I'm too lazy to use that overcomplicated=
,
> windows-only AISgen.

Thanks for the comment.

I can use tftp on a board that would already have u-boot on it but what=20
if my NAND is clean ?

Regards,

Christophe


>
> regards,
>
> Koen



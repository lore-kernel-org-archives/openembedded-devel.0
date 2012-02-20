Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1RzbBu-0004sM-JX
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 22:54:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 8664031590FA;
	Mon, 20 Feb 2012 22:46:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id MzDhFe69huLt; Mon, 20 Feb 2012 22:46:14 +0100 (CET)
Received: from [172.22.22.61] (drms-590ecde1.pool.mediaWays.net
	[89.14.205.225])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 794CC3146807;
	Mon, 20 Feb 2012 22:46:14 +0100 (CET)
Message-ID: <4F42BF25.4010100@opendreambox.org>
Date: Mon, 20 Feb 2012 22:46:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1329745909-21013-1-git-send-email-eric@eukrea.com>
	<4F429115.3070907@opendreambox.org>
	<CAMKF1soWPAX9S06t3JJb1LZdFUozr+AQ89=apxbXkZWz_ShcVQ@mail.gmail.com>
In-Reply-To: <CAMKF1soWPAX9S06t3JJb1LZdFUozr+AQ89=apxbXkZWz_ShcVQ@mail.gmail.com>
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe] vsftpd: add new package
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
X-List-Received-Date: Mon, 20 Feb 2012 21:54:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20.02.2012 21:15, Khem Raj wrote:
> On Mon, Feb 20, 2012 at 10:29 AM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> +LICENSE = "GPL-2.0-with-OpenSSL-exception"
> 
> there might be a different way to represent that

Obviously. And maybe someone will eventually find out which different
way there is and why it's preferred over any other way.

Anyway, this was inspired by OE-core's socat recipe, which uses
"GPL-2.0+-with-OpenSSL-exception".

Any other useful comments?

Regards,
Andreas




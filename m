Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OLmCz-0007zX-Ko
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 01:58:23 +0200
Received: by fg-out-1718.google.com with SMTP id d23so1270227fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jun 2010 16:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=A3cI/4YIjoUCLHGexQpqcusYrPr2TiyWD7lfr7HvvJM=;
	b=gfeeG1uKQOtWVjKxOJ3uKAmHnAd8TYkUta9uam7aWuaX5nUzcxqCj1V97p3WzVqAea
	5pSKLNPuC/y4qffJ3mzRFqM/Uk/+fYNuIxrJ7FG4SVpHCvQZUYHBF+hPOLBEbTWYfwbC
	NvkvyOvpsgimxVr5CDTPBXa0nom9LIERhxi4I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=aN10n0NuN07TLsgvQgPk8aDrLbc8zMbbfjZi0VhIFv341La0dq1/Mb6wQPWama1KWN
	S3fKZf8RHUaXDYiZaC9r3rH7Q10AVc6apIJsAzu5YCFlgIr8SFUBT87zwebafX2gDBT7
	sonOJgLkNVVollkVkpg5o0LVwTxhq4fRNP9DQ=
Received: by 10.87.66.14 with SMTP id t14mr23910160fgk.64.1275954843372;
	Mon, 07 Jun 2010 16:54:03 -0700 (PDT)
Received: from [192.168.5.27] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id d8sm13505352fga.6.2010.06.07.16.54.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Jun 2010 16:54:02 -0700 (PDT)
Message-ID: <4C0D8696.3060108@gmail.com>
Date: Tue, 08 Jun 2010 01:53:58 +0200
From: =?ISO-8859-1?Q?Matthias_G=FCnther?= <matgnt@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
	<20100607211130.GA10985@denix.org>
In-Reply-To: <20100607211130.GA10985@denix.org>
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4: Add 4.7.0-beta1
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
X-List-Received-Date: Mon, 07 Jun 2010 23:58:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07.06.2010 23:11, Denys Dmytriyenko wrote:
> On Sat, Jun 05, 2010 at 11:04:29PM +0200, Matthias G??nther wrote:
>> Hello.
>>
>> As announced earlier, here are the qt4 patches. The build works well with 
>> the latest OE.
> 
> Thanks! I'm still learning QML, but now I should be able to do tests on the 
> target! :)

QML is really interesting! I'm sure it will make its way :)
Btw, the recipe is already in OE.

Regards,
Matthias



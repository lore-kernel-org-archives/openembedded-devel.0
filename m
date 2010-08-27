Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Ooymo-00017S-R4
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 15:16:12 +0200
Received: by qwa26 with SMTP id 26so527845qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=gAi9bzw8kOKUqPC5W4fNoEHL6lVK1+Sun27TqjTOWqg=;
	b=K67v4O6Y2ZGiTifFss8i4fpkUeEeg0M1DzJshQEs3E9OV3HSlCRUC7/2B+ottmbnLk
	N8oKP0qulhprhugek/h1SxLh7zomShsMTj6lzO/9oIlLN8RW4M0e2hJPZnd2uoxX/l2n
	axvorvmHFZAMmvrbyZpAYKW+TRCww1Y7z7SVg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=N9hx2g6O9+NGbAVVfJMg2OnBN7KTbacgircGaSrVEUluPYfWDeGNFNmkV/JXg3RwqQ
	u9FNlQ3dvqSfPqli/bQdpd9Zh0HlpuBmt3GmalxTR0oxQ0ZoIEFVwF1wIlCznr4FX5Uw
	9ORDwKteEQ8AnVkLv9Fg3gJdfKGaEcH0j7+9U=
MIME-Version: 1.0
Received: by 10.224.64.159 with SMTP id e31mr311793qai.297.1282914930550; Fri,
	27 Aug 2010 06:15:30 -0700 (PDT)
Received: by 10.229.27.204 with HTTP; Fri, 27 Aug 2010 06:15:30 -0700 (PDT)
In-Reply-To: <AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
Date: Fri, 27 Aug 2010 15:15:30 +0200
Message-ID: <AANLkTikFF89LgDVa7VOHTCxEVu9BfNBEFOEbov6N-xJK@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 13:16:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 27, 2010 at 2:13 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>>  recipes/udev/udev-compat141_141.bb                 |    6 ++-
>>
>> NAK
>>
>
> This one is an hack in progress, needed only for Zaurus until 2.6.36
> (hopefully).
> Please keep ;)
>
> Andrea
>


BTW grepping in conf should have revealed some pinned versions (this
one was in conf/machine/include/zaurus-2.6.inc).

Regards and thx for your work

Andrea


